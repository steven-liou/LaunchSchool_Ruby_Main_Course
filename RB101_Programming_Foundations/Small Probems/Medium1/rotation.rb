# rotate the first element of input array to the last element, return a new array without modifying the original array

def rotate_array(array)
  array[1..-1] + [array[0]]
end


 x = [1, 2, 3, 4]
puts rotate_array(x)  == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]

def rotate_string(string)
  rotate_array(string.chars).join
end

y = 'hello'
puts rotate_string(y) == 'elloh'
p y