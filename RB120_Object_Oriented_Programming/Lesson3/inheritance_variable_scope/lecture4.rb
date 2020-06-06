module Maintenance
  def change_tires
    "Changing #{Car::WHEELS} tires."
  end
end


class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  include Maintenance
end


a_car = Car.new
p a_car.change_tires