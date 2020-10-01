# input : a number
# output : the next featured number greater than the input number

# featured number : odd number, multiple of 7, whose digits occur exactly once each

# If the input number is even, first add 1 to it, check if this number is featured number
# if it is, return the number
# else increment the number by 2, check if the number is a featured number
require 'pry'
def featured(number)
  number += 1
  number += 1 until number.odd? && number % 7 == 0

  loop do
    break if number.to_s.chars == number.to_s.chars.uniq
    number += 14
    return "There is no possible number that fulfills these requirements" if number >= 9_876_543_210
  end
  number
end



# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999)