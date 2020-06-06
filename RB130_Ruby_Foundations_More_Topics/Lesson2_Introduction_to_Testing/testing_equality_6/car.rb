class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other_car)
    other.is_a?(Car) && name == other_car.name
  end
end

