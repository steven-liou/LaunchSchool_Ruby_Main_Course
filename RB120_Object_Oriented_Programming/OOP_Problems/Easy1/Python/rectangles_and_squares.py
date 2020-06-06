class Rectangle:
    def __init__(self, height, width):
        self.height = height
        self.width = width


    def area(self):
        return self.height * self.width


class Square(Rectangle):
    def __init__(self, side):
        super().__init__(side, side)


square = Square(5)
print(f"area of square = {square.area()}")