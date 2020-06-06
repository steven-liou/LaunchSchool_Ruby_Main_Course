class FarmAnimal
  def speak
    "#{self.class} says "
  end
end

class Sheep < FarmAnimal
  def speak
    super + "boa!"
  end


end

class Lamb < Sheep
  def speak
    super + "boooooooa!"
  end


end


class Cow < FarmAnimal
  def speak
    super + "moooooooo!"
  end


end


p Sheep.new.speak # => "Sheep says baa!"
p Lamb.new.speak # => "Lamb says baa!baaaaaaa!"
p Cow.new.speak # => "Cow says mooooooo!"