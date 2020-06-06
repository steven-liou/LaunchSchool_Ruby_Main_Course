'''
input : string of numbers
output : integers of original string

Algo :
    create an array of strings from 0 to 9 ['0', '1', ... '9']
    create a variable for the number, starts with 0
    iterate through each character of the string
        - convert the current char to number by finding its index in the array
        - multiplies the original number by 10 and add this number to it
    return the number
'''

def string_to_integer(string):
    number_array = [str(x) for x in range(0, 10)]

    number = 0

    for chr in string:
        number = number * 10 + number_array.index(chr)
    return number



print(string_to_integer('4321') == 4321)
print(string_to_integer('570') == 570)