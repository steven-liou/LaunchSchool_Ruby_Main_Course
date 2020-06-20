=begin

Input : a number

Output : max rotation of original number

Rules


Data structure / Algorithms
  - rotate the current digit to the end
    use parallel assignment
  - iterate through the digits - 1
    - rotate the current digit to the end using parallel assignment

=end

def max_rotation(number)
  digits = to_digits(number)

  digits.each_index do |index|
    break if index == digits.size - 1
    digits[index..-2], digits[-1] = digits[(index + 1)..-1], digits[index]
  end
  to_number(digits)
end

def to_digits(number)
  digits = []
  while number > 0
    number, digit = number.divmod(10)
    digits.unshift(digit)
  end
  digits
end

def to_number(digits)
  digits.reduce(0) { |number, digit| number * 10 + digit }
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15
p max_rotation(8_703_529_146) == 7_321_609_845