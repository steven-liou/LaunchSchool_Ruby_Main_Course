# input : an array and a search value
# output : boolean that indicates whether the value is in the given array

def include?(array, value)
  array.each do |element|
    return true if element == value
  end
  false
end


p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false