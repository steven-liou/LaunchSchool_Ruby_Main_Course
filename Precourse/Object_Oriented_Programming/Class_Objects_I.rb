#Problem 1 and 2
class MyCar
  attr_accessor :color, :car, :model, :speed
  attr_reader :year
  def initialize(year, car, model)
    @year = year
    @car = car
    @model = model
    @speed = 0
  end





  def speed_up(acc_rate, sec)
    self.speed += acc_rate * sec
  end

  def brake(acc_rate, sec)
    self.speed -= acc_rate * sec
  end

  def shut_off
    if self.speed < 5
      puts "Shutting down the machine"
      self.speed = 0
    else
      puts "#{self.car} is running at #{self.speed} and is not safe to automatically shut off. Please drop below 5 mph"
    end
  end

  def spray_paint(color)
    self.color = color
  end
end

mustang = MyCar.new(2020, "Mustang", "Ford Mustang")
puts mustang.speed_up(2, 10)
puts mustang.brake(2, 5)
mustang.shut_off
puts mustang.brake(2, 3)
mustang.shut_off

mustang.color = "red"
puts mustang.color

mustang.spray_paint("black")
puts mustang.color