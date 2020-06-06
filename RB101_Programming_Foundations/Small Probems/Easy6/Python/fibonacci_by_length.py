
# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

# Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

# Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

'''
Input: number

Output: the first fibo sequence that has given number of digits

Rules


Data structure / Algorithms
    start the fibo number count at 2
    do the fibo sequence
    for each sequence, check the number of digits is greater or equa to the given length
    return the fibo sequence number

'''

def find_fibonacci_index_by_length(n):
    fibo_num = 3
    prev1 = 1
    prev2 = 2

    while True:
        digits = len(str(prev1))
        if digits >= n:
            break
        prev1, prev2 = prev1 + prev2, prev1
        fibo_num += 1
    return fibo_num



print(find_fibonacci_index_by_length(2)) #== 7)         # 1 1 2 3 5 8 13
print(find_fibonacci_index_by_length(3) == 12)        # 1 1 2 3 5 8 13 21 34 55 89 144
print(find_fibonacci_index_by_length(10) == 45)
print(find_fibonacci_index_by_length(100) == 476)
print(find_fibonacci_index_by_length(1000) == 4782)
print(find_fibonacci_index_by_length(10000) == 47847)