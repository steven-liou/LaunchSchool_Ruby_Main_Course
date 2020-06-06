#Problem 1 and 2

# class MyCar
#   attr_accessor :color, :car, :model, :speed, :year

#   def initialize(year, car, model)
#     self.year = year
#     self.car = car
#     self.model = model
#     self.speed = 0
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

#   def self.gas_mileage(gallons, miles)
#    puts "#{miles / gallons} miles per gallon of gas"
#   end

#   def to_s
#     "You are looking at a brand new #{self.color} #{self.car} made by #{self.model} in #{self.year}"
#   end


# end

# MyCar.gas_mileage(13, 351)
# mustang = MyCar.new(2020, "mustang", "Ford")
# mustang.spray_paint("red")
# puts mustang


#Problem 3
# THe error occurs becuase the attr_reader method only creates a getter, and no setter. Therefore, line 9 is trying to invoke the setter method called name, which doesnt exist.