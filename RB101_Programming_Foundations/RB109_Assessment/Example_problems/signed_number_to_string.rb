=begin
Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.
=end

=begin

Input : a number

Output : signed representation of the number in string

Rules :

Algorithm:
    check the sign of the number, if its is less than 0 sign is '-', if greater than 0, sign is '+', else, sign is ''
    A string representation of the numbers in an array
    Have an array that holds the digits of the number
      - to get each digit of a number, get the remainder of the number by 10
      - divide the number by 10
      - repeat until the number is == 0
    Convert the digits to the string version by referencing the number_string array's index

=end


def signed_integer_to_string(number)
  num_str_arr = ('0'..'9').to_a
  digits = []
  if number > 0
    sign = '+'
  elsif number < 0
    sign = '-'
  else
    sign = ''
  end
  number = number.abs
  while true
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number.to_f / 10 <= 0
  end

  digits_str_arr = for digit in digits.map
                      num_str_arr[digit]
                  end
  sign + digits_str_arr.join('')
end




p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0)  == '0'