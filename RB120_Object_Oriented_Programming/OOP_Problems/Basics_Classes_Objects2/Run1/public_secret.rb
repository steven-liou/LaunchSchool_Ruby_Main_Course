class Person
  #attr_accessor :secret

  #alternatively, write it manually
  def secret=(message)
    @secret = message
  end

  def secret
    @secret
  end

end

person1 = Person.new
p person1.secret
person1.secret = 'Shh.. this is a secret!'
puts person1.secret