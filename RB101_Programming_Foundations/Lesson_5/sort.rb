def sort_ascend(array)
  counter = 0
  sorted_array = []

  loop do
    break if counter == array.size - 1
    current_min_idx = counter

    counter_next = counter + 1
    loop do
      break if counter_next == array.size
      current_min_idx = counter_next if array[current_min_idx] > array[counter_next]
      counter_next += 1
    end
    array[counter], array[current_min_idx] = [array[current_min_idx], array[counter]]

    counter += 1
  end
  array
end

p sort_ascend([2,5,3,4,1,7,8])

, ['b', 2], , ].sort

['a', 'car', 'd'] ['a', 'car', 'd', 3] [['a', 'cat', 'b', 'c']