#Polymorphism through inheritance

class Animal:
    def eat(self):
        print('Animal is eating')


class Fish(Animal):
    def eat(self):
        print('Fish is eating')



class Cat(Animal):
    def eat(self):
        print('Cat is eating')


def feed_animal(animal):
    animal.eat()


array_of_animals = [Animal(), Fish(), Cat()]

[feed_animal(animal) for animal in array_of_animals]

#The client can treat different objects the same way as if they can all eat