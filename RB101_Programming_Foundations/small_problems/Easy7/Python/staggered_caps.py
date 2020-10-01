# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.


'''
Input: string

Output: new string with every other letter capitalized

Rules


Data structure / Algorithms
    create an array of length of original string for storing result
    create a capital variable set to boolean True

    iterate through the string, with index
        if the character is alphabet
            if it is, then check if capital is True
                if capital is True, then capitalize current char, add it to result
                if capital is False, then lowercase the current char, add it to result
            flip capital
        else
            add the current char to result
            flip capital



'''

def staggered_case(string):
    result = [''] * len(string)
    capital = True

    for index, char in enumerate(string):
        if char.isalpha():
            if capital:
                result[index] = char.capitalize()
            else:
                result[index] = char.lower()
            capital = not capital
        else:
            result[index] = char
            capital = not capital
    return ''.join(result)



print(staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!')
print(staggered_case('ALL_CAPS') == 'AlL_CaPs')
print(staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS')
