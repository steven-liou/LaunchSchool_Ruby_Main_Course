class Pet:
    def __init__(self, name):
        self.name = name.__str__()

    def __str__(self):
        return f"My name is {self.name.capitalize()}"




name = 'Fluffy'
fluffy = Pet(name)
print(fluffy.name)
print(fluffy)
