module Walkable
  def walk
    "#{self.class::NAME} am walking"
  end
end

class Person
  include Walkable
end

class Child < Person
  NAME = "Kid"
end

kid = Child.new
puts kid.walk
