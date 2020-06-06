# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

def stringy(num, start= 1)
  numbers = []

  num.times do |index|
    number = index.even? ? start : (start - 1).abs
    numbers << number
  end

  numbers.join
end

puts stringy(9, 0)