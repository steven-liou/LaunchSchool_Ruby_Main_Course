# input : a positive integer
# output : display a right triangle

# find the length of empty spaces to print, which is n - row number


# def triangle(rows)
#   row_number = 1

#   loop do
#     spaces = rows - row_number
#     puts "#{' ' * spaces}#{'*' * row_number}"
#     row_number += 1
#     break if row_number > rows
#   end
# end

# def triangle(rows)

#   for row_number in 1..rows
#     spaces = rows - row_number
#     puts "#{' ' * spaces}#{'*' * row_number}"
#   end
# end


def triangle(rows)
  rows.times do |row_number|
    spaces = rows - row_number
    puts "#{' ' * spaces}#{'*' * row_number}"
end
end
triangle(9)