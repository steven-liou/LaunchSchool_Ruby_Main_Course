fib  = Enumerator.new do |y|
  puts "Enter enumerator"
  a = b = 1

  loop do
    puts "Inside loop"
    y << a
    puts "y: #{y.inspect}, a: #{a}, b: #{b}"
    a, b = b, a +b
  end
end

puts fib.next
puts fib.next
puts fib.next




