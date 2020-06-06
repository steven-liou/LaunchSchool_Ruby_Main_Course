# input : two arrays of elements
# output : combine the two arrays, without repetition

# approach, add the two arrays together, then remove the repeats with uniq

# def merge(arr1, arr2)
#   combined = arr1 + arr2
#   combined.uniq
# end

def merge(array1, array2)
  array1 | array2
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
