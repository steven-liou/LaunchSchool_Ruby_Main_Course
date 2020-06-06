class Team
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    return if person.not_yet_18?
    members.push person
  end
end

class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other_person)
    age > other_person.age
  end

  def not_yet_18?
    age < 18
  end
end

cowboys = Team.new("Dallas Cowboys")
emmitt = Person.new("Emmit Smith", 46)
snoopy = Person.new("Snoopy Doo", 15)
cowboys << emmitt
cowboys << snoopy

puts cowboys.members