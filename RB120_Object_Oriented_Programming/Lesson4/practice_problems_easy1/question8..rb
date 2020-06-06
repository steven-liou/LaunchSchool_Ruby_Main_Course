class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age = 0
  end

  def make_one_year_older
    self.age += 1
  end
end


# The self in the make_one_year_older instance method refers to the current instance of the class
# If you create an object of Cat named kitty, then when you call this method on kitty, self is the object that kitty points to

kitty = Cat.new('House Cat')
p kitty.age
kitty.make_one_year_older
p kitty.age