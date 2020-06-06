#input : floating point number that represents an angle between 0 ~ 360
#output : string of degrees (0), minutes ('), and seconds (")

# minute is calculated by the decimals of the degree * 60
# second is calculated by the decimals of the minute * 60

# format the strings accordingly

DEGREE = "\xC2\xB0"

def dms(degree)
  minutes = degree % 1 * 60
  seconds = minutes % 1 * 60
  degree = degree.floor % 360




  format(%(%d%s%02d'%02d"), degree, DEGREE, minutes, seconds)
end


p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) # == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")
