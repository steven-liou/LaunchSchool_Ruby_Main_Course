class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

prada = Bag.new('Black', 'idk')
p prada

# Or if you just want to create a new instance of this class without initialization, you can call
# Class#allocate, which creates an instance of your class
# The new keyword basically calls Class#allocate followed by calling your initialize method on the new object

mystery = Bag.allocate
p mystery