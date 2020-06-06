# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

'''
Input: a number

Output: print the right triangle as shown

Rules


Data structure / Algorithms
    level starts at 1
    the number of spaces is the n - level

    iterate from 1 to (n + 1)
        print n - level number of spaces, then print level number of stars


'''

def triangle(n):
    for level in range(1, n + 1):
        print(f"{' ' * (n - level)}{'*' * level}")

triangle(5)
triangle(9)
