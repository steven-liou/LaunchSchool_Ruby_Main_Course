class MyCar:
    def __init__(self, year, color, model):
        self._year = year
        self.color = color
        self.model = model
        self.speed = 0

    @property
    def year(self):
        print('Getter called')
        return self._year


    def speed_up(self, value):
        self.speed += value

    def brake(self, value):
        self.speed -= value

    def shut_off(self):
        self.speed = 0

    def spray_paint(self, color):
        self.color = color

    def __str__(self):
        return f"{self.color.capitalize()} {self.model} made in {self.year}"

    @staticmethod
    def mpg(gallons, miles):
        return miles / gallons


mustang = MyCar(2020, 'red', 'Mustang')
print(mustang)
print(MyCar.mpg(5, 25))