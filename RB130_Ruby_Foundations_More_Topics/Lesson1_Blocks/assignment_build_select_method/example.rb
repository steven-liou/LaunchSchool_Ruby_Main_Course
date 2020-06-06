def select(array)
  counter = 0
  select_array = []

  while counter < array.size
    select_array << array[counter] if yield(array[counter])
    counter += 1
  end

  select_array
end

array = [1, 2, 3, 4, 5]

select(array) { |num| num.odd? }.tap {|v| p v }      # => [1, 3, 5]
select(array) { |num| puts num }.tap {|v| p v }      # => [], because "puts num" returns nil and evaluates to false
select(array) { |num| num + 1 }.tap {|v| p v }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true