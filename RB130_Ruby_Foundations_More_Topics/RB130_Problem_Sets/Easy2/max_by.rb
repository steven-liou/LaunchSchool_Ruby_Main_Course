def max_by(array)
  return nil if array.empty?


  max_value = array.first
  max_block_return = yield(max_value)

  array[1..-1].each do |value|
    new_max = yield(value)
    next if new_max <= max_block_return
    max_block_return = new_max
    max_value = value
  end
  max_value
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil