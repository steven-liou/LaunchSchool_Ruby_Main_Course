#input: an integer representing year
#output: true if leap year, else flase

# leap year is determined if it is divisible by 4, but not by 100 (unless the year is also divisible by 4 and 100)
  # check if divisible by 4
  # check if divisible by 100
  # check if divisible by 400

# def leap_year?(year)
#   div4 = year % 4 == 0
#   div100 = year % 100 == 0
#   div400 = year % 400 == 0

#   if div4 && !div100 || div400
#     true
#   else
#     false
#   end
# end

def leap_year?(year)
  (year % 4 == 0) && (year % 400 == 0 || year % 100 != 0)
end


puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true