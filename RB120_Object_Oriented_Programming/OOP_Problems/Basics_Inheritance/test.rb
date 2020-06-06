class Dog
  attr_accessor :name
  @@name = 'GoodDog'

  def self.name
    self
  end

  def self.to_s
    @@name
  end

end

puts Dog