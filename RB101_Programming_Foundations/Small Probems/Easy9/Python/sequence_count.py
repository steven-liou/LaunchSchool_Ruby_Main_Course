# Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.


'''
Input: an integer representing the multiples, and an integer representing the starting number

Output:

Rules


Data structure / Algorithms

    create an array of size n1
    iterate from index 0 to n1
        add the second number * (index + 1) to the array

'''

# def sequence(n1, n2):
#     array = []

#     for index in range(0, n1):
#         array.append( n2 * (index + 1) )
#     return array

def sequence(n1, n2):
    return [ (x+1) * n2 for x in range(0, n1)]

print(sequence(5, 1) == [1, 2, 3, 4, 5])
print(sequence(4, -7) == [-7, -14, -21, -28])
print(sequence(3, 0) == [0, 0, 0])
print(sequence(0, 1000000) == [])