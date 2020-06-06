
require 'objspace'

last_memory = 0

100000.times do |number|
  memory = ObjectSpace.memsize_of('a' * number)
  break if number > 100 && memory - last_memory >= 2
  last_memory = memory
  puts "Number of #{number} characters occupy #{memory} bytes"
end

