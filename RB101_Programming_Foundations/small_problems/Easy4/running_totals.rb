# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

#input: array
# for each element, add the previous indicies' values to it

def running_total(array)
  total = 0

  array.each_with_object([]) do |val, obj|
    total += val
    obj << total
  end
  
end


puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []