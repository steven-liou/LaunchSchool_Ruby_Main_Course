=begin

Input : two arrays

Output : one array with subarrays of the two arrays' respective elements with the same index

Rules


Data structure / Algorithms
  create a new array for storing the subarrays
  iterate from 0 to size of one of the array - 1
    assign the subarray at current index with the values of the two small arrays at current index
  return the new array
=end

def zip(array1, array2)
  zip_array = Array.new(array1.size)
  index = 0

  while index < array1.size
    zip_array[index] = array1[index] , array2[index]
    index += 1
  end

  zip_array
end

puts zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
