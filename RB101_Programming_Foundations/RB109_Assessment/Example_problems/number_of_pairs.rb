=begin
Find all pairs

You are given array of integers, your task will be to count all pairs in that array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)

Examples
[1, 2, 5, 6, 5, 2]  -->  2
...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
...because there are 4 pairs: 2, 20, 6 and 2 (again)
=end

=begin

Input : array

Output : number of pairs in the array

Rules
  returns 0 if no pair


Data structure / Algorithms
  first get an array of unique values
  create a variable for the number of pairs
  iterate through the unique array
    for each number, get the count of this value in the original array
      add the dividend of the count / 2, to the number of pairs


=end


def pairs(array)
  number_of_pairs = 0

  array.uniq.each do |number|

    counts = array.count(number)
    number_of_pairs += counts / 2
  end
  number_of_pairs
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0
