# input : a number representing the year
# output : number of Fridays that land on the 13 th of the month

# iterate through the months of the year
# create a date object on that month's 13th
# check if that date is a friday
# if it is, add one to the count of friday the 13th

require 'date'

def friday_13th(year)
  friday_counts = 0

  date = Date.new(year, 1, 13)
  12.times do |month|
    friday_counts += 1 if date.friday?
    date = date.next_month
  end

  friday_counts
end


p friday_13th(2015) # == 3
p friday_13th(1986) # == 1
p friday_13th(2019) # == 2