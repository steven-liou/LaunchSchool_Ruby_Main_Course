# Write a method that takes a positive integer as an argument and returns that number with its digits reversed. Examples:



'''
Input: number

Output: number reversed

Rules


Data structure / Algorithms
    first get the number's digits into an array
        create an empty array
        while the number is divisible by 10
            get the dividend and remainder of the number by 10
            add the remainder to the array
    reverse the number using the array
        create a variable for reverse_num
        iterate through the digits array
            add reverse_num * 10 + current number
    return the reverse_num
'''


def reversed_number(number):
    digits = []

    while number > 0:
        number, remainder = divmod(number, 10)
        digits.append(remainder)

    reverse_num = 0

    for digit in digits:
        reverse_num = reverse_num * 10 + digit
    return reverse_num







print(reversed_number(12345) == 54321)
print(reversed_number(12213) == 31221)
print(reversed_number(456) == 654)
print(reversed_number(12000) == 21) # No leading zeros in return value!
print(reversed_number(12003) == 30021)
print(reversed_number(1) == 1)