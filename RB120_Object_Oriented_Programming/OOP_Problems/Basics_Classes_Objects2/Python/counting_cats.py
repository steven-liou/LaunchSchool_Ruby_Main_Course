class Cat:
    numbers_of_cats = 0

    def __init__(self):
        type(self).numbers_of_cats += 1

    @classmethod
    def total(cls):
        return cls.numbers_of_cats

kitty1 = Cat()
kitty2 = Cat()

print(Cat.total())