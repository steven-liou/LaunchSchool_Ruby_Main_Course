def bubble_sort!(array)
  loop do

    array.each_with_index { |value, index| array[index] = yield(value) }
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] < array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end
    break unless swapped
  end
  nil
end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array #== %w(alice bonnie Kim Pete rachel sue Tyler)