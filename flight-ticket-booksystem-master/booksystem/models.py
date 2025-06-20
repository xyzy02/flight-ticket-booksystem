from django.contrib.auth.models import Permission, User
from django.db import models

# Create your models here.
class City(models.Model):
    city_code = models.CharField(max_length=3, primary_key=True)
    city_name = models.CharField(max_length=10)
    class Meta:
        indexes = [models.Index(fields=['city_code'])]
    def __str__(self):
        return self.city_name

class Airport(models.Model):
    airport_code = models.CharField(max_length=4, primary_key=True)
    name = models.CharField(max_length=10)
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    class Meta:
        indexes = [models.Index(fields=['airport_code'])]  
    def __str__(self):
        return self.name

class Airplane(models.Model):
    airplane_id = models.CharField(max_length=10, primary_key=True)
    model = models.CharField(max_length=10, blank=True, null=True)
    first_class_seats = models.PositiveSmallIntegerField()
    economy_class_seats = models.PositiveSmallIntegerField()
    class Meta:
        indexes = [models.Index(fields=['airplane_id'])]
    def __str__(self):
        return self.airplane_id

class Flight(models.Model):
    WEEK_DAYS = (
        ('mon', 'Monday'),
        ('tue', 'Tuesday'),
        ('wed', 'Wednesday'),
        ('thu', 'Thursday'),
        ('fri', 'Friday'),
        ('sat', 'Saturday'),
        ('sun', 'Sunday')
    )
    flight_number = models.CharField(max_length=7, primary_key=True)
    departure_airport = models.ForeignKey(Airport, related_name='departures', on_delete=models.PROTECT)
    arrival_airport = models.ForeignKey(Airport, related_name='arrivals', on_delete=models.PROTECT)
    weekly_days = models.CharField(max_length=27)  # For SET field
    departure_date = models.DateField()
    departure_time = models.TimeField()
    arrive_date = models.DateField()
    arrival_time = models.TimeField()
    airplane = models.ForeignKey(Airplane, on_delete=models.PROTECT)
    def __str__(self):
        return self.flight_number

class CabinPricing(models.Model):
    CABIN_CLASS_CHOICES = [
        ('first', 'First Class'), ('economy', 'Economy Class'),
    ]
    flightnumber = models.ForeignKey(Flight, on_delete=models.CASCADE)
    cabin_class = models.CharField(max_length=7, choices=CABIN_CLASS_CHOICES)
    price = models.DecimalField(max_digits=8, decimal_places=2)  
    class Meta:
        unique_together = (('flightnumber', 'cabin_class'))
        indexes = [models.Index(fields=['flightnumber', 'cabin_class'])] 
    def __str__(self):
        return f"{self.flightnumber} - {self.get_cabin_class_display()}"

class Passenger(models.Model):
    id_card = models.CharField(max_length=18, primary_key=True)
    name = models.CharField(max_length=10)
    class Meta:
        indexes = [models.Index(fields=['id_card'])] 
    def __str__(self):
        return self.name

class TransactionRecord(models.Model):
    OPERATION_CHOICES = [
        ('purchase', 'Purchase'), ('refund', 'Refund'),
    ]
    transaction_id = models.AutoField(primary_key=True)
    passenger = models.ForeignKey(Passenger, on_delete=models.CASCADE)
    flight_number  = models.ForeignKey(Flight, on_delete=models.PROTECT)
    cabin_class = models.CharField(max_length=7, choices=CabinPricing.CABIN_CLASS_CHOICES)
    operation_date = models.DateField()
    operation_type = models.CharField(max_length=8, choices=OPERATION_CHOICES)
    transaction_price = models.DecimalField(max_digits=8, decimal_places=2)
    buyer = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)
    class Meta:
        indexes = [models.Index(fields=['passenger', 'operation_type', 'buyer'])] 
    def __str__(self):
        return f"{self.transaction_id} - {self.passenger.name}"

class SecondFlight(models.Model):
    flight = models.OneToOneField(Flight, primary_key=True, on_delete=models.CASCADE)
    second_flight = models.CharField(max_length=7)
    transfer_airport = models.ForeignKey(Airport, on_delete=models.PROTECT)
    weekly_days = models.CharField(max_length=27)  # For SET field
    transfer_date = models.DateField()
    transfer_time = models.TimeField()
    departure_date = models.DateField()
    departure_time = models.TimeField()
    airplane = models.ForeignKey(Airplane, on_delete=models.PROTECT)
    class Meta:
        indexes = [models.Index(fields=['flight'])]
    def __str__(self):
        return f"{self.flight.flight_number} -> {self.second_flight}"
