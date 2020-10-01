# Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

'''
Input: an array of numbers from 0 to 19

Output: sort the numbers based on English version of the number

Rules


Data structure / Algorithms
    create an array of subarrays with [num, English-num]
    then sort the array by English alphabet
    then return an array of numbers that are sorted


'''



def alphabetic_number_sort():
    array = [i for i in range(0, 20)]

    array.sort(key=sort_alpha)
    return array


def sort_alpha(index):
    number_words = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
                    "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeeN", "eighteen", "nineteen"]
    return number_words[index]





print(alphabetic_number_sort() == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
])