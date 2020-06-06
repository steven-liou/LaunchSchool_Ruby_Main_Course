#convert number to string
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

# def signed_integer_to_string(number)

#   if number < 0
#     sign = '-'
#   elsif number > 0
#     sign = '+'
#   else
#     sign = ''
#   end

#   string_num = integer_to_string(number.abs)

#   sign + string_num
# end

def signed_integer_to_string(number)
  sign , number = case number <=> 0
  when -1 then ['-', -number]
  when +1 then ['+', number]
  else         ['', number]
  end

  sign + integer_to_string(number)
end



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


puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'