class FixedArray

  def initialize(n)
    @fix_array = Array.new(n)
  end


  def [](index)
    if in_bound?(index)
      @fix_array[index]
    else
      raise IndexError, "Trying to access index out of bound"
    end
  end

  def []=(index, value)
    if in_bound?(index)
      @fix_array[index] = value
    else
      raise IndexError, "Trying to set index out of bound"
    end
  end

  def to_a
    @fix_array.clone
  end

  def to_s
    @fix_array.to_s
  end

  def in_bound?(index)
    if !index.is_a?(Integer)
      false
    elsif index >= 0
      index < @fix_array.size
    elsif index < 0
      index > -@fix_array.size
    end
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
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end