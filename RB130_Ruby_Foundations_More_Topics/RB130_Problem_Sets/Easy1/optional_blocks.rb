def compute(value)
  return "Does not compute." unless block_given?
  yield(value)
end

puts compute(5) {|val| val + 3 } == 8
puts compute('ab') {|letters| letters + 'c' } == 'abc'
puts compute([1, 2, 3]) {|numbers| numbers << 4} == [1, 2, 3, 4]
puts compute(5) == "Does not compute."