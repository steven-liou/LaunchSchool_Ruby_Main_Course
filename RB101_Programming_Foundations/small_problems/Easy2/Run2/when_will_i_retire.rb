print "What is your age? "
age = gets.chomp.to_i

print "At what age would you like to retire? "
retire_age = gets.chomp.to_i

years_to_retire = retire_age - age

current_year = Time.new.year
retire_year = current_year + years_to_retire
puts "It's #{current_year}. You will retire in #{retire_year}"
puts "You have only #{years_to_retire} years of work to go!"

