class Person:

    def __init__(self, name):
        self.name = name
        self.pets = []

    def add_pet(self, pet):
        self.pets.append(pet)

class Cat:
    pass

class Bulldog:
    pass




bob = Person('Robert')
kitty = Cat()
bud = Bulldog()

bob.add_pet(kitty)
bob.add_pet(bud)

print(bob.pets)
