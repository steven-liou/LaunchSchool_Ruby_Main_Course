class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Animal
  def jump
    puts "Jumping!"
  end
end

class Bulldog < Animal
end

class Cat < Animal
end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

bob.pets.each do |pet|
  pet.jump
end