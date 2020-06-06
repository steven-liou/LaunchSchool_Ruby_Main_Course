
'''
input : a signed number
output : a string with signed number
Algo :
    Have a str that will hold the sign
    If the number is greater than 0, set the sign to +
    if the number is less than 0, set the sign to -
    call the method from previous exercise, with absolute number as argument
    add the sign to the resulting string

'''

def signed_integer_to_string(number):
    if number > 0:
        sign = '+'
    elif number < 0:
        sign = '-'
    else:
        sign = ''

    str_num = integer_to_string(abs(number))
    return sign + str_num






def integer_to_string(number):
    number_array = [str(x) for x in range(0, 10)]
    result_string = ''

    while True:
        number, remainder = divmod(number, 10)
        result_string = number_array[remainder] + result_string
        if number == 0:
            break
    return result_string






print(signed_integer_to_string(4321) == '+4321')
print(signed_integer_to_string(-123) == '-123')
print(signed_integer_to_string(0) == '0')