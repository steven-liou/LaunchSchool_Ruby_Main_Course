=begin
1. Add a class method to your MyCar class that calculates the gas mileage of any car.



=end



class MyCar
  attr_accessor :color
  attr_reader :year
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speedup(number)
    old_speed = @speed
    @speed += number
    "The car speed up from #{old_speed} to #{@speed}"
  end

  def brake(number)
    old_speed = @speed
    @speed -= number
    "The car slowed down from #{old_speed} to #{@speed} mph"
  end

  def shut_off
    "The car has shut off"
  end

  def spray_paint(color)
    self.color = color
  end

  def to_s
    "Your #{self.color} #{@model} was made in #{self.year}"
  end

  def self.mpg(gallons, miles)
    "The MPG for your car is #{miles / gallons.to_f}"
  end
end

p MyCar.mpg(15, 300)

honda = MyCar.new(2020, 'red', 'Honda')
puts honda
