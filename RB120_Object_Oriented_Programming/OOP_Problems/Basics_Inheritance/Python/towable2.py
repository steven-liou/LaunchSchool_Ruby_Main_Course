class TowableMixin:
    def tow(self):
        return 'I can tow a trailer!'


class Vehicle:
    def __init__(self, year):
        self.year = year

class Truck(TowableMixin, Vehicle):
    pass

class Car(Vehicle):
    pass

truck1 = Truck(1994)
print(truck1.year)
print(truck1.tow())

car1 = Car(2000)
print(car1.year)