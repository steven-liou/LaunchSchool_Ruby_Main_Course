#Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

'''
Input:

Output:

Rules


Data structure / Algorithms
    create an array copy of first array
    iterate through the second array
        for each item, check if it is alrady in the first array
        if it is, continue
        else, add the current item to the result array


'''



def merge(list1, list2):
    union = list1
    for item in list2:
        if item not in list1:
            union += [item]
    return union

print(merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9])
