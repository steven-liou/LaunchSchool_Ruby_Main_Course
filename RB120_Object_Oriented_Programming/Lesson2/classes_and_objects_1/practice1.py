class Person:
    def __init__(self, name):
        parsed_name = name.split()
        self.first_name = parsed_name[0]
        self.last_name = parsed_name[1] if len(parsed_name) > 1 else ''


    @property
    def name(self):
        return (self.first_name + ' ' + self.last_name).strip()

    @name.setter
    def name(self, input_name):
        parsed_name = input_name.split()
        self.first_name = parsed_name[0]
        self.last_name = parsed_name[1] if len(parsed_name) > 1 else ''
        self._name = (self.first_name + ' ' + self.last_name).strip()

    def __str__(self):
        return self.name

bob = Person('Robert')
print(bob.name)
print(bob.first_name)
print(bob.last_name)
bob.last_name = 'Smith'
print(bob.name)

bob.name = "John Adams"
print(bob.first_name)
print(bob.last_name)
print(bob.name)

print(bob)