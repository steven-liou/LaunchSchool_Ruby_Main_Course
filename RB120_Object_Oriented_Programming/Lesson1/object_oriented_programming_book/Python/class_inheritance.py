class Animal:
    def __init__(self, name):
        self.name = name


class GoodDog(Animal):
    def __init__(self, name, color):
        super().__init__(name)
        self.color = color

    def __str__(self):
        return f"{self.color} {self.name}"









sparky = GoodDog('Sparky', 'red')
print(sparky)