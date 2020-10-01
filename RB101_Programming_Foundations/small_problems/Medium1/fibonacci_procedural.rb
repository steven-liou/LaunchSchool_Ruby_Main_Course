# input : a number
# output : number of nth element in fibonacci sequence

# assignet 1st and 2st variable to start at 1, 1
# the nth variable would be 1st and 2nd variable sum. update the 1st and 2nd, and current variables


# def fibonacci(nth)
#   prev2 = 1
#   prev1 = 1
#   idx = 3

#   if nth <= 2 then return 1
#   else
#     for n in idx..nth
#       fibo_num = prev2 + prev1
#       prev2 = prev1
#       prev1 = fibo_num
#     end
#   end

#   fibo_num
# end

def fibonacci(nth)
  prev1, prev2 = [1, 1]

  3.upto(nth).each do
    prev2, prev1 = [prev1, prev1 + prev2]
   end

  prev1
end



p fibonacci(3)
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001)