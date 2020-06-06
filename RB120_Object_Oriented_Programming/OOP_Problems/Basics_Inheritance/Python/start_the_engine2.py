class Vehicle:
    def start_engine(self):
        return 'Ready to go!'


class Truck(Vehicle):
    def start_engine(self, speed):
        return f'{super().start_engine()} Drive {speed}, please!'

truck1 = Truck()
print(truck1.start_engine('fast'))