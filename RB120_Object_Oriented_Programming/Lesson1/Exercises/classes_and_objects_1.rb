=begin
1. Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.

2. Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.

3. You want to create a nice interface that allows you to accurately describe the action you want your program to perform. Create a method called spray_paint that can be called on an object and will modify the color of the car
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
end

mustang = MyCar.new(2020, 'red', 'Mustang')
mustang.spray_paint('black')
p mustang.color
