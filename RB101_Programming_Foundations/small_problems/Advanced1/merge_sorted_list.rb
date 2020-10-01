# input : two sorted arrays
# output : merged sorted array

# check which array size is smaller, iteratre through that array
# have 1 counter for array 1, and another counter for array 2
# compare each element of the array, if array 1's element is smaller, add it to the merged array, add its counter by 1, vice versa
require 'pry'
def merge(array1, array2)
  iterations1 = array1.size - 1
  iterations2 = array2.size - 1

  counter1 = 0
  counter2 = 0
  merged_array = []

  loop do
    break if counter1 > iterations1 || counter2 > iterations2
    if array1[counter1] <= array2[counter2]
      merged_array << array1[counter1]
      counter1 += 1
    else
      merged_array << array2[counter2]
      counter2 += 1
    end
  end
  if !array1[counter1]
    merged_array += array2[counter2..-1]
  else
    merged_array += array1[counter1..-1]
  end
  merged_array.flatten
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2])  == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]