# input : time in minutes, positive or negative
# output : string of "hh:mm"

# hour numbers are between 0 and 24
# minute numbers are between 0 and 59

# if the minutes is positive, determine the hour and minute
#   hour = miuntes / 60
#   hour %= 24
#   minute = minutes % 60
# if the minute is negative, determine the hour and minute
#  find the remainder of minutes by 2400
#  add the remainder to 2400
# determine the hour and minutes the same way as above

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(minutes)
  delta_minute = minutes % MINUTES_PER_DAY
  hour, minute = delta_minute.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hour, minute)
end

puts time_of_day(-3) == "23:57"

puts time_of_day(3000) == "02:00"
puts time_of_day(0) == "00:00"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"