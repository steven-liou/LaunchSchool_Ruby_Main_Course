=begin

Input : a number

Output : a pattern up to the given number

Rules


Data structure / Algorithms
  First find the maximum width,
    - get all numbers up to the given number into an array
    - join the array, and get the width

  print each line
    - need to know line number, and the width
      get all numbers from 1 up to the line (number + 1)
      convert the array of numbers into a string by joining
    - get the width of the string,
    - pad the string with '*' until the end of the line

=end

# def number_pattern(number)
#   width = (1..number).to_a.join.length
#   number.times do |line_number|
#     current_line = (1..line_number + 1).to_a.join
#     pad_width = width - current_line.length
#     current_line += '*' * pad_width
#     puts current_line
#   end
# end

def number_pattern(number)
  width = (1..number).to_a.join.length
  asterisks = "*" * width
  whole_string = ''

  1.upto(number) do |n|
    num_string = n.to_s
    whole_string << num_string
    asterisks.slice!(0, num_string.length)
    puts whole_string + asterisks
  end
end




number_pattern(20)