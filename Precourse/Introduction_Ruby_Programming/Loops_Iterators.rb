#Problem 1
#The each method would iterate through the array object that invokes it. each loop, variable 'a' will take on the next index in x array. However, it always return the array that calls it. [1, 2, 3, 4, 5]

#Problem 2
# x = ' '
# while x != "STOP"
#   puts "Please type something"
#   x = gets.chomp
#   puts "You typed in #{x}"
# end


#Problem 3
# def count_down(num)
#   if num < 0
#     return
#   else
#     print num.to_s + ' '
#     count_down(num - 1)
#   end
# end

# count_down(-15)