# As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

'''
input : a string representing hh:mm
output : either minutes after mid_neight, or before midnight

Algo :
    Conver the input string to total minutes
        - split the string by  ':'
        - convert each array's string to numbers
        - assign hour and minutes  from the array
        - multiply 60 * hour + minutes
    After_midnight :
        The midnutes would be the number from before
    before_midnight is total number of minutes per day - the total minutes


'''


def after_midnight(string):
    array = string.split(':')
    hours, minutes = [int(ele) for ele in array]
    return (hours * 60 + minutes) % (60 * 24)

def before_midnight(string):
    return (60*24 - after_midnight(string) ) % (60 * 24)


print(after_midnight('00:00') == 0)
print(before_midnight('00:00') == 0)
print(after_midnight('12:34') == 754)
print(before_midnight('12:34') == 686)
print(after_midnight('24:00') == 0)
print(before_midnight('24:00') == 0)













