# have a current number that starts at 14
# have a X variable
# Start an infinite loop
# break if current number - X is greater than 3
# if the current number is divisble by 3, increment number by 1, next
# if the current number is not divsible by 3, get its remainder by 13
#   If the remainder is divisible by 3, increment the number by 1, next
# . else, set variable X to current number

x = 14
current_number = 14

loop do

  x = current_number if current_number % 3 != 0 && ( current_number % 13 ) % 3 != 0
  current_number += 1
  break if current_number - x > 3
end

puts x