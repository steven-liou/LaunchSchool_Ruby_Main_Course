factorials = Enumerator.new do |y|
  number = 0
  factorial = 1

  loop do
    y << factorial
    number += 1
    factorial *= number
  end
end

7.times do
  puts factorials.next
end

factorials.rewind

factorials.each.with_index do |factorial, index|
  puts factorial
  break if index == 6
end