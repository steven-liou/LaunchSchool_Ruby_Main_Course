# def none?(collection)
#   collection.each { |ele| return false if yield(ele) }
#   true
# end

def any?(array)
  array.each do |ele|
    return true if yield(ele)
  end
  false
end

def none?(array, &block)
  !any?(array, &block)
end

puts none?([1, 3, 5, 6]) { |value| value.even? } == false
puts none?([1, 3, 5, 7]) { |value| value.even? } == true
puts none?([2, 4, 6, 8]) { |value| value.odd? } == true
puts none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
puts none?([1, 3, 5, 7]) { |value| true } == false
puts none?([1, 3, 5, 7]) { |value| false } == true
puts none?([]) { |value| true } == true