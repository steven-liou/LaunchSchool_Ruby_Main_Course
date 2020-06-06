# true_for_one is similar to any, but with an additional condition check that there has been an instance of block iteration that returned true,

# Alogirithm
#  create a variable that stores a bool, false
#  iterate through each element of the array
#   check if the bool is true,
#   if the block returns true, set the bool to true if the bool is false
#      else if the bool is already true, returns false
#   returns the bool value

def one?(collection)
  once = false

  collection.each do |item|
    next unless yield(item)
    return false if once
    once = true
  end
  once
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false
