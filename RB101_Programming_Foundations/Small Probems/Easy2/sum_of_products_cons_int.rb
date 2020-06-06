# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.


def compute_sum(number)
  (1..number).inject { |sum, val| sum += val }
end


def compute_product(number)
  1.upto(number).reduce { |product, val| product *= val}
end

puts "Please enter an integer greater than 0:"
number = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation[0].downcase == 's'
  sum = compute_sum(number)
  puts "The sum of the integers between 1 and #{number} is #{sum}"
elsif operation[0].downcase == 'p'
  product = compute_product(number)
  puts "The product of the integers between 1 and #{number} is #{product}"
else
  puts "Oops. Unknown operation."
end




