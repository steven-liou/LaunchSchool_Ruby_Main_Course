module Drivable
  def drive
    puts "driving"
  end
end

class Car
  include Drivable
end

bob_car = Car.new
bob_car.drive