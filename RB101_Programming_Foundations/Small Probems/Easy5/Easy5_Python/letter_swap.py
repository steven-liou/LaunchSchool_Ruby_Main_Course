# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces


'''
input : string
output : a new string with every word's first and last letter swapped

Algo :
    split the string into array by ' '
    iterate through the array
        for each word, swap its first and last character
    join the array back by ' '
'''

def swap(string):
    array = string.split()
    swapped_array = [''] * len(array)

    for index, word in enumerate(array):
        word_array = list(word)
        word_array[0], word_array[-1] = word_array[-1], word_array[0]
        swapped_array[index] = ''.join(word_array)
    return ' '.join(swapped_array)




print(swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si')
print(swap('Abcde') == 'ebcdA')
print(swap('a') == 'a')