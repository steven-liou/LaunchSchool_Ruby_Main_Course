#Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.




'''
Input: array

Output: a new array with two subarray of original's halves

Rules


Data structure / Algorithms
    find the middle index
        if length is even, divide it by 2 - 1
        if odd, divide by 2
    slice the halves accordingly
    add them to the result array


'''

def halvsies(list):
    middle = len(list) // 2 + 1 if len(list) % 2 != 0 else len(list) // 2
    return [list[0:middle], list[middle:]]





print(halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]])
print(halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]])
print(halvsies([5]) == [[5], []])
print(halvsies([]) == [[], []])