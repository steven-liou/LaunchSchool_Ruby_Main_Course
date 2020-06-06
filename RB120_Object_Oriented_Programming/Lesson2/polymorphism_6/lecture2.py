#Bad example

class Wedding:
    def __init__(self, guests, flowers, songs):
        self.guests = guests
        self.flowers = flowers
        self.songs = songs

    def prepare(self, preparers):
        for preparer in preparers:
            if isinstance(preparer, Chef):
                preparer.prepare_food(self.guests)
            elif isinstance(preparer, Decorator):
                preparer.decorate_place(self.flowers)
            elif isinstance(preparer, Musician):
                preparer.prepare_performance(self.songs)


class Chef:
    def prepare_food(self, guests):
        print(f"Preparing food for {guests} of guests")


class Decorator:
    def decorate_place(self, flowers):
        print(f"Decorating {flowers} number of flowers")


class Musician:
    def prepare_performance(self, songs):
        print(f"Performing {songs} number of songs")

wed = Wedding(10, 200, 5)

wed.prepare([Chef(), Decorator(), Musician()])
