# Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

'''
Input : a number tha represents year
output : the correct century in string

Algorithm :
    - first determine the century number by dividing the year by 100, and get the remainder.
        - If the remainder is greater than 0, add 1 to the century number
    - check if the tens digit is not between 11-13
        - Check if the century's single digit is 1, 2, or 3, which should end in st, nd, and rd.
    - Else, append th to the number

'''

def century(year):
    century, remainder = divmod(year, 100)
    if remainder > 0:
        century += 1

    tens = century % 100
    ones = century % 10

    if not tens in [11, 12, 13] and ones in [1, 2, 3]:
        if ones == 1:
            suffix = "st"
        elif ones == 2:
            suffix = "nd"
        else:
            suffix = "rd"
    else:
        suffix = "th"

    return str(century) + suffix




print(century(2000) == '20th')
print(century(2001) == '21st')
print(century(1965) == '20th')
print(century(256) == '3rd')
print(century(5) == '1st')
print(century(10103) == '102nd')
print(century(1052) == '11th')
print(century(1127) == '12th')
print(century(11201) == '113th')