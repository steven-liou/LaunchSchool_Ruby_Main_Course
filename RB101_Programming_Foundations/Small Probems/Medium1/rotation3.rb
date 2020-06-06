# iterate each index of the number string array, rotate the current index to the right

require 'pry'

# def max_rotation(number)
#   digits = number.to_s.chars

#   digits.each_with_index do |_ , idx|
#     digits[idx..-1] = rotate_right(digits[idx..-1])
#     break if idx == digits.length - 2
#   end
#   digits.join.to_i
# end



# def rotate_right(digits)
#   digits[1..-1] + [digits[0]]
# end

def max_rotation(number)
  digits = number.to_s.chars

  digits.size.times do |idx|
    digit = digits.delete_at(idx)
    digits << digit
    break if idx >= digits.size - 2
  end

  digits.join.to_i

end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
puts max_rotation(735000)