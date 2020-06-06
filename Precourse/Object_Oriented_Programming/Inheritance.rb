#Problem 1
# class Vehicle

#   def speed_up(acc_rate, sec)
#     self.speed += acc_rate * sec
#   end

#   def brake(acc_rate, sec)
#     self.speed -= acc_rate * sec
#   end

#   def shut_off
#     if self.speed < 5
#       puts "Shutting down the machine"
#       self.speed = 0
#     else
#       puts "#{self.car} is running at #{self.speed} and is not safe to automatically shut off. Please drop below 5 mph"
#     end
#   end

#   def spray_paint(color)
#     self.color = color
#   end

# end


# class MyCar < Vehicle
#   attr_accessor :color, :car, :model, :speed
#   attr_reader :year
#   NUMBER_OF_DOORS = 4
#   def initialize(year, car, model)
#     @year = year
#     @car = car
#     @model = model
#     @speed = 0
#   end

# end

# class MyTruck < Vehicle
#   NUMBER_OF_DOORS = 2
# end


#Problem 2 and 3
# module Sustainable
#   def insured
#     "This house has insurance"
#   end
# end

# class Town
#   @@houses = 0

#   def initialize
#     @@houses += 1
#   end

#   def self.num_houses
#     puts "There are #{@@houses} houses in this town"
#   end

# end

# class House < Town
#   include Sustainable
# end

# house1 = House.new
# house2 = House.new
# Town.num_houses
# puts house1.insured

#Problem 4
# puts MyCar.ancestors
# puts MyTruck.ancestors
# puts Vechile.ancestors



#Problem 5 and 6
# class Vehicle
#   attr_accessor :color, :car, :model, :speed
#   attr_reader :year

#   def initialize(year, car, model)
#     @year = year
#     @car = car
#     @model = model
#     @speed = 0
#   end
#   def speed_up(acc_rate, sec)
#     self.speed += acc_rate * sec
#   end

#   def brake(acc_rate, sec)
#     self.speed -= acc_rate * sec
#   end

#   def shut_off
#     if self.speed < 5
#       puts "Shutting down the machine"
#       self.speed = 0
#     else
#       puts "#{self.car} is running at #{self.speed} and is not safe to automatically shut off. Please drop below 5 mph"
#     end
#   end

#   def spray_paint(color)
#     self.color = color
#   end

#   def age
#     "Your #{self.model} is #{find_age} years old."
#   end
#   private

#   def find_age
#     Time.now.year - self.year
#   end

# end


# class MyCar < Vehicle
#   NUMBER_OF_DOORS = 4
# end

# class MyTruck < Vehicle
#   NUMBER_OF_DOORS = 2
# end

# car = MyCar.new(2020, "Sedan", "Civic")
# truck = MyTruck.new(2015, "4x4", "Explorer")

# p car
# p truck

# car.shut_off

# puts car.age
# puts truck.age


#Problem 7
# class Student

#   def initialize(name, grade)
#     @name = name
#     @grade = grade
#   end

#   def better_grade_than?(student)
#     grade > student.grade ? true : false
#   end


#   protected

#   def grade
#     @grade
#   end
# end

# joe = Student.new("Joe", 85)
# bob = Student.new("Bob", 70)

# puts "Well done!" if joe.better_grade_than?(bob)

#Problem 8
# The method is private, which means it can only be called from within the scope of the object, and not outside the object. Move the hi method to above the private method call.