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


mustang = MyCar(2020, 'red', 'Mustang')

mustang.speed_up(20)
print(mustang.speed)

mustang.brake(5)
print(mustang.speed)

mustang.shut_off()
print(mustang.speed)
# mustang.year = 5  #will throw an AttributeError

mustang.spray_paint('black')
print(mustang.color)
