#convert number to string
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']


def integer_to_string(number)
  result_string = ''

  loop do
    digit = number % 10
    result_string.prepend(DIGITS[digit])

    number /= 10
    break if number == 0
  end
  result_string
end



puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'