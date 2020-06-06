# Forgot to clone the fixed_arr in the instance method to_a, as the good practice is to return a new array
# could just call the to_a to get the fix_arr and then call to_s on it instead of calling the getter method


class FixedArray
  attr_reader :fixed_arr
  def initialize(size)
    @fixed_arr = Array.new(size)
  end

  def []=(index, value)
    if within_bound?(index)
      fixed_arr[index] = value
    else
      raise IndexError, "Assigning index out of bound"
    end
  end

  def [](index)
    if within_bound?(index)
      fixed_arr[index]
    else
      raise IndexError, "Accessessing index out of bound"
    end
  end
  def within_bound?(index)
    if index < 0
      index >= -fixed_arr.size
    else
      index < fixed_arr.size
    end
  end

  def to_a
    fixed_arr.clone
  end

  def to_s
    to_a.to_s
  end
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'


begin
  fixed_array[6]
  puts false
rescue IndexError => e
  puts e
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError => e
  puts e
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError => e
  puts e
end