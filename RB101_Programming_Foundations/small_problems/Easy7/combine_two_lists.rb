
# def interleave(array1, array2)
#   combined_array = Array.new(array1.size)

#   array1.size.times do |idx|
#     combined_array[2 * idx] = array1[idx]
#     combined_array[2 * idx + 1] = array2[idx]
#   end
#   combined_array
# end


def interleave(array1, array2)
  array1.zip(array2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
