class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# case 1
hello = Hello.new
hello.hi
# outputs "Hello"

# case 2
# hello = Hello.new
# hello.bye
# NoMethodError

# case 3
# hello = Hello.new
# hello.greet
# ArgumentError (Expected 1 given 0)

# case 4
hello = Hello.new
hello.greet("Goodbye")
#outputs "Goodbye"

# case 5
# Hello.hi
# NoMethodError since there is no class method called hi