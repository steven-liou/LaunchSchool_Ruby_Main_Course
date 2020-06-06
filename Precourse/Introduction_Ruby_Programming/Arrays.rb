#Problem 1
# arr = [1, 3, 5, 7, 9, 13]
# number = 3

# arr.each do |num|
#   if num == number
#     puts "#{number} is in the array."
#   end
# end

# arr.include?(number) ? (puts "#{number} is in the array") : false


#Problem 2
# 1. ["b", "a"].product([1, 2, 3]) will evaluate to [["b", 1], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]
#   arr.first.last now will pick ["b", 1], chained by 1
#   which means it is, arr.first.delete(1), which will remove the 1 from the first element of outer array,
#   so it returns 1, and the original arr is mutated to
#   [["b"], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]

# 2. [Array(1..3)] will be [[1, 2, 3]]
#   ["b", "a"].product([[1, 2, 3]]) will be [["b", [1, 2, 3]], ["a", [1, 2, 3]]]
#   arr.first.last will now be [1,2,3]
#   arr.first.delete([1, 2, 3]) means it will return [1, 2, 3] and the mutated arr is
#   [["b"] . ["a", [1, 2, 3,]]]


#Problem 3

# arr = [["test", "hello", "world"],["example", "mem"]]
# example = arr.last.first
# puts example


#Problem 4
# arr = [15, 7, 18, 5, 12, 8, 5, 1]
#   1. it finds the index of the first element with value of 5, which is index 3
#   2. error
#   3. It accesses the value at index 5, which is 8

#Problem 5
# string = "Welcome to America!"
# a = string[6]
# b = string[11]
# c = string[19]

# puts a  #"e"
# puts b  #"A"
# puts c  #nil, when accessing an index that is not in range of an array, it will return nil, and doesn't throw error

#Problem 6
# You cannot access an index of an array by a string literal, to get the index of the element in names that have the value 'margaret', we need to use the .index method for array

# names = ['bob', 'joe', 'susan', 'margaret']
# names[names.index('margaret')] = 'jody'
# puts names


#Problem 7
# names = ['bob', 'joe', 'susan', 'margaret']
# names.each_with_index {|val, index| puts "#{index}. #{val}"}


#Problem 8
arr = [1, 2, 3, 4, 5]
# arr_new = arr.map {|x| x + 2}

arr_new = []
arr.each do |i|
  arr_new.push(i+2)
end


p arr
p arr_new
