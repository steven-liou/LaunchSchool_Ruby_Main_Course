# Input: ask user for 6 numbers
# Check if the 6th number has been entered before
# output the match


log = []
count = 1
while count <= 6
  case count
  when 1
    puts "==> Enter the 1st number:"
  when 2
    puts "==> Enter the 2nd number:"
  when 3
    puts "==> Enter the 3rd number:"
  when 4
    puts "==> Enter the 4th number:"
  when 5
    puts "==> Enber the 5th number:"
  when 6
    puts "==> Enter the last number:"
  end

  log.push(gets.chomp.to_i)
  count += 1
end

num_6 = log.pop

if log.include?(num_6)
  puts "The number #{num_6} appears in #{log}"
else
  puts "The number #{num_6} does not appear in #{log}"
end

