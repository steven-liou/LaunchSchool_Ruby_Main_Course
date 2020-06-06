class SwimmableMixin:
    def swim(self):
        return "I'm swimming!"


class Animal:
    pass

class Fish(SwimmableMixin, Animal):
    pass

class Mammal(Animal):
    pass

class Cat(Mammal):
    pass

class Dog(SwimmableMixin, Mammal):
    pass


print(Dog.mro())
print(Fish.mro())

sparky = Dog()
nemo = Fish()
paws = Cat()
print(sparky.swim())
print(nemo.swim())
print(paws.swim())