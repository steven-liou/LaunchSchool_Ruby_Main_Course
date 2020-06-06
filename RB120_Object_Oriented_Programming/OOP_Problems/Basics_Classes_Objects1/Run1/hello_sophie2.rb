class Cat
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is Sophie!"
  end

end

kitty = Cat.new('Sophie')
kitty.greet