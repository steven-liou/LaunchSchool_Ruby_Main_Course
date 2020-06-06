# Build a program that displays when the user will retire and how many years she has to work till retirement.

print "What is your age? "
current_age = gets.chomp.to_i
print "At what age would you like to retire? "
retirement_age = gets.chomp.to_i

years_till_retire = retirement_age - current_age

#calculate the years from now
current_year = Time.now.year
retirement_age = current_year + years_till_retire

puts "It's #{current_year}. You will retire in #{retirement_age}"
puts "You have only #{years_till_retire} years of work to go!"