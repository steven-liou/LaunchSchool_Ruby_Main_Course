# write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer


# Examples:
#>>> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15


# # Examples:
# #>>> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The sum of the integers between 1 and 6 is 120

def sum(number)
  sum = 0

  (1..number).each do |num|
    sum += num
  end
  sum
end

def product(number)
  product = 1

  (1..number).each do |num|
    product *= num
    p product
  end
  product
end



puts "Please enter an integer greater than 0: "
number = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

case operation
when 's'
  sum = sum(number)
  puts "THe sum of the integers between 1 and #{number} is #{sum}"
when 'p'
  product = product(number)
  puts "The product of the integers between 1 and #{number} is #{product}"
end

