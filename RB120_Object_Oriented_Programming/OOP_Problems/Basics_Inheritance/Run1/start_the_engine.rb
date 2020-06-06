class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end

end

class Truck < Vehicle
  def initialize(year)
    super         #invoking super without parentheses passes all arguments to the superclass with the same method name
    start_engine
  end

  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1934)

puts truck1.year