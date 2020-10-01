# Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

# You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.


'''
Input: string

Output: an array of word followed by length of word

Rules


Data structure / Algorithms
    get the array of words from the string
    create an empty array of length words
    iterate through the words with index
        get the count of words in current word
        store the word and count to the result array
    return the result array



'''

def word_lengths(string):
    words = string.split()
    result_array = [''] * len(words)

    for index, word in enumerate(words):
        count = len(word)
        result_array[index] = f"{word} {count}"

    return result_array




print(word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"])

print(word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"])

print(word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"])

print(word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"])

print(word_lengths("") == [])