

class SpeakMixin:
    def speak(self, sound):
        print(sound)

class RunMixin:
    def run(self):
        print('I am running!')

class Animal:
    pass

class GoodDog(SpeakMixin, RunMixin, Animal):
    pass

class HumanBeing(Animal, SpeakMixin):
    pass

# sparky = GoodDog()
# print(sparky)
# sparky.speak('Arf!')
# sparky.run()
print(GoodDog.mro())
print(HumanBeing.mro())
# bob = HumanBeing()
# bob.speak('Hello!')