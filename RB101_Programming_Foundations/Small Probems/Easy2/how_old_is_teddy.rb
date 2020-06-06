# Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.
def teddy_age(name= 'Teddy')
  # age = rand(181) + 20
  age = rand(20..200)
  puts "#{name} is #{age} years old!"
end

teddy_age('Steven')

puts "How are you doing today? What is your neame?"
answer = gets.chomp


b = 5