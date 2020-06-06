# build a Enumerable#reduce like method

def reduce(array, acc=nil)
  counter = 0
  if !acc
    acc = array.first
    counter = 1
  end

  while counter < array.size
    current_element = array[counter]
    acc = yield(acc, current_element)
    counter += 1
  end

  acc
end


array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }.tap {|v| p v}                    # => 15
reduce(array, 10) { |acc, num| acc + num }.tap {|v| p v}                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }.tap {|v| p v}        # => NoMethodError: undefined method `+' for nil:NilClass

reduce(['a', 'b', 'c']) { |acc, value| acc += value }.tap {|v| p v}     # => 'abc'
reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value }.tap {|v| p v} # => [1, 2, 'a', 'b']