class Pet:
    def __init__(self, name, age):
        self.name = name
        self.age = age


class Cat(Pet):
    def __init__(self, name, age, color):
        super().__init__(name, age)
        self.color = color

    def __str__(self):
        return f"My cat {self.name} is {self.age} years old and has {self.color} fur"

pudding = Cat('Pudding', 7, 'black and white')
butterscoth = Cat('Butterscoth', 10, 'tan and white')
print(pudding, butterscoth, sep='\n')