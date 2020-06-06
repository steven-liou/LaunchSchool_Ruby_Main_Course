module Speed
  def go_fast
    puts "I'm a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I'm safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow"
  end
end

truck = Truck.new
car = Car.new
truck.go_fast
car.go_fast