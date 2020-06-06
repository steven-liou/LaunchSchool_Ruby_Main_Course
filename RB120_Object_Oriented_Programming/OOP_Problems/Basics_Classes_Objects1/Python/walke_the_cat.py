class WalkableMixin:
    def walk(self):
        print("Let's go for a walk!")

class Cat(WalkableMixin):
    def __init__(self, name):
        self._name = name

    def greet(self):
        print(f"Hello! My name is {self.name}!")

    @property
    def name(self):
        return self._name

    @name.setter
    def name(self, name):
        self._name = name


kitty = Cat('Sophie')
kitty.greet()
kitty.walk()