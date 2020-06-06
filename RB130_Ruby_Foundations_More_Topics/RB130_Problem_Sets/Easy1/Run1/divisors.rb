# Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.

=begin

Input : a number

Output : array of divisors of that number

Rules


Data structure / Algorithms
  create an arary for storing the divisors
  start a divisor number at 1
  start a loop that stops when divisor is greater than the given number
    check if the number is divisible by the divisor
       add the divisor to the array if divisible
       set the new number to number / divisor
       reset divisor to 1
    increment the divisor by 1

=end
require 'benchmark'

def divisors(number)
  multiples = multiples(number)
  divisors = []

  n = 1
  index = 0

  while n <= multiples.size
    divisors << array_product(multiples[index, n])

    if index == multiples.size - 1
      n += 1
      index = 0
    else
      index += 1
    end
  end
  divisors.sort.uniq
end

def array_product(array)
  array.reduce(&:*)
end

def multiples(number)
  multiples = [1]
  divisor = 2

  while divisor <= number
    if number % divisor == 0
      multiples << divisor
      number /= divisor
      if number % divisor != 0
        divisor += 1
      end
      next
    end
    divisor += 1
  end
  multiples
end

# Approach 2
# Generate a consecutive numbers array starting at 1 and ending at given number
# Select from the array only elements that can divide the given number

# def divisors(number)
#   (1..number).to_a.select { |divisor| number % divisor == 0 }
# end


p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]

p Benchmark.realtime() {divisors(1) == [1] }
p Benchmark.realtime() {divisors(7) == [1, 7] }
p Benchmark.realtime() {divisors(12) == [1, 2, 3, 4, 6, 12] }
p Benchmark.realtime() {divisors(98) == [1, 2, 7, 14, 49, 98] }
p Benchmark.realtime() {divisors(99400891) == [1, 9967, 9973, 99400891] }

