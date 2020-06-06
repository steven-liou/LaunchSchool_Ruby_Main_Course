# Write a method that returns the next to last word in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

'''
Input: string

Output: second to last word in the string

Rules


Data structure / Algorithms
    split the string into list by space
    return the -2 position in the array


'''

def penultimate(string):
    return string.split()[-2]


print(penultimate('last word') == 'last')
print(penultimate('Launch School is great!') == 'is')