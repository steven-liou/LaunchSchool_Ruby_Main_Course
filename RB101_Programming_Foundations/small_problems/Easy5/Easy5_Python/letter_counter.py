# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

'''
Input: a string

Output: a dictinoary with keys the length of words, and values the occurances of that length

Rules


Data structure / Algorithms
    split the sentence into words by space
    create an empty hash
    iterate through the words
        set the hash's key to the length of the current word, and value += 1, starting at 0
    return the hash

'''

def word_sizes(string):
    words = string.split()
    hash = {}

    for word in words:
        hash[len(word)] = hash.setdefault(len(word), 0) + 1

    return hash




print(word_sizes('Four score and seven.') == { 3: 1, 4: 1, 5: 1, 6: 1 })
print(word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3: 5, 6: 1, 7: 2 })
print(word_sizes("What's up doc?") == { 6: 1, 2: 1, 4: 1 })
print(word_sizes('') == {})