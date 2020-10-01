SQMETERS_TO_SQFEET = 10.7639
puts "Enter the length of the rooom in meters:"
length = gets.chomp.to_f
puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

area_m = length * width
area_sqf = area_m * SQMETERS_TO_SQFEET
puts "The area of the room is %0.1f square meters (%0.2f square feet)." % [area_m, area_sqf]
