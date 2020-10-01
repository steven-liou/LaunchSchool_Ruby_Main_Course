# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

# Words consist only alphabet characters that do not include a space.

'''
Input: a string

Output: a dictinoary with keys the length of words, and values the occurances of that length

Rules


Data structure / Algorithms
    split the sentence into words by space
    create an empty hash
    iterate through the words
        remove the word of non-alphabet characters
        set the hash's key to the length of the current word, and value += 1, starting at 0
    return the hash

'''

def word_sizes(string):
    words = string.split()
    hash = {}

    for word in words:
        word_length = 0
        for char in word:
            if char.isalpha():
                word_length += 1

        hash[word_length] = hash.setdefault(word_length, 0) + 1

    return hash




print(word_sizes('Four score and seven.') == { 3 : 1, 4 : 1, 5 : 2 })
print(word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 : 5, 6 : 3 })
print(word_sizes("What's up doc?") == { 5 : 1, 2 : 1, 3 : 1 })
print(word_sizes('') == {})