# Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.



# if the number is greater than 0, then add a negative to it
# else return the number

def negative(number):
    if number > 0:
        number = -number
    return number

print(negative(5) == -5)
print(negative(-3) == -3)
print(negative(0) == 0)