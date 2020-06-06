class Dog:
    def speak(self):
        return 'bark!'

    def swim(self):
        return 'swimming'


class BullDog(Dog):
    def swim(self):
        return "can't swim!"

teddy = Dog()
print(teddy.speak())
print(teddy.swim())

ruddy = BullDog()
print(ruddy.swim())
