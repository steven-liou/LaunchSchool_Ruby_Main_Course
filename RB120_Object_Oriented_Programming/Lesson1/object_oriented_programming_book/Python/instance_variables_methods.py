class GoodDog:
    def __init__(self, name):
        self.name = name

    def speak(self):
        return f"{self.name} says arf!"

sparky = GoodDog('Sparky')
fido = GoodDog('Fido')

print(sparky.speak())
print(fido.speak())
print(sparky.name)
print(fido.name)