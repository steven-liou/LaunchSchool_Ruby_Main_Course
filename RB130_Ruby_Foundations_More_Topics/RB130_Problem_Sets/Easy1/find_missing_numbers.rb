=begin
  create a new array for result
  Iterate through each element in the given array, if the difference between the current element and the last element is greater than 1
  store an array from the last element + 1 to current element - 1
=end


# def missing(array)
#   result = []
#   array.each_cons(2) do |first, second|
#     result.concat(((first + 1)..(second - 1)).to_a)
#   end
#   result
# end

def missing(array)
  all_numbers = (array.first..array.last).to_a
  all_numbers - array
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []