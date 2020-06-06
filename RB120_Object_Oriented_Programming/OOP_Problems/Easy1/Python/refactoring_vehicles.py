class Vehicle:
    def __init__(self, make, model):
        self.make = make
        self.model = model

    def __str__(self):
        return f"{self.make} {self.model}"



class Car(Vehicle):
    def wheels(self):
        return 4

class Motorcycle(Vehicle):
    def wheels(self):
        return 2


class Truck(Vehicle):
    def __init__(self, make, model, payload):
        super().__init__(make, model)
        self.payload = payload


    def wheels(self):6



