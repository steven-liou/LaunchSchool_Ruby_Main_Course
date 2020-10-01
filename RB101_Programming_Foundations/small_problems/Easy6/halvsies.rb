# input : an array
# output : a nested array of 2x1, the first subarray is first half of original array, and second subarray the second half of it

# creates two empty arrays, one for each half
# find the index of the original array that refers to the midpoint
# slice the original array into the respective subarrays

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array[0, middle]
  second_half = array[middle, array.size - middle]
  [first_half, second_half]
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) # == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]