# Write a method that takes a string, and returns a new string in which every character is doubled.


'''
Input: string

Output: new string with every character doubled

Rules


Data structure / Algorithms
    create an array of size len(string)
    iterate through each character in string
        add to the array the current string * 2


'''


def repeater(string):
    array = [""] * len(string)

    for idx, char in enumerate(string):
        array[idx] = char * 2

    return ''.join(array)

print(repeater('Hello') == "HHeelllloo")
print(repeater("Good job!") == "GGoooodd  jjoobb!!")
print(repeater('') == '')