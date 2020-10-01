# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

# You may not use Array #reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

'''
Input: an array

Output: original array with elements reversed

Rules


Data structure / Algorithms
    create an empty array for result
    iterate from the end of the given array
    add the element to the result array in order


'''

def reverse(list):
    result = [0] * len(list)

    for index, item in enumerate(reversed(list)):
        result[index] = item

    return result



print(reverse([1,2,3,4]) == [4,3,2,1])          # => true
