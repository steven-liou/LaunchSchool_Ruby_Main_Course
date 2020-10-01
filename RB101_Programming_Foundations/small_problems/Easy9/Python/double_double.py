# A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.


'''
Input: a number

Output: double the number if it is not a 'double number', and return as is if it is a 'double number'

Rules
    double number have digits' length even
    left side of double number is equal to right hand is

Data structure / Algorithms
    convert the number to string
    check if the length of digit is even
        if it is even, then cheack if its left side is equal to right side
            find the middle indices by middle // 2
            get the slice of the number from 0:middle, and middle to end
            check if the two slices are the same
                if not, double the number
                else, return the number as is


'''

def twice(number):
    answer = 0

    number_str = str(number)

    if len(number_str) % 2 == 0:
        middle = len(number_str) // 2

        if number_str[:middle] == number_str[middle:]:
            answer = int(number_str)
        else:
            answer = 2 * int(number_str)
    else:
        answer = 2 * int(number_str)
    return answer



print(twice(37) == 74)
print(twice(44) == 44)
print(twice(334433) == 668866)
print(twice(444) == 888)
print(twice(107) == 214)
print(twice(103103) == 103103)
print(twice(3333) == 3333)
print(twice(7676) == 7676)
print(twice(123_456_789_123_456_789) == 123_456_789_123_456_789)
print(twice(5) == 10)