MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR


def after_midnight(time_string)
  hour, minute = convert_to_int(time_string)
  minutes = hour * MINUTES_PER_HOUR + minute
  minutes % MINUTES_PER_DAY
end

def before_midnight(time_string)
  delta_minute = MINUTES_PER_DAY - after_midnight(time_string)
  delta_minute % MINUTES_PER_DAY
end

def convert_to_int(time_string)
  hour_string, minute_string = time_string.scan(/\d{2}/)
  hour = hour_string.to_i
  minute = minute_string.to_i

  return hour, minute
end


puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0