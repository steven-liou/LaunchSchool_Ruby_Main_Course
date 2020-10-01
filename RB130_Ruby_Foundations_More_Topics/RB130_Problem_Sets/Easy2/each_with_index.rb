def each_with_index(array)
  index = 0

  loop do
    yield(array[index], index)
    break if index == array.size - 1
    index += 1
  end
  array
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]