# Write a method named include that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include method in your solution.


'''
Input: array, and a search number

Output: true false if the search number is in the array

Rules


Data structure / Algorithms
    have a match variable set to False
    iterate through the array,
        if the current element is equal to the search item, set match to True
    return match


'''

def include(list, item):
    match = False

    for ele in list:
        if ele == item:
            match = True
            break
    return match

print(include([1,2,3,4,5], 3) == True)
print(include([1,2,3,4,5], 6) == False)
print(include([], 3) == False)
print(include([None], None) == True)
print(include([], None) == False)