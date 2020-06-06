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


# @@cats_count is a class variable shared among all instances of Cat
# When a new Cat object is initialized with the keyword new, it would add one to @@cats_count
# Therefore, it keeps count of how many instances of Cat have been created

p Cat.cats_count
cat1 = Cat.new('Puff')
p Cat.cats_count
cat2 = Cat.new('doo')
p Cat.cats_count