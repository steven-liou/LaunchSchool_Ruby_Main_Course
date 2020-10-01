# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

'''
input : an array
output : a new array with each element the running total of previous elements
Algo :
    create an array of size that equal to original input
    iterate through the given array, add the current element's value to the previous element's value to the new array's element


'''

def running_total(arr):
    running_total = [0] * len(arr)

    for idx, ele in enumerate(arr):
        if idx > 0:
            running_total[idx] = running_total[idx - 1] + ele
        else:
            running_total[idx] = ele

    return running_total

print(running_total([2, 5, 13]) == [2, 7, 20])
print(running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67])
print(running_total([3]) == [3])
print(running_total([]) == [])