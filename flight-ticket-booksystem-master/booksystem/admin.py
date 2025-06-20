from django.contrib import admin
from .models import City, Airport, Flight, Airplane, CabinPricing, Passenger, TransactionRecord, SecondFlight

# Register your models here.
admin.site.register(City)
admin.site.register(Airport)
admin.site.register(Flight)
admin.site.register(Airplane)
admin.site.register(CabinPricing)
admin.site.register(Passenger)
admin.site.register(TransactionRecord)
admin.site.register(SecondFlight)
