=begin
Write a function that takes two parameters, both integers. First represent a number, and second represnt the digit position from the right. Return the specified digit from the number.

*cannot convert the number to string, or use #integer.digits

=end


get_digit(1234, 1) == 4
get_digit(1234, 4) == 1
get_digit(1234567890, 10) == 1