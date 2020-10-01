# Write a method that takes an string of characters, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.


'''
Input: a string of arrays (probelm was given in array)

Output: array of characters with vowles removed

Rules


Data structure / Algorithms
    create an empty array for the words
    iterate through the given array,
        create an empty string for the current word result
        for each word, iterate through the charcters
            check if the character is a vowel
            if it is, continue
            else append this character to the current string
        add this string to the array
    return the modified array


'''

def remove_vowels(string):
    array = string.split()
    modified_array = []
    for word in array:
        current_string = ''
        for char in word:
            if char.lower() in ['a', 'e', 'i', 'o', 'u']:
                continue
            current_string += char
        modified_array.append(current_string)

    return modified_array



print(remove_vowels("abcdefghijklmnopqrstuvwxyz") == ["bcdfghjklmnpqrstvwxyz"])
print(remove_vowels("green YELLOW black white") == ["grn", "YLLW", "blck", "wht"])
print(remove_vowels("ABC AEIOU XYZ") == ['BC', '', 'XYZ'])