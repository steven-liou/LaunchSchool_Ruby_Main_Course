# true for all is the opposite of any?, it returns false the first instance the block returns false. Otherwise, it returns true at the end


def all?(collection)
  raise ArgumentError, "Must supply a block" unless block_given?

  collection.each { |item| return false unless yield(item) }
  true
end



p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true