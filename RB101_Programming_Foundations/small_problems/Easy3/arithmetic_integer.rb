# Input: 2 positive integers
# Perform addition, subtraction, product, quotient, remainder, power on those two integers
#output each operation's results


puts "==> Enter the first number:"
num1 = gets.chomp.to_f
num2 = nil
loop do
  puts "==> Enter the second number:"
  num2 = gets.chomp.to_f
  break unless num2 ==0
  puts "Please enter non-zero number"
end

sum = num1 + num2
diff = num1 - num2
product = num1 * num2
dividend = num1 / num2
remainder = num1 % num2
power = num1 ** num2

puts "==> #{num1} + #{num2} = #{sum}"
puts "==> #{num1} - #{num2} = #{diff}"
puts "==> #{num1} * #{num2} = #{product}"
puts "==> #{num1} / #{num2} = #{dividend}"
puts "==> #{num1} % #{num2} = #{remainder}"
puts "==> #{num1} ** #{num2} = #{power}"
