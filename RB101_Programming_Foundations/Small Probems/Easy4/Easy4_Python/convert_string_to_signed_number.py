'''
input : string of numbers
output : integers of original string

Algo :
    set a variable for sign to +1
    check if the first character is - or +
        if -, then set sign to -1
        if +, then pass
    using the previous method for converting the string to number part
'''

def string_to_signed_integer(string):
    sign = 1
    if string[0] == '-':
        sign = -1
        number = string_to_integer(string[1:])
    elif string[0] == '+':
        number = string_to_integer(string[1:])
    else:
        number = string_to_integer(string)
    return sign * number

def string_to_integer(string):
    number_array = [str(x) for x in range(0, 10)]

    number = 0

    for chr in string:
        number = number * 10 + number_array.index(chr)
    return number



print(string_to_signed_integer('4321') == 4321)
print(string_to_signed_integer('-570') == -570)
print(string_to_signed_integer('+100') == 100)