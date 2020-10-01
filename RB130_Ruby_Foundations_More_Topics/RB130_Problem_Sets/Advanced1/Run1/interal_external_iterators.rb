factorial = Enumerator.new do |y|
  a = b = 1
  loop do
    y << a
    a, b = a * b, b + 1
  end
end

7.times { puts factorial.next }
factorial.rewind

factorial.each_with_index do |value, index|
  puts value
  break if index == 6
end

