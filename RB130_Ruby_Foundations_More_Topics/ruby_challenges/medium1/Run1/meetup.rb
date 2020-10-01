=begin
Data structure / Algorithms
  - find the weekday of the first day of the month in the given year

=end

require 'date'

class Meetup
  WEEKDAY = [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday]
  WEEK_NUMBER = [nil, :first, :second, :third, :fourth]

  def initialize(month, year)
    @month = month
    @year = year
    @first_wkday = Date.new(year, month, 1).wday
    @last_day = Date.new(year, month, -1).day
  end

  def day(wkday, schedule)
    week = WEEK_NUMBER.index(schedule)
    wkday = WEEKDAY.index(wkday)

    date = if week
            day_by_number(week, wkday)
          elsif schedule == :teenth
            day_by_teenth(wkday)
          else
            day_by_last(wkday)
          end
    Date.new(@year, @month, date)
  end

  def day_by_number(week_n, wkday)
    date = 1 + (wkday - @first_wkday) % 7
    date + (week_n - 1) * 7
  end

  def day_by_teenth(wkday)
    13 + (wkday - Date.new(@year, @month, 13).wday) % 7
  end

  def day_by_last(wkday)
    last_day = day_by_number(4, wkday)
    last_day += 7 unless last_day + 7 > @last_day
    last_day
  end

end



