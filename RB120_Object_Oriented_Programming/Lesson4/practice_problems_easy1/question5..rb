class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# The Pizza class has an instance variable because they begin with the symbol @
# You can also check the instance variables of an object using the Ojbext#instance_variables method


hot_pizza = Pizza.new("cheese")
orange = Fruit.new("apple")

p hot_pizza.instance_variables
p orange.instance_variables