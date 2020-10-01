# input : an array of numbers
# output : a sorted array in increasing order

# iterate through the array, compare two numbers at a time, if the first is greater than the second number, swap the two numbers' positions
# repeat the full iteration process until no number has been swapped in that iteration

# in each iteration, have a counter for number of swaps, if the number of swap is greater than 0, continue the sweep for swapping, else, the process has completed

# within each iteration, iterate through the elements, compare current index value to the next index value. If current index value is greater, then swap.
# stop at index length - 2


def bubble_sort!(array)

  swap_indices = [array.size - 1]
  loop do
    swap_counts = 0
    index = 0
    last_swapped_index = swap_indices[-1]
    loop do
      break if index >= last_swapped_index
        if array[index] > array[index + 1]
          array[index], array[index + 1] = array[index + 1], array[index]
          swap_counts += 1
          swap_indices << index
        end
        index += 1
      end

    break if swap_counts == 0
  end
end

p array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

p array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]


p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)