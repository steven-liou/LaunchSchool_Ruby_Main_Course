class Dog
  def self.talk
    "hello"
  end
end

class BullDog < Dog
end

puts BullDog.talk