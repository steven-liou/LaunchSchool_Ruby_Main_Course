# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

'''
Input : number
output : sum of all numbers between 1 and the number that are multiples of 3 or 5

ALgo :
    start a sum at 0
    iterte from 1 to the number
    check if the current number is divsible by 3 or 5
        if so, add it to the sum
    reutnr sum


'''

def multisum(number):
    sum = 0
    for num in range(1, number + 1):
        if num % 3 == 0 or num % 5 == 0:
            sum += num

    return sum



print(multisum(3) == 3)
print(multisum(5) == 8)
print(multisum(10) == 33)
print(multisum(1000) == 234168)