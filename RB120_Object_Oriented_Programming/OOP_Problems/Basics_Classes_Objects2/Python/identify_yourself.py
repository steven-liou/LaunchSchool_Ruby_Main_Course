class Cat:
    def __init__(self, name):
        self.name = name

    def identify(self):
        return self

    def __repr__(self):
        return f"Cat object with name {self.name}"

kitty = Cat('Sophie')
print(repr(kitty.identify()))