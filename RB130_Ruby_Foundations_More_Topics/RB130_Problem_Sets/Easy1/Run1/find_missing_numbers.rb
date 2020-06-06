=begin

Input : a sorted array

Output : missing elements of the sorted array

Rules


Data structure / Algorithms
  Create an array to store the missing elements
  Iterate through the array from first to second to last element
    In each iteration, compare the current element to the value of the next element
      if the difference is 1, continue
      else count from 1 upto (difference - 1), add the current element's value by the count, store it in the missing element array

=end

def missing(array)
  missing_array = []
  index = 0

  while index < array.size - 1
    current_value = array[index]
    next_value = array[index + 1]
    difference = next_value - current_value

    if difference <= 1
      index += 1
      next
    end
    increment = 1

    while increment < difference
     missing_array << (current_value + increment)
     increment += 1
    end
    index += 1
  end
  missing_array
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []