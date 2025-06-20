import datetime
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import Permission, User
from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect
from .forms import PassengerInfoForm
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from datetime import date
from .models import City, Airport, Airplane, Flight, CabinPricing, Passenger, TransactionRecord, SecondFlight
from booksystem import models
from django.db.models import Q
import decimal
from django.db import transaction, IntegrityError

#登录页面
def login_user(request):
    if request.method == "POST":
        username = request.POST.get('username', '')
        password = request.POST.get('password', '')
        user = authenticate(username=username, password=password)
        if user is not None:
            login(request, user)
            context = {'username': request.user.username}
            if user.is_superuser:
                return redirect('/booksystem/admin/')  # 如果是管理员，跳转到管理员页面
            else:
                return redirect('booksystem:search')
        else:
            return render(request, 'booksystem/login_user.html', {'error_message': '登录失败，请检查用户名和密码'})
    return render(request, 'booksystem/login_user.html')

def index(request):
    return render(request, 'booksystem/login_user.html')
#注册页面
def register_user(request):
    if request.method == "POST":
        username = request.POST.get('username', '').strip()
        password = request.POST.get('password', '').strip()
        if User.objects.filter(username=username).exists():
            return render(request, 'booksystem/register_user.html', {'error_message': '用户名已存在'})
        try:
            user = User.objects.create_user(username=username, password=password)
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('booksystem:search')
        except IntegrityError:
            return render(request, 'booksystem/register_user.html', {'error_message': '用户名已存在'})
    return render(request, 'booksystem/register_user.html')

#确认登出
def confirm_logout(request):
    if request.method == "GET":
        logout(request)
    return render(request, 'booksystem/confirm_logout.html')

#购退票成功页面
@login_required
def booked_result(request):
    message = '购票成功'
    return render(request, 'booksystem/booked_result.html', {'message': message})

@login_required
def ticket_record(request):
    user = request.user
    # 查姓名等于当前用户名的乘客
    passenger_q = Passenger.objects.filter(name=user.username)
    purchase_qs = TransactionRecord.objects.filter(
        Q(passenger__in=passenger_q) | Q(buyer=user)
    ).order_by('flight_number', 'operation_date', 'transaction_id')
    # 统计每张票的购票和退票数量
    ticket_dict = {}  # key: (flight_number, cabin_class), value: [购票数, 退票数, 最新购票记录]
    for record in purchase_qs:
        key = (record.flight_number_id, record.cabin_class, record.passenger.name)
        if key not in ticket_dict:
            ticket_dict[key] = [0, 0, None]
        if record.operation_type == 'purchase':
            ticket_dict[key][0] += 1
            ticket_dict[key][2] = record  # 保存最新的购票记录
        elif record.operation_type == 'refund':
            ticket_dict[key][1] += 1
    # 只展示购票数 > 退票数的票（即未退的票），并展示最新的购票记录
    tickets = []
    for key, (purchase_count, refund_count, record) in ticket_dict.items():
        if purchase_count > refund_count and record is not None:
            tickets.append(record)
    # 退票操作
    if request.method == "POST":
        transaction_id = request.POST.get('transaction_id')
        # 找到要退票的购票记录
        refund_record = TransactionRecord.objects.get(transaction_id=transaction_id)
        # 添加一条退票记录
        TransactionRecord.objects.create(
            passenger=refund_record.passenger,
            flight_number=refund_record.flight_number,
            cabin_class=refund_record.cabin_class,
            operation_date=date.today(),
            operation_type='refund',
            transaction_price=refund_record.transaction_price,
            buyer=user
        )
        return redirect('booksystem:ticket_record')

    return render(request, 'booksystem/ticket_record.html', {'tickets': tickets})

#搜索页面
def get_remaining_seats(flight):
    """
    返回该航班剩余的头等舱和经济舱座位数
    """
    airplane = flight.airplane
    # 统计头等舱
    first_purchase = TransactionRecord.objects.filter(
        flight_number=flight,
        cabin_class='first',
        operation_type='purchase'
    ).count()
    first_refund = TransactionRecord.objects.filter(
        flight_number=flight,
        cabin_class='first',
        operation_type='refund'
    ).count()
    first_class_left = airplane.first_class_seats - first_purchase + first_refund

    # 统计经济舱
    economy_purchase = TransactionRecord.objects.filter(
        flight_number=flight,
        cabin_class='economy',
        operation_type='purchase'
    ).count()
    economy_refund = TransactionRecord.objects.filter(
        flight_number=flight,
        cabin_class='economy',
        operation_type='refund'
    ).count()
    economy_class_left = airplane.economy_class_seats - economy_purchase + economy_refund

    return {
        'first_class_left': max(first_class_left, 0),
        'economy_class_left': max(economy_class_left, 0)
    }

def get_min_price_with_seat(info):
    # 优先经济舱且有余票
    if info.get('economy_class_left', 0) > 0 and info.get('economy_class_price') is not None:
        return float(info['economy_class_price'])
    # 否则头等舱且有余票
    if info.get('first_class_left', 0) > 0 and info.get('first_class_price') is not None:
        return float(info['first_class_price'])
    # 否则无票
    return 0.0

def get_flight_with_transfer_info(flight, time_format):
    """
    返回一个dict,包含该航班的所有信息(如为联程则包含两段,否则为直飞),机场字段为名字
    并自动计算总时长、中转时长、飞行时长
    """
    seats = get_remaining_seats(flight)
    first_price = CabinPricing.objects.filter(flightnumber=flight, cabin_class='first').first()
    economy_price = CabinPricing.objects.filter(flightnumber=flight, cabin_class='economy').first()
    first_price_value = first_price.price if first_price else None
    economy_price_value = economy_price.price if economy_price else None
    second = SecondFlight.objects.filter(flight=flight).first()
    
    if second:
        # 联程航班
        # 第一段起飞和到达
        first_departure_dt = datetime.datetime.combine(flight.departure_date, flight.departure_time)
        first_arrival_dt = datetime.datetime.combine(second.transfer_date, second.transfer_time)
        # 第二段起飞和到达
        second_departure_dt = datetime.datetime.combine(second.departure_date, second.departure_time)
        second_arrival_dt = datetime.datetime.combine(flight.arrive_date, flight.arrival_time)
        # 计算时长
        total_duration = second_arrival_dt - first_departure_dt
        transfer_duration = second_departure_dt - first_arrival_dt
        air_duration = (first_arrival_dt - first_departure_dt) + (second_arrival_dt - second_departure_dt)
        return {
            'type': 'transfer',
            'first_flight_number': flight.flight_number,
            'first_departure_airport': flight.departure_airport.name,
            'first_departure_city': flight.departure_airport.city.city_name,
            'first_arrival_airport': second.transfer_airport.name,
            'first_arrival_city': second.transfer_airport.city.city_name,
            'first_departure_date': flight.departure_date.strftime('%Y-%m-%d'),
            'first_departure_time': flight.departure_time.strftime(time_format),
            'departure_date': flight.departure_date.strftime('%Y-%m-%d'),
            'departure_time': flight.departure_time.strftime(time_format),
            'first_arrival_date': second.transfer_date.strftime('%Y-%m-%d'),
            'first_arrival_time': second.transfer_time.strftime(time_format),
            'arrival_date': second.transfer_date.strftime('%Y-%m-%d'),
            'arrival_time': second.transfer_time.strftime(time_format),
            'second_flight_number': second.second_flight,
            'second_departure_airport': second.transfer_airport.name,
            'second_departure_city': second.transfer_airport.city.city_name,
            'second_arrival_airport': flight.arrival_airport.name,
            'second_arrival_city': flight.arrival_airport.city.city_name,
            'second_departure_date': second.departure_date.strftime('%Y-%m-%d'),
            'second_departure_time': second.departure_time.strftime(time_format),
            'second_arrival_date': flight.arrive_date.strftime('%Y-%m-%d'),
            'second_arrival_time': flight.arrival_time.strftime(time_format),
            'first_class_left': seats['first_class_left'],
            'economy_class_left': seats['economy_class_left'],
            'first_class_price': first_price_value,
            'economy_class_price': economy_price_value,
            # 新增时长信息
            'total_duration': str(total_duration),
            'transfer_duration': str(transfer_duration),
            'air_duration': str(air_duration),
        }
    else:
        # 直飞航班
        departure_dt = datetime.datetime.combine(flight.departure_date, flight.departure_time)
        arrival_dt = datetime.datetime.combine(flight.arrive_date, flight.arrival_time)
        total_duration = arrival_dt - departure_dt
        return {
            'type': 'direct',
            'flight_number': flight.flight_number,
            'departure_airport': flight.departure_airport.name,
            'departure_city': flight.departure_airport.city.city_name,
            'arrival_airport': flight.arrival_airport.name,
            'arrival_city': flight.arrival_airport.city.city_name,
            'departure_date': flight.departure_date.strftime('%Y-%m-%d'),
            'departure_time': flight.departure_time.strftime(time_format),
            'arrival_date': flight.arrive_date.strftime('%Y-%m-%d'),
            'arrival_time': flight.arrival_time.strftime(time_format),
            'first_class_left': seats['first_class_left'],
            'economy_class_left': seats['economy_class_left'],
            'first_class_price': first_price_value,
            'economy_class_price': economy_price_value,
            # 新增总时长
            'total_duration': str(total_duration),
        }

def convert_decimal(obj):
    if isinstance(obj, list):
        return [convert_decimal(i) for i in obj]
    elif isinstance(obj, dict):
        return {k: convert_decimal(v) for k, v in obj.items()}
    elif isinstance(obj, decimal.Decimal):
        return float(obj)
    else:
        return obj

@login_required
def search(request):
    if request.method == 'POST':
        form = PassengerInfoForm(request.POST)
        if form.is_valid():
            passenger_lcity = form.cleaned_data.get('leave_city')
            passenger_acity = form.cleaned_data.get('arrive_city')
            passenger_ldate = form.cleaned_data.get('leave_date')
            time_format = '%H:%M'

            # 先查出出发城市和到达城市的所有机场
            departure_airports = Airport.objects.filter(city__city_name=passenger_lcity)
            arrival_airports = Airport.objects.filter(city__city_name=passenger_acity)

            # 查询所有满足条件的直飞航班
            all_flights = Flight.objects.filter(
                departure_airport__in=departure_airports,
                arrival_airport__in=arrival_airports,
                departure_date=passenger_ldate
            )

            usable_flights = list(all_flights)

            # 用工具函数简化区分直飞和联程
            direct_flights = []
            transfer_flights = []
            for flight in usable_flights:
                info = get_flight_with_transfer_info(flight, time_format)
                if info['type'] == 'transfer':
                    transfer_flights.append(info)
                else:
                    direct_flights.append(info)

            # 排序
            direct_flights = sorted(direct_flights, key=lambda x: (x['departure_date'], x['departure_time']))
            transfer_flights = sorted(transfer_flights, key=lambda x: (x['first_departure_date'], x['first_departure_time']))

            # 合并，直飞在前，中转在后
            all_sorted_flights = direct_flights + transfer_flights

            # 自动构造一次中转航班（A->B->C），每段都可能是联程
            auto_transfer_flights = []
            # 查找所有A出发的航班（第一程出发日期必须等于用户输入日期）
            first_legs = Flight.objects.filter(
                departure_airport__in=departure_airports,
                departure_date=passenger_ldate
            )
            for first in first_legs:
                transfer_airport = first.arrival_airport
                transfer_city = transfer_airport.city.city_name
                if transfer_city in [passenger_lcity, passenger_acity]:
                    continue
                # 查找B->C的所有航班，出发日期大于等于第一程到达日期，且如果同一天则出发时间晚于到达时间
                second_legs = Flight.objects.filter(
                    departure_airport=transfer_airport,
                    arrival_airport__in=arrival_airports
                ).filter(
                    Q(departure_date__gt=first.arrive_date) |
                    Q(departure_date=first.arrive_date, departure_time__gt=first.arrival_time)
                )
                for second in second_legs:
                    first_leg_info = get_flight_with_transfer_info(first, time_format)
                    second_leg_info = get_flight_with_transfer_info(second, time_format)
                    
                    # 计算总时长和中转时长
                    first_departure_dt = datetime.datetime.combine(first_leg_info['departure_date'] if isinstance(first_leg_info['departure_date'], datetime.date) else datetime.datetime.strptime(first_leg_info['departure_date'], '%Y-%m-%d').date(),
                                                                   datetime.datetime.strptime(first_leg_info['departure_time'], time_format).time())
                    first_arrival_dt = datetime.datetime.combine(first_leg_info['arrival_date'] if isinstance(first_leg_info['arrival_date'], datetime.date) else datetime.datetime.strptime(first_leg_info['arrival_date'], '%Y-%m-%d').date(),
                                                                 datetime.datetime.strptime(first_leg_info['arrival_time'], time_format).time())
                    second_departure_dt = datetime.datetime.combine(second_leg_info['departure_date'] if isinstance(second_leg_info['departure_date'], datetime.date) else datetime.datetime.strptime(second_leg_info['departure_date'], '%Y-%m-%d').date(),
                                                                    datetime.datetime.strptime(second_leg_info['departure_time'], time_format).time())
                    second_arrival_dt = datetime.datetime.combine(second_leg_info['arrival_date'] if isinstance(second_leg_info['arrival_date'], datetime.date) else datetime.datetime.strptime(second_leg_info['arrival_date'], '%Y-%m-%d').date(),
                                                                  datetime.datetime.strptime(second_leg_info['arrival_time'], time_format).time())
                    
                    total_duration = second_arrival_dt - first_departure_dt
                    transfer_duration = second_departure_dt - first_arrival_dt
                    price1 = get_min_price_with_seat(first_leg_info)
                    price2 = get_min_price_with_seat(second_leg_info)
                    if price1 == 0.0 or price2 == 0.0:
                        total_minprice = None
                    else:
                        total_minprice = price1 + price2

                    auto_transfer_flights.append({
                        'first_leg': first_leg_info,
                        'second_leg': second_leg_info,
                        'transfer_city': transfer_city,
                        'transfer_airport': transfer_airport.name,
                        'total_duration': str(total_duration),
                        'transfer_duration': str(transfer_duration),
                        'total_minprice': total_minprice
                    })

            dis_search_head = 'block' if (all_sorted_flights or auto_transfer_flights) else 'none'
            dis_search_failure = 'none' if (all_sorted_flights or auto_transfer_flights) else 'block'

            context = {
                'leave_city': passenger_lcity,
                'arrive_city': passenger_acity,
                'leave_date': str(passenger_ldate),
                'all_sorted_flights': all_sorted_flights,
                'direct_flights': direct_flights,
                'transfer_flights': transfer_flights,
                'auto_transfer_flights': auto_transfer_flights,
                'dis_search_head': dis_search_head,
                'dis_search_failure': dis_search_failure
            }
            context = convert_decimal(context)
            for key, value in context.items():
                request.session[key] = value
            if request.user.is_authenticated:
                context['username'] = request.user.username
            return redirect('booksystem:result')
        else:
            return render(request, 'booksystem/search.html')
    else:
        context = {'dis_search_head': 'none', 'dis_search_failure': 'none'}
    return render(request, 'booksystem/search.html')

#展示结果+
@login_required
def result(request):
    if request.method == "GET":
        context = {}
        for key in request.session.keys():
            context[key] = request.session.get(key)
        return render(request, 'booksystem/result.html', context)
    elif request.method == "POST":
        flight_number = request.POST.get('flight_number')
        request.session['flightnumber'] = flight_number
        if flight_number:
            return redirect('booksystem:booking_information')
    

#填写购票信息并确认购票
@login_required
def booking_information(request):
    flight_number = request.session.get('flightnumber')
    flight = Flight.objects.get(flight_number=flight_number)
    max_passengers = 5

    if request.method == "POST":
        passenger_count = int(request.POST.get('passengerCount', 1))
        with transaction.atomic():
            # 锁定航班，防止并发超卖
            flight = Flight.objects.select_for_update().get(flight_number=flight_number)
            seats = get_remaining_seats(flight)
            first_left = seats['first_class_left']
            economy_left = seats['economy_class_left']

            # 统计本次购票各舱位数量
            first_count = 0
            economy_count = 0
            for i in range(1, passenger_count + 1):
                cabin_class = request.POST.get(f'cabin_class_{i}')
                if cabin_class == 'first':
                    first_count += 1
                elif cabin_class == 'economy':
                    economy_count += 1

            # 判断余票
            if first_count > first_left or economy_count > economy_left:
                return render(request, 'booksystem/booking_information.html', {
                    'flight': flight,
                    'error_message': '余票不足，请重新选择'
                })
        for i in range(1, passenger_count + 1):
            user_id = request.POST.get(f'id_card_{i}')
            user_name = request.POST.get(f'name_{i}')
            cabin_class = request.POST.get(f'cabin_class_{i}')
            if user_id and user_name and cabin_class:
                passenger, _ = Passenger.objects.get_or_create(
                    id_card=user_id,
                    defaults={'name': user_name}
                )
                TransactionRecord.objects.create(
                    passenger=passenger,
                    flight_number=flight,
                    cabin_class=cabin_class,
                    operation_date=date.today(),
                    operation_type='purchase',
                    transaction_price=flight.cabinpricing_set.get(cabin_class=cabin_class).price,
                    buyer=request.user
                )
        return redirect('booksystem:booked_result')
    return render(request, 'booksystem/booking_information.html', {'flight': flight})
