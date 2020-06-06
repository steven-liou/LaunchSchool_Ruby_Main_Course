# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

'''
Input: start and end number

Output: the modified string

Rules
    if nubmer is divisble by 3, turn it into 'Fizz'
    if number is divisible by 5, turn it into 'Buzz'
    inf number is divisible by 3 & 5, turn it into FizzBuzz

Data structure / Algorithms
    an array for the results, with size n2 - n1 + 1
    iterate through from 1st number to end number
        check if the current number is divisible by 15
            if it is, add 'FizzBuzz' to the array
        elif check the current number is divisble by 3
            if it is, add 'Fizz' to the array
        elif the current number is divisible by 5
            if it is, add 'Buzz' to the array
        else
            add the current number to the array
    join the array by ', '


'''

def fizzbuzz(n1, n2):
    array = [0] * (n2 - n1 + 1)

    for idx in range(1, n2 + 1):
        if idx % 15 == 0:
            array[idx - 1] = 'FizzBuzz'
        elif idx % 3 == 0:
            array[idx - 1] = 'Fizz'
        elif idx % 5 == 0:
            array[idx - 1] = 'Buzz'
        else:
            array[idx - 1] = str(idx)
    return ', '.join(array)


print(fizzbuzz(1, 15))
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
