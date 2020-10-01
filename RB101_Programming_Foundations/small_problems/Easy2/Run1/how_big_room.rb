# Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet
# Do not worry about validating the input at this time.

SQMETERS_TO_SQFEET = 10.7639
SQFEET_TO_SQINCHES = 144
SQINCHES_TO_SQCENTIMETERS = 6.4516

puts "Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

area_sq_m = (length * width).round(2)
area_sq_f = (length * width * SQMETERS_TO_SQFEET).round(2)

puts "The area of the room is #{area_sq_m} square meters (#{area_sq_f} square feet)."

puts "Enter the length of the room in feet:"
length = gets.chomp.to_f

puts "Enter the width of the room in feet:"
width = gets.chomp.to_f

area_sq_feet = (length * width).round(2)
area_sq_inch = (area_sq_feet * SQFEET_TO_SQINCHES).round(2)
area_sq_centi = (area_sq_inch * SQINCHES_TO_SQCENTIMETERS).round(2)

puts "The area of the room is #{area_sq_feet} sq feet, #{area_sq_inch} sq inches, and #{area_sq_centi} sq centimeters"
