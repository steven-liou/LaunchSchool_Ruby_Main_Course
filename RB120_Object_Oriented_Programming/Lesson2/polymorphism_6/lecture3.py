#Use duck typing to implement polymorphism

class Wedding:
    def __init__(self, guests, flowers, songs):
        self.guests = guests
        self.flowers = flowers
        self.songs = songs

    def prepare(self, preparers):
        for preparer in preparers:
            preparer.prepare_wedding(self)


class Chef:
    def prepare_wedding(self, wedding):
        self.prepare_food(wedding.guests)

    def prepare_food(self, guests):
        print(f"Preparing food for {guests} of guests")


class Decorator:
    def prepare_wedding(self, wedding):
        self.decorate_place(wedding.flowers)

    def decorate_place(self, flowers):
        print(f"Decorating {flowers} number of flowers")


class Musician:
    def prepare_wedding(self, wedding):
        self.prepare_performance(wedding.songs)

    def prepare_performance(self, songs):
        print(f"Performing {songs} number of songs")

wed = Wedding(10, 200, 5)

wed.prepare([Chef(), Decorator(), Musician()])
