# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

count = 1

loop do
  puts count
  count += 2
  break if count == 99
end

# (1..100).each {|num| puts num if num.odd?}

# count.upto(99) {|num| puts num if num.odd?}

