

def fibonacci_last(n)
  return 1 if n <= 2

  prev1 = 1
  prev2 = 1

  i = 2

  while i < n
    prev1, prev2 = (prev1 + prev2) % 10, prev1
    i += 1
  end
  prev1
end


p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4