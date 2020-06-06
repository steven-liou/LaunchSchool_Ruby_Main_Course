=begin

1. Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.

Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way.

2. Add a class variable to your superclass that can keep track of the number of objects created that inherit from the superclass. Create a method to print out the value of this class variable as well.

3. Create a module that you can mix in to ONE of your subclasses that describes a behavior unique to that subclass

4. Print to the screen your method lookup for the classes that you have created.

5. Move all of the methods from the MyCar class that also pertain to the MyTruck class into the Vehicle class. Make sure that all of your previous method calls are working when you are finished.

6. Write a method called age that calls a private method to calculate the age of the vehicle. Make sure the private method is not available from outside of the class. You'll need to use Ruby's built-in Time class to help.

=end


module Material
  def load(weight)
    puts "You have #{weight} lbs of material in your trunk"
  end
end


class Vehicle
  include Material

  @@vehicle_counts = 0

  attr_accessor :year, :color, :model

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@vehicle_counts += 1
  end

  def self.vehicles_owned
    puts "You own #{@@vehicle_counts} vehicles total"
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



  def self.mpg(gallons, miles)
    "The MPG for your car is #{miles / gallons.to_f}"
  end

  def age
    "Your #{self.model} is #{get_age} years old"
  end

  private

  def get_age
    Time.now.year - self.year
  end

end


class MyTruck < Vehicle
  PURPOSE = 'Work'
  def to_s
    "Your #{self.color} #{@model} truck was made in #{self.year}"
  end
end


class MyCar < Vehicle
  PURPOSE = 'Leisure'
  def to_s
    "Your #{self.color} #{@model} car was made in #{self.year}"
  end

end


honda = MyCar.new(2001, 'red', 'Honda')
four_by = MyTruck.new(2015, 'black', '4x4')

p honda.age
p four_by.age