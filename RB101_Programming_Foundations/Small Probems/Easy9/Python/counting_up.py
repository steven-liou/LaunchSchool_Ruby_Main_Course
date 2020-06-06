# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater than 0.

'''
Input: a number

Output: an array of number between 1 and the argument

Rules


Data structure / Algorithms
    create an empty array for result
    iterate from 1 to n
        add the current index to the array



'''

def sequence(n):
    return list(range(1, n + 1))

# def sequence(n):
#     array = [0] * n

#     for index in range(1, n + 1):
#         array[index - 1] = index
#     return array


print(sequence(5) == [1, 2, 3, 4, 5])
print(sequence(3) == [1, 2, 3])
print(sequence(1) == [1])