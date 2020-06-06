
# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.


def dms(degree):
    degrees, hours = divmod(degree, 1)
    minutes, minute = divmod (hours * 60, 1)
    seconds = minute * 60
    if round(seconds) == 60:
        minutes += 1
        seconds = 0

    return f"{degrees:02.0f}\xB0{minutes:02.0f}'{seconds:02.0f}\""

    print(minutes, seconds)







print(dms(30)) #== (30°00'00")
print(dms(76.73)) #== (76°43'48")
print(dms(254.6)) #== (254°36'00")
print(dms(93.034773)) #== (93°02'05")
print(dms(0)) #== (0°00'00")
print(dms(360)) #== (360°00'00") || dms(360) == (0°00'00")