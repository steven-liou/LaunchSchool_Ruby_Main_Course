# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.


'''
Input: a string

Output: middle characters of input string

Rules


Data structure / Algorithms
    check if the string is even or odd length
    if it is odd
        middle index is length // 2
        return this chracter
    else
        middle indicies is length // 2  and middle - 1
        return a slice of the two character


'''

def center_of(string):
    middle_char = ''

    middle = len(string) // 2

    if len(string) % 2 == 0:
        middle_char = string[middle - 1 : middle + 1]
    else:
        middle_char = string[middle]
    return middle_char

print(center_of('I love ruby') == 'e')
print(center_of('Launch School') == ' ')
print(center_of('Launch') == 'un')
print(center_of('Launchschool') == 'hs')
print(center_of('x') == 'x')