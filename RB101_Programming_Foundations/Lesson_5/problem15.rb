# Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

#output: array with hashes with only even integers
# iterate each array element
# for each hash element, only put it in new array if all its elements are even
# return the array

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hsh|
  hsh.all? do | _ , arr|
    arr.all? do |number|
      number.even?
    end
  end
end.tap {|val| p val}


