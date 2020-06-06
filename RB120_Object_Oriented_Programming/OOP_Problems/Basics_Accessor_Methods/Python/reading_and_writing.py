class Person:
    @property
    def name(self):
        return self._name

    @name.setter
    def name(self, name):
        self._name = name



person1 = Person()
person1.name = 'Jessica'
print(person1.name)