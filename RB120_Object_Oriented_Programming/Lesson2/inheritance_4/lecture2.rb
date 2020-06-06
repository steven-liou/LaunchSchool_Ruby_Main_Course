class Animal


  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Animal

  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end


  def fetch
    'fetching!'
  end
end


class Cat < Animal

  def speak
    'Meow!'
  end
end



=begin
     Animal
   Dog     Cat
 Bullgdog

=end