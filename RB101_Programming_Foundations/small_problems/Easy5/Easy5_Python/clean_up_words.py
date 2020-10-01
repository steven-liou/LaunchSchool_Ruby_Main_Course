# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

'''
Input: string

Output: original string with non-alphabetic characters removed

Rules


Data structure / Algorithms

    create an empty string for result
    have a start and end index
    check if the current character is alphabetic
        if it is not, then check if the next character is alphabetic
            if the next character is not alphabetic, then continue
            else append a space to the result string
        if it is alphabetic, then append result string with the character

'''

def cleanup(string):
    result = ''

    for index, char in enumerate(string):
        if char.isalpha():
            result += char
        else:
            if index < len(string )- 1 and not string[index + 1].isalpha():
                pass
            else:
                result += ' '
    return result


print(cleanup("---what's my +*& line?") == ' what s my line ')
