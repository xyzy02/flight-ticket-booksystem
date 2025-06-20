from django.urls import path
from . import views

app_name = 'booksystem'

urlpatterns = [
    path('', views.index, name='index'),
    path('login_user/', views.login_user, name='login_user'),
    path('register_user/', views.register_user, name='register_user'),
    path('search/', views.search, name='search'),  # 修正拼写
    path('confirm_logout/', views.confirm_logout, name='confirm_logout'),
    path('result/', views.result, name='result'),  # 搜索结果页面
    path('booking_information/', views.booking_information, name='booking_information'),
    path('booked_result/', views.booked_result, name='booked_result'),  # 购退票成功页面，单独路径
    path('ticket_record/', views.ticket_record, name='ticket_record'),
]