class GoodDog:
    number_of_dogs = 0

    def __init__(self, name):
        self.name = name
        GoodDog.number_of_dogs += 1

    @classmethod
    def what_am_i(cls):
        return "I'm a GoodDog Class!"

    @classmethod
    def dog_total(cls):
        return cls.number_of_dogs

    def __str__(self):
        return f"My name is {self.name}"


sparky = GoodDog("Sparky")
fido = GoodDog("Fido")
print(sparky)
print(fido)

print(f"Who is that dog? {sparky}")