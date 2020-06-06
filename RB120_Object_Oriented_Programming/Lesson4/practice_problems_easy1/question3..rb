module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end


# When we mixin a module into our class, it has access to object scope, and the self keyword in the object scope methods refer to the current instance of the class.
# When we call the class method on the current object, it returns the class it belongs to (Car)