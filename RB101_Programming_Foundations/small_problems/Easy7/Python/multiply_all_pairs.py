# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

'''
Input: two arrays

Output: matrix product of two arrays

Rules


Data structure / Algorithms
    create an empty list of length list1*list2
    have an index counter
    iterate through the first list
        for each list1 element, iterate through list2
            multiply list1 element to list2 element, add it to reseult
            increment the index by 1



'''

def multiply_all_pairs(list1, list2):
    result = [0] * ( len(list1) * len(list2) )
    index = 0

    for num1 in list1:
        for num2 in list2:
            result[index] = num1 * num2
            index += 1
    result.sort()
    return result

print(multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16])
