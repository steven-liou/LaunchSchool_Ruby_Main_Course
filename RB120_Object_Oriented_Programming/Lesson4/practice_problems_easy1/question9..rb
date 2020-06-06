class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# In the class definition, self refers to the class object that is being defined
# When you use the class keyword, you initialize a constant variable for the class name (Cat)
# It points to the class object that holds "values" of your class body
# self in the class body therefore refers to this class object itself (that Cat points to)


p Cat.cats_count
kitty = Cat.new("hello")
p Cat.cats_count