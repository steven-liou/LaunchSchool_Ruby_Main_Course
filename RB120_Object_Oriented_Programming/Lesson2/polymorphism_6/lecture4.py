class Dog:
    def __init__(self, n):
        self._nickname = n

    @property
    def nickname(self):
        return self._nickname

    def change_nickname(self, n):
        self._nickname = n

    def greeting(self):
        return f"{self.nickname.capitalize()} says Woff Woff!"


dog = Dog('rex')
print(dog.greeting())

dog.change_nickname('borny')
print(dog.greeting())