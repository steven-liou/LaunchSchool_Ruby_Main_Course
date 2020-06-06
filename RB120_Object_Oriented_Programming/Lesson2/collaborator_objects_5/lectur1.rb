# Demonstrate that you can assign an instance variable to any object like you would a local variable.
# You can also assign a class's instance variable to an object of another custom class that you created, but it is no surprise since everything in Ruby is an object, even String, Integer, Array, Hash, etc.

class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end

class Bulldog
  def speak
    "Bark!"
  end

  def fetch
    "Fetching!"
  end

end

bob = Person.new("Robert")
bud = Bulldog.new

bob.pet = bud

p bob.pet.class
puts bob.pet.speak
puts bob.pet.fetch