module Movable
  def learn_to_move
    @can_move = "moving!"
  end

  def move
    "I am #{@can_move}"
  end
end


class Animal
end

class Dog < Animal
  def initialize
    @can_move = "moving!"
  end
end

class Beagle < Dog
  include Movable
end

class Cat < Animal
  include Movable
end

snoopy = Beagle.new
garfield = Cat.new

puts snoopy.move
puts garfield.move






=begin

We have a garage that have ground vehicles that include cars, motorcycles and bicycles

Can you explain what type of relationship exists between

garage and vehicles
vehicles and cars
vehicles and motorcycles
vehicles and bicycles

cars and motorcycles
cars and bicycles

Can you design a class structure for the nouns and add a drive and peddle methods in the classes for the correct objects


The same garage is expanded to include watersport vehicles such as motorsboat. Add it to the class structure. Motorboat also has a drive method. It is similar to the drive method in land vehicle, but with an adidtional behavior. Can you modify the drive method in the module to make it work.
=end