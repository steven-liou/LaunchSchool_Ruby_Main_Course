# Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

'''
Input: an array of numbers

Output: the result is the average

Rules


Data structure / Algorithms
    get the product of the array
    divide the products by the length of the array to get the average
    print out the average to 3 decimal points


'''

def show_multiplicative_average(list):
    product = 1
    n = len(list)

    for num in list:
        product *= num
    average = product / n

    print(f"The result is {average:.3f}")

show_multiplicative_average([3, 5])
# The result is 7.500

show_multiplicative_average([6])
# The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667