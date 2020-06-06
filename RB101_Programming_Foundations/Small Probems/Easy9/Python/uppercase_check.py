# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.


'''
Input: string

Output: bool true/false if all chars in string is uppercase

Rules


Data structure / Algorithms
    if i make everything to uppercase and it is equal to input string, then every character is uppercase, so return true
    else return false


'''

def uppercase(string):
    return True if string.upper() == string else False

print(uppercase('t') == False)
print(uppercase('T') == True)
print(uppercase('Four Score') == False)
print(uppercase('FOUR SCORE') == True)
print(uppercase('4SCORE!') == True)
print(uppercase('') == True)