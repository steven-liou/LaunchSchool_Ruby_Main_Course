#Problem 1
=begin
print "Please enter your name: "
name = gets.chomp
puts "Hello #{name}, welcome!"
=end

#Problem 2
# print "How old are you? "
# age = gets.chomp.to_i
# puts "In 10 years you will be:\n#{age + 10}"
# puts "In 20 years you will be:\n#{age + 20}"
# puts "In 30 years you will be:\n#{age + 30}"
# puts "In 40 years you will be:\n#{age + 40}"


#Problem 3
# 10.times {puts "Steven Liou"}

#Problem 4
# print "Enter your first name: "
# first_name = gets.chomp
# print "Enter your last name: "
# last_name = gets.chomp
# puts first_name + ' ' + last_name


#Problem 5
#Since the do/end block is used inside the 'times' method, it creates a local scope

#In the first case, x is global scope, so x can be access inside the local scope
#In the second case, x is declared in the local scope, so it cannot be accessed in the global scope
