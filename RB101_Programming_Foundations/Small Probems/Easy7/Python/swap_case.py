# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.



'''
Input: a string

Output: new string with cases swapped

Rules


Data structure / Algorithms
    create a list for the resulting characters, with length size of original string
    turn the string into a list of characters
    iterate through the characters, with index
        check if the current character is alphabet
            if it is, check if it is uppercase
                if it is, then lowercase it, add it to the result array
                else, uppercase it. add it to the result array
            if not alphabet, add it to the result array
    return result array



'''

def swapcase(string):
    swapped_chars = [''] * len(string)
    characters = list(string)

    for index, char in enumerate(characters):
        if char.isalpha():
            if char.upper() == char:
                swapped_chars[index] = char.lower()
            else:
                swapped_chars[index] = char.upper()
        else:
            swapped_chars[index] = char
    return ''.join(swapped_chars)


print(swapcase('CamelCase') == 'cAMELcASE')
print(swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv')