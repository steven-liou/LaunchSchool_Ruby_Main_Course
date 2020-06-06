=begin

Input : an array, and a collection object

Output : the passed in object

Rules


Data structure / Algorithms
  iterate through each element of the input array
    yield to the block, passing the current element, and the collection object as arguments to the block
  return the collection object

=end

def each_with_object(array, collection)
  array.each { |ele| yield(ele, collection) }
  collection
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}