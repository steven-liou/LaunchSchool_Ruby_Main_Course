# Given a number with even number of digits
# a number that is doubled if it is not a "double number", and return identity value if it is
# Determine if a number is "double number".
# Convert number to string, slice it in halves, check if they are equal


def twice(number)
  number_string = number.to_s
  return number * 2 if number_string.size.odd?

  mid_idx = number_string.size / 2

  first_half = number_string[0..mid_idx - 1]
  second_half = number_string[mid_idx..-1]

  first_half == second_half ? number : number * 2

end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10