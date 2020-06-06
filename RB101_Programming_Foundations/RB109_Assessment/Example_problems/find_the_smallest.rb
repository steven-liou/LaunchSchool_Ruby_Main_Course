# You have a positive number n consisting of digits. You can do at most one operation: Choosing the index of a digit in the number, remove this digit at that index and insert it back to another or at the same place in the number in order to find the smallest number you can get.

#   #Task: Return an array or a tuple or a string depending on the language (see "Sample Tests") with
  
#   1) the smallest number you got
#   2) the index i of the digit d you took, i as small as possible
#   3) the index j (as small as possible) where you insert this digit d to have the smallest number.







smallest(261235) == [126235, 2, 0] 
smallest(209917) --> [29917, 0, 1] or ...

[29917, 1, 0] could be a solution too but index `i` in [29917, 1, 0] is greater than 
index `i` in [29917, 0, 1].


p smallest(261235, [126235, 2, 0])
p smallest(209917, [29917, 0, 1])
p smallest(285365, [238565, 3, 1])
p smallest(269045, [26945, 3, 0])
p smallest(296837, [239687, 4, 1])

