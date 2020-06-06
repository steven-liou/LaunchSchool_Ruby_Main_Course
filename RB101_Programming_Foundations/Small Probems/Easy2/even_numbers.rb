# Print the even numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

count = 1

while count < 99
  puts count if count.even?
  count += 1
end
