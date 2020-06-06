# input : two arrays
# output : an array whose elements are all possible product permutations of the two input arrays, in sorted ascending order

# first iteratore through the first array, for each element, multiply it by each element in the second array, and store it in a product array

# sort the product array


def multiply_all_pairs(array1, array2)
  product_array = []

  array1.each do |num_array1|
    array2.each do |num_array2|
      product_array << num_array1 * num_array2
    end
  end

  product_array.sort

end


p multiply_all_pairs([2, 4], [4, 3, 1, 2])  == [2, 4, 4, 6, 8, 8, 12, 16]
