class Person:
    @property
    def secret(self):
        pass
    @secret.setter
    def secret(self, value):
        self._secret = value

    @property
    def __secret(self):
        return self._secret

    def share_secret(self):
        return self.__secret


person1 = Person()
person1.secret = 'Shh.. this is a secret!'
print(person1.share_secret())