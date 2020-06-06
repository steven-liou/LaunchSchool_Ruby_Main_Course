# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

'''
Input: a string

Output: a dictinoary of keys lowercase, uppcase, and neither, and values their counts in the original string

Rules


Data structure / Algorithms
    create a hash that has lowercase, uppercase, and neither set to 0
    iterate through the string
        check current character is an alphabet
            if alphabet, check if uppercase or lower case, add 1 to respective key in hash
            if not, add 1 to neither key



'''

def letter_case_count(string):
    dictionary = { "lowercase": 0, "uppercase": 0, "neither": 0 }

    for char in string:
        if char.isalpha():
            if char.upper() == char:
                dictionary["uppercase"] += 1
            else:
                dictionary["lowercase"] += 1
        else:
            dictionary["neither"] += 1

    return dictionary


print(letter_case_count('abCdef 123') == { "lowercase": 5, "uppercase": 1, "neither": 4 })
print(letter_case_count('AbCd +Ef') == { "lowercase": 3, "uppercase": 3, "neither": 2 })
print(letter_case_count('123') == { "lowercase": 0, "uppercase": 0, "neither": 3 })
print(letter_case_count('') == { "lowercase": 0, "uppercase": 0, "neither": 0 })