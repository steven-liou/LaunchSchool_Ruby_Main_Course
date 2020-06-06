# build an Array#each like method

def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end
  array
end

each([1, 2, 3, 4, 5]) {|num| puts num }
each([1, 2, 3, 4, 5]) { }.select { |num| puts num if num.odd?}