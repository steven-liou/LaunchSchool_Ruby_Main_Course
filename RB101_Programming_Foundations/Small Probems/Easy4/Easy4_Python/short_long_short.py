# Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

'''
Input : two strings

Output : short-long-short string

Rules :

Algorithm:
    - Determine the shorter of the two string, then the longer of the two string
    - concatenate them in short-long-short fashion
    - return the string
'''

def short_long_short(str1, str2):
    if len(str1) <= len(str2):
        short_str = str1
        long_str = str2
    else:
        short_str = str2
        long_str = str1

    return short_str + long_str + short_str


print(short_long_short('abc', 'defgh') == "abcdefghabc")
print(short_long_short('abcde', 'fgh') == "fghabcdefgh")
print(short_long_short('', 'xyz') == "xyz")