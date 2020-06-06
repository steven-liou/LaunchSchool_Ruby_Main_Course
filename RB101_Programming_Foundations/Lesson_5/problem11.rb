#use select or reject, return a new array identical structure to original, but containing  integers that are multiplies of 3


arr = [[2], [3, 5, 7], [9], [11, 13, 15]]


arr.map do |sub_array|
  sub_array.select do |val|
    val % 3 == 0
  end
end.tap {|val| p val}

arr.map do |sub_array|
  sub_array.reject do |val|
    val % 3 != 0
  end
end.tap {|val| p val}