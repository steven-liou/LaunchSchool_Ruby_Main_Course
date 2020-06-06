# input: two arrays
# output : an array with each element the product of the two array's respective index value

# iterate through the array, find the product, store it in a new array

# def multiply_list(array1, array2)
#   element_numbers = array1.size
#   product_array = Array.new(element_numbers)

#   element_numbers.times do |idx|
#     product_array[idx] = array1[idx] * array2[idx]
#   end

#   product_array
# end

def multiply_list(array1, array2)
  array1.zip(array2).map {|arr| arr[0] * arr[1] }
end




p multiply_list([3, 5, 7], [9, 10, 11]) # == [27, 50, 77]
