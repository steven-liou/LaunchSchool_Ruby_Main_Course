# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

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

    return ''.join(result)


print(staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!')
print(staggered_case('ALL CAPS') == 'AlL cApS')
print(staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs')
