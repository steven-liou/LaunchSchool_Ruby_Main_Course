# The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.


'''
input : number representing minutes
outupt : string that represents the time of day in 24 hour format (hh:mm)

Algo :
    Using the property of modulus, one can convert the minute (+ or -) to the time of day minutes by the minute % total minutes of the day
    Total minutes in a day is minutes/hour * hours/day
    The hour of the day is total minutes // 60
    the minutes of the day is total minutes % 60
    format the numbers to the hh:mm

'''

def time_of_day(minute):
    MINUTES_PER_HOUR = 60
    MINUTES_PER_DAY = 24 * MINUTES_PER_HOUR

    total_minutes = minute % MINUTES_PER_DAY

    hour, minutes = divmod(total_minutes, MINUTES_PER_HOUR)

    return f"{hour:02d}:{minutes:02d}"





print(time_of_day(0) == "00:00")
print(time_of_day(-3) == "23:57")
print(time_of_day(35) == "00:35")
print(time_of_day(-1437) == "00:03")
print(time_of_day(3000) == "02:00")
print(time_of_day(800) == "13:20")
print(time_of_day(-4231) == "01:29")