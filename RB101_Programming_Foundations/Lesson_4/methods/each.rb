def custom_reduce(array, accumulator)

  count = 0
  loop do
    break if count == array.size
    accumulator = yield(accumulator, array[count])

    count += 1
  end
  accumulator
end

arr = [1,2,3, 4, 5]

arr2 = custom_reduce(arr, 0) do |acc, num|
          acc += num
       end

puts arr2