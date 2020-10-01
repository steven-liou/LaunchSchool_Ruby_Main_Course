# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

'''
input : string
output : sum of the characters' ascii values
Algo :
    create a variable for sum that starts at 0
    iterate through each character in the string
        - convert the char to ascii value, add it to sum
    return sum

'''


def ascii_value(string):
    sum = 0

    for char in string:
        sum += ord(char)
    return sum
    


print(ascii_value('Four score') == 984)
print(ascii_value('Launch School') == 1251)
print(ascii_value('a') == 97)
print(ascii_value('') == 0)