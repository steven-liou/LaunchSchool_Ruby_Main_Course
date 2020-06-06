class TowableMixin:
    def tow(self):
        print("I can tow a trailer!")

class Truck(TowableMixin):
    pass

truck1 = Truck()
truck1.tow()