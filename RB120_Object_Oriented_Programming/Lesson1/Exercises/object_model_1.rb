=begin

1. How do we create an object in Ruby? Give an example of the creation of an object.
  We can create an object in Ruby by calling the class's .new method, can give its constructor the correct arguments

2. What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.

  A motulde is a collectin of methods or variables that you can import into your class as mixins, so you can inherit the methods in the module you import
=end


module Exams
  def start_timer
    "You have X minutes to finish the test"
  end
end


class MyClass
  include Exams


end

my_obj = MyClass.new
p my_obj.start_timer