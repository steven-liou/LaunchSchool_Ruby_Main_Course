# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

# You may (and should) use the substrings_at_start method you wrote in the previous exercise:



'''
Input: string

Output: all possible substrings

Rules


Data structure / Algorithms
    create an empty array for result
    iterate through the string by index
        call the substring_at_start function, with argument the slice of string from current index to the end
         add the array to the result array



'''


def substrings(string):
    result_array = []

    for idx in range(0, len(string)):
        result_array += substrings_at_start(string[idx:])
    return result_array




def substrings_at_start(string):
    result_array = [""] * len(string)

    for idx in range(0, len(string)):
        result_array[idx] = string[:idx + 1]
    return result_array


print(substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
])