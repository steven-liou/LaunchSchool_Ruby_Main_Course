# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# you may assume that both input Araays are non-empty, and that they have the same number of elements.

#Example:

# interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']


# input : 2 arrays of equal length
# output : concatenation of the two arrays, with elements alternating

# create a new array that stores the elements of the two arrays
# loop from 0 to size of array - 1, in each iteration, add to the new array with each of the original two array's elements at the current index

def interleave(array1, array2)
  combined_array = []

  for index in 0..(array1.size - 1)
    combined_array << array1[index] << array2[index]
  end

  combined_array
end


p interleave([1, 2, 3], ['a', 'b', 'c'])