print "What is the bill? "
bill = gets.chomp.to_f
print "What is the tip percentage? "
tip = gets.chomp.to_f / 100

tip = bill * tip
total = bill + tip

puts "The tip is $#{format("%0.2f", tip)}" 
puts "The total is $#{format("%0.2f", total)}"
