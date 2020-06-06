# 1 1 2 3 5 8 3 1 4 5 9 4 3 7 0 7 7 4 1 5 6 1 7 8 5

require 'pry'

def fibonacci_last(nth)
  last_2 = [1, 1]
  # fibo sequence's last digit repeats itself after every 60 items

  3.upto(nth % 60) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
  end




puts fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
puts fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
puts fibonacci_last(123456789) # -> 4
puts fibonacci_last(123_456_789_987_745) # -> 5