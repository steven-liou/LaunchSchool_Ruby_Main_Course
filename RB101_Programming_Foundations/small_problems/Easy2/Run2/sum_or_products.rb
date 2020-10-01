def integer_sum_to_n(int)
  (1..int).reduce(:+)
end

def integer_product_to_n(int)
  (1..int).reduce(:*)
end

puts "Please enter an integer greater than 0:"
integer = gets.chomp.to_i
puts "Enter 's' to compute the sum, 'p' to compute the product."
answer = gets.chomp

if answer[0] == 's'
  sum = integer_sum_to_n(integer)
  puts "The sum of the integers between 1 and #{integer} is #{sum}"
else
  product = integer_product_to_n(integer)
  puts "The product of the integers between 1 and #{integer} is #{product}"
end



