# Inputs: an array
# outputs: every other element of an array

def oddities(array)
  counter = 0
  odd_array = []

  loop do
    break if counter >= array.size
    odd_array << array[counter]

    counter += 2
  end

  odd_array
end


def evens(array)
  counter = 1
  even_array = []

  while counter < array.size
    even_array << array[counter]

    counter += 2
  end
  even_array
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

puts evens([2, 3, 4, 5, 6]) == [3, 5]
puts evens([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts evens(['abc', 'def']) == ['def']
puts evens([123]) == []
puts evens([]) == []

