# convert number to string, get string from idx 0 to -n, then the digit at -n, and -n to -1
# concatenate in the order 0 to -n, -n to -1, and -n

def rotate_rightmost_digits(number, n)
  number_array = number.to_s.chars

  number_array[-n..-1] = rotate_array(number_array[-n..-1])
  number_array.join.to_i
end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917
