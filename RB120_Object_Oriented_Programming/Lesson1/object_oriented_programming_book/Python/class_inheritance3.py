class WalkableMixin:
    def walk(self):
        return "I'm walking"


class SwimmableMixin:
    def swim(self):
        return "I'm swimming."




class ClimbableMixin:
    def climb(self):
        "I'm climbing."


class Animal(WalkableMixin):
    def speak(self):
        return "I'm an animal, and I speak!"

class GoodDog(ClimbableMixin, SwimmableMixin, Animal):
    pass

print("----Animal method lookup---")
print(Animal.mro())



fido = Animal()
print(fido.speak())
print(fido.walk())

print("----GoodDog method lookup----")
print(GoodDog.mro())
