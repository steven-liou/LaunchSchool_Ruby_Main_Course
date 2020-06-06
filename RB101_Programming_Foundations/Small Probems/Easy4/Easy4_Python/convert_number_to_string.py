# Write a method that takes a positive integer or zero, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.


'''
input : number
output : string representing input number
Algo :
    create an array of string characters for the numbers from 0 to 9
    create an empty string
    while the number is greater than 0,
        divide the number by 10, and also get its remainder
        get the string versino of the remainder
        insert the char to the result string at index 0
'''


def integer_to_string(number):
    number_array = [str(x) for x in range(0, 10)]
    result_string = ''

    while True:
        number, remainder = divmod(number, 10)
        result_string = number_array[remainder] + result_string
        if number == 0:
            break
    return result_string


print(integer_to_string(4321) == '4321')
print(integer_to_string(0) == '0')
print(integer_to_string(5000) == '5000')