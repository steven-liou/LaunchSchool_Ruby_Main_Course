def zip(array1, array2)
  array1.each_with_index.with_object([]) do |ele, index, zip_array|
    zip_array << [ele, array2[index]]
  end
end


puts zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
