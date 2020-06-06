# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object

'''
Input: an array

Output: original array with elements reversed

Rules


Data structure / Algorithms
    find the middle index
    iterate through the array until index is middle
        swapped the current eleemnt with the element at -(idx + 1)


'''


def reverse(list):
    middle = (len(list) - 1) // 2

    for i in range(0, middle + 1):
        list[i] , list[-(i + 1)] = list[-(i + 1)], list[i]
    return list

list = [1,2,3,4]
result = reverse(list)
print(result == [4, 3, 2, 1])
print(list == [4, 3, 2, 1])
