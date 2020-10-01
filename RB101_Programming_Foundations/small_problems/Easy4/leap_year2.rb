# before year 1752, use Julian calender (divisible by 4 is leap year)
# after year 1752, use Georgian calendar (more stringent)


def leap_year?(year)
  if year < 1752
    jualian_leap_year?(year)
  else
    geogrian_leap_year?(year)
  end
end

def jualian_leap_year?(year)
  year % 4 == 0
end

def geogrian_leap_year?(year)
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
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true