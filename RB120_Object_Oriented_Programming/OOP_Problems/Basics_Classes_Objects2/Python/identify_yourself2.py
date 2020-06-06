class Cat:

    def __init__(self, name):
        self.name = name

    def __str__(self):
        return f"I'm {self.name}!"

kitty = Cat('Sophie')
print(kitty)