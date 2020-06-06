#Problem 1
# class Animal
# end

# dog = Animal.new


#Problem
# A module is like a library of functions that a class can import. A user can also directly use the module by importing it to the "main" and call its methods. We can use it in our class by useing the keyword "include".

# When a library is included in a class, the objects can call it directly, as Ruby will look up the inheritance chain. When a library is imported in a script, the user may need to do LIbrary.method

module Motions
  def jump
    puts "Animal is jumping"
  end

  def sit
    puts "Animal is sitting"
  end
end

class Animal
  include Motions
end

dog = Animal.new
dog.jump
dog.sit