class Cat:
    def __init__(self, name):
        self.name = name

    def rename(self, name):
        self.name = name


kitty = Cat('Sophie')
print(kitty.name)
kitty.rename('Chloe')
print(kitty.name)