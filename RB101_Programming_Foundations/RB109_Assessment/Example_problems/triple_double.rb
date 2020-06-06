=begin
Write a function

triple_double(num1, num2)
which takes numbers num1 and num2 and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.

If this isn't the case, return 0

Examples
triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and  num2 has straight double 99s

triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2
=end

=begin

Input : two numbers

Output : 1 if triple in num1, and double in num2, else 0

Rules
  straight triple of a number at any place in num1
  straight double of the same number in num2


Data structure / Algorithms
  break the number into digits for num1
  set a variable for triple
  iterate through the digits with index, from 0 to length - 4
    check if the current digit is the same as the next one, and the one after next one
    if it is, assign current digit to triple, break

  if triple
    create a result variable
    break the number into digits for num2
      check the count of "triple" in num2
      if the count is 2, then return 1
      else return 0
  else return 0

=end

def triple_double(num1, num2)
  triple = nil
  digits = num1.digits

  0.step(digits.size - 3) do |idx|
     if digits[idx] == digits[idx + 1] && digits[idx] == digits[idx + 2]
       triple = digits[idx]
       break
     end
  end

  if triple
    digits = num2.digits
    result =  digits.count(triple) == 2 ? 1 : 0
  else
    result = 0
  end


end

p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1
