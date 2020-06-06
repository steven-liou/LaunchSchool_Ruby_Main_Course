# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.



'''
Input: two arrays

Output: a new array with element-wise product of the original ararys

Rules


Data structure / Algorithms

    create a new array of length n
    iterate from 0 to n
    add the product to the result array

'''

def multiply_list(list1, list2):
    result = [0] * len(list1)

    for index in range(0, len(list1)):
        result[index] = list1[index] * list2[index]
    return result

print(multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77])