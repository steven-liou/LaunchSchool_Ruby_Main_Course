# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.


'''
Input: string

Output: array of leading substrings

Rules


Data structure / Algorithms
    create a list of size n
    iterate from index 0 to the end of string
        add the string from the beginning to current index, to the array


'''

def substrings_at_start(string):
    result_array = [""] * len(string)

    for idx in range(0, len(string)):
        result_array[idx] = string[:idx + 1]
    return result_array


print(substrings_at_start('abc') == ['a', 'ab', 'abc'])
print(substrings_at_start('a') == ['a'])
print(substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy'])