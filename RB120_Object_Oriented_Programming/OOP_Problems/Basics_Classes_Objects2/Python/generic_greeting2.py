class Cat:
    def __init__(self, name):
        self.name = name

    @staticmethod
    def generic_greeting():
        print("Hello! I'm a cat!")

    def personal_greeting(self):
        print(f"Hello! My name is {self.name}!")


kitty = Cat('Sophie')

Cat.generic_greeting()
kitty.personal_greeting()