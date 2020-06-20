add_one = lambda { |number| number + 1 }

def map(array, cb)
  array.each_with_object([]) { |ele, obj| obj << cb.call() }
end

p map([1, 2, 3, 4], add_one)
