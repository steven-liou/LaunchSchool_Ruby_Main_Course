class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end


# you can use Ruby method attr_accessor, attr_reader, or attr_writer for default getter and setter methods

# with the getter method, instead of calling the instance variable directly with the @type, we can just call the getter method <type>

# This way the code looks cleaner, and if your getter has other functions like security, it would be better practice