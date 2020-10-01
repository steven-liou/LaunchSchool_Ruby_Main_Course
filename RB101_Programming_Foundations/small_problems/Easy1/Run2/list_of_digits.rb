# def digit_list(integer)
#   digits = []
#   while integer > 0
#     integer, digit = integer.divmod(10)
#     digits.unshift(digit)
#   end
#   digits
# end

def digit_list(integer)
  integer.to_s.chars.map(&:to_i)
end

p digit_list(12345) #== [1, 2, 3, 4, 5]     # => true
p digit_list(7) #== [7]                     # => true
p digit_list(375290) #== [3, 7, 5, 2, 9, 0] # => true
p digit_list(444) == [4, 4, 4]             # => true
