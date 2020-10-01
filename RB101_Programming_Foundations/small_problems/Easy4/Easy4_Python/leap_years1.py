# In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input, and returns True if the year is a leap year, or False if it is not a leap year.


'''
input : year
output : True/False if the given year is a leap year

Rule :
    A leap year is divisible by 4, but not by 100, unless it is divisible by 400

Algo :
    Check if the year is divisible by 400, if it is return True
    Check if the year is divisible by 100, if it is return False
    check if the year is divisible by 4, if it is, return True
    else return False

'''

def leap_year(year):
    if year % 400 == 0:
        result = True
    elif year % 100 == 0:
        result = False
    elif year % 4 == 0:
        result = True
    else:
        result = False
    return result


print(leap_year(2016) == True)
print(leap_year(2015) == False)
print(leap_year(2100) == False)
print(leap_year(2400) == True)
print(leap_year(240000) == True)
print(leap_year(240001) == False)
print(leap_year(2000) == True)
print(leap_year(1900) == False)
print(leap_year(1752) == True)
print(leap_year(1700) == False)
print(leap_year(1) == False)
print(leap_year(100) == False)
print(leap_year(400) == True)