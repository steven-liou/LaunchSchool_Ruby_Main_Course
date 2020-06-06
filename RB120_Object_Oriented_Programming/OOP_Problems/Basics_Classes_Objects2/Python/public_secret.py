class Person:
    @property
    def secret(self):
        return self._secret

    @secret.setter
    def secret(self, value):
        self._secret = value


person1 = Person()
person1.secret = 'Shh.. this is a secret!'
print(person1.secret)