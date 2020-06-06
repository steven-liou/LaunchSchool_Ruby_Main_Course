# input : an array of elements with specific data type
# output : a sorted array using the merge sort technique

# Rules :
#   in each iteration, break down the array into halves subarray, repeat until the subarrays is size 1
#   in the return stack, sort the subarrays in increasing order
#   iterate through each eleemnt on the left array, if that element is smaller than the right array, then push it into a combined array,
# else push the right element into the combined array, increment right element index by 1
# push any remaining right array element into the array

def merge_sort(array)
  return array if array.size == 1
  middle = array.size / 2 - 1
  left_array = array[0..middle]
  right_array = array[(middle + 1)..-1]


  left_sub_array = merge_sort(left_array)
  right_sub_array = merge_sort(right_array)

  sorted_array = []
  right_idx = 0

  left_sub_array.each do |left_element|
    while right_idx < right_sub_array.size && left_element > right_sub_array[right_idx]
      sorted_array << right_sub_array[right_idx]
      right_idx += 1
    end
    sorted_array << left_element
  end
  sorted_array += right_sub_array[right_idx..-1]

end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]