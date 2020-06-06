class Vehicle:

    def __init__(self, year):
        self._year = year

    @property
    def year(self):
        return self._year


class Truck(Vehicle):
    def __init__(self, year, bed_type):
        super().__init__(year)
        self.bed_type = bed_type


truck1 = Truck(1994, 'Short')
print(truck1.year)
print(truck1.bed_type)
