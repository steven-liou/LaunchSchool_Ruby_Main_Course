# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

'''
Input: string

Output: new string with consecutive duplicate characters collapsed into one

Rules


Data structure / Algorithms
    have a variable string that holds the result
    iterate each character of the given string with index
        check if the idx is at the end, and check if the next character is the same as the current one
            if it is, continue
            else append the current character to the result string
        if the index is at the end, append the current char to the string




'''

def crunch(string):
    result = ''

    for idx, char in enumerate(string):
        if idx < len(string) - 1 and char == string[idx + 1]:
            continue
        result += char

    return result

print(crunch('ddaaiillyy ddoouubbllee') == 'daily double')
print(crunch('4444abcabccba') == '4abcabcba')
print(crunch('ggggggggggggggg') == 'g')
print(crunch('a') == 'a')
print(crunch('') == '')