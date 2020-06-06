# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

'''
Input: a string

Output: original string titlecased

Rules


Data structure / Algorithms
    split the string into words
    for each word, capitalize it
    join the array by space


'''

def word_cap(string):
    words = string.split()

    for index, word in enumerate(words):
        words[index] = word.capitalize()
    return ' '.join(words)

print(word_cap('four score and seven') == 'Four Score And Seven')
print(word_cap('the javaScript language') == 'The Javascript Language')
print(word_cap('this is a "quoted" word') == 'This Is A "quoted" Word')