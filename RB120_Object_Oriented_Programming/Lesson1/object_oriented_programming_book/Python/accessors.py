class GoodDog:
    def __init__(self, name):
        self._name = name

    def speak(self):
        return f"{self.name} says arf!"

    @property
    def name(self):
        print('Getter called')
        return self._name

    @name.setter
    def name(self, value):
        print('Setter called')
        self._name = value

    @name.deleter
    def name(self):
        print('Deleter called')
        del self._name

sparky = GoodDog('Sparky')

print(sparky.name)
sparky.name = 'Sparkling'
print(sparky.name)
del sparky.name
