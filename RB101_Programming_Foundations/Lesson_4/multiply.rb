def double_numbers(numbers, multiplier)
  counter = 0

  loop do
    break if counter == numbers.size


    numbers[counter] *= multiplier if counter.odd?

    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers(my_numbers, 4)
puts my_numbers