


'''Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.
'''

'''
Input: string

Output: array of palindromic substrings

Rules


Data structure / Algorithms
    I can call the substrings function to get all possible substrings from the input string
    create an array for storing palindromic substrings
    iterate through the substrings array
        check if current substring is palindromic
        if it is, add it to the array
    return the palindromic array

'''

def palindromes(string):
    substring_array = substrings(string)

    palindromes = []

    for substring in substring_array:
        if substring[::-1] == substring and len(substring) > 1:
            palindromes.append(substring)
    return palindromes








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


print(palindromes('abcd') == [])
print(palindromes('madam') == ['madam', 'ada'])
print(palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
])
print(palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
])