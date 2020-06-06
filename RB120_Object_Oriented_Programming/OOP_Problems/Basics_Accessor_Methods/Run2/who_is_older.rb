class Person
  attr_writer :age

  def older_than?(other)
    age > other.age
  end

  protected

  attr_reader :age
end

class Adult < Person
end

person1 = Person.new
person1.age = 17

adult1 = Adult.new
adult1.age = 26

puts person1.older_than?(adult1)
