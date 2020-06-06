class Person:
    @property
    def name(self):
        return self._name

    @name.setter
    def name(self, name):
        self._name = name

    def phon_number_setter(self, number):
        self._phone_number = number

    phone_number = property(None, phon_number_setter)


person1 = Person()
person1.name = 'Jessica'
person1.phone_number = '0123456789'
print(person1.name)
