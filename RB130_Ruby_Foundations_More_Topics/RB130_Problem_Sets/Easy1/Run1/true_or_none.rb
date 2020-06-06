# Enumerable#none? is similar to any? in that it behaves the opposite way. If none of the block iteration's return value is true, then it returns true, else it returns false the first return value of the block is true

def none?(collection)
  collection.each { |item| return false if yield(item)}
  true
end


p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true