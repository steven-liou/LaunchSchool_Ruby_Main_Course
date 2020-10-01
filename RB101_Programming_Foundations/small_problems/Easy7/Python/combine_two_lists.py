# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

'''
Input:

Output:

Rules


Data structure / Algorithms
    create an empty array for result, that is size 2 * n (length of 1 of the array)
    iterate through the index from 0 to length of one of the array
        store the first array's current element to the result at index 2 * i
        store the second array's current element to the result at index 2 * 1 + 1


'''

def interleave(list1, list2):
    result = [0] * (2 * len(list1))

    for i in range(0, len(list1)):
        result[2 * i] = list1[i]
        result[2 * i + 1] = list2[i]
    return result
print(interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c'])
