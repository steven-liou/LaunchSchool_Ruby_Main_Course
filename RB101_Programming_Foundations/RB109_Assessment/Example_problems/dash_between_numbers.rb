# Write a method that takes in a number and returns a string, placing a dash in between odd digits.

=begin

Input: a number

Output: a string that places a dash in between odd digits

Rules

Data structure / Algorithms
  - create an empty string that stores result
  - get the digits into an array
    - digits.reverse
  - iterate through the digits array from the 0 index
    - for each digit, each if the previous digit is odd, (except the index 0)
    - if it is, add a dash then the digit to result string
    - else, add the digit to the result string
  -return the results string


Pseudo Code

=end

def dasherizer(number)
  result = ''
  digits_array = []

  while number > 0
    number, remainder = number.divmod(10)
    digits_array.unshift(remainder)
  end

  for digit in digits_array.each
    if !result[-1]
      result << digit.to_s
    elsif result[-1].to_i.odd? && digit.odd?
      result << ('-' + digit.to_s)
    else
      result << digit.to_s
    end
  end
  result

end


p dasherizer(2112) == '21-12'
p dasherizer(201105742) == '201-105-742'
p dasherizer(123456789) == '123456789'
p dasherizer(21121) == '21-121'