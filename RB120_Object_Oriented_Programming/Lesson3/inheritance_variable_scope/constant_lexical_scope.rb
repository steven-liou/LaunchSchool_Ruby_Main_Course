class Car
  WHEELS = 4

  def wheels
    WHEELS
  end
end

class Motorcycle < Car
  WHEELS = 2
end

civic = Car.new
puts civic.wheels # -> 4

bullet = Motorcycle.new
puts bullet.wheels # -- 4, when you expect the output to be 2
                   # this is becuase the method lookup path is Motorcycle --> Car::wheels
                   # Therefore, the WHEELS's lexical scope is Car, not Motorcycle.
                   # In essence, there are two constants, Car::WHEELS and a Motorcycle::WHEELS



# To get the expected result, you override the superclass method in your subclass

class Motorcycle < Car
  WHEELS = 2

  def wheels
    WHEELS
  end
end

bullet = Motorcycle.new
puts bullet.wheels


# or you can be specific about which constant to refer to in your superclass wheel method

class Car
  WHEELS = 4

  def wheels
    self.class::WHEELS
  end
end

class Motorcycle < Car
  WHEELS = 2
end

bullet = Motorcycle.new
puts bullet.wheels