# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.


'''
Input: list

Output: sum of the sums of each subsequence for that list

Rules


Data structure / Algorithms
    create a variable for sum
    iterate through the array with index
        get the sum of a slice of array up to current index, add it to total sum
    return total sum


'''


def sum_of_sums(list):
    sum = 0
    accumulator = 0
    for ele in list:
        accumulator += ele
        sum += accumulator

    return sum

print(sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2)) # -> (21)
print(sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3)) # -> (36)
print(sum_of_sums([4]) == 4)
print(sum_of_sums([1, 2, 3, 4, 5]) == 35)