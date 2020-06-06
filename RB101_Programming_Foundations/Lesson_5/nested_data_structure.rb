arr1 =[ "a", "b", "c" ]

arr2 = arr1.dup

arr2.map! do |char|
  char.upcase
end

puts arr1
puts arr2