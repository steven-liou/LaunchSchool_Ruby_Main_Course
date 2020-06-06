# muatate input array, reverse its elements
# in each iteration, change the first element's idx is current iteration idx, the last item index is the length of the array minus (idx + 1)

require 'pry'
# def reverse!(list)
#   list_length = list.length
#   list.each_with_index do |elem, idx|
#     last_idx = list_length - (idx + 1)
#     list[idx], list[last_idx] = list[last_idx], list[idx]
#     break if idx >= list_length / 2 - 1
#   end
#   list
# end

def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end
  array
end


p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

p list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

p list = []
p reverse!(list) == []
p list == []