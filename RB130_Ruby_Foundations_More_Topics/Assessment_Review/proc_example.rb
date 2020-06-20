add_one = Proc.new { |number| number + 1 }

def map(array, cb)

  array.each_with_object([]) { |ele, object| object << cb.call(ele) }
end

p map([1, 2, 3, 4], add_one)