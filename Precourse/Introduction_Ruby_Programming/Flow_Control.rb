#Problem 1
# 1. Since the expression in the parenthesis is first evaluated to 128, and it is compared to be not greater or equal to 129, it returns false
# 2. The !true is "not true", or false. It becomes false != false, which returns false
# 3. It is comparing literals of different data types, so it returns false
# 4. Same reason as number 3 for expression inside the parenthesis, so it becomes false == false. Returns true
# 5.
# (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false
# (false || (false == 20))     ||        (true)      || false
# (false ||    false  )        || true               || false (can be ignored since there is already a true in the logic)
# returns true


#Problem 2
# def capitalize(string)
#   if string.length > 10
#     string.upcase
#   else
#     string
#   end
# end

# puts capitalize("Steven")
# puts capitalize("Hello how are you doing this morning?")

#Problem 3
# puts "Enter a number: "
# num = gets.chomp.to_i

# if num < 0
#   puts "The number is less than 0"
# elsif num <= 50
#   puts "The number is between 0 and 50"
# elsif num <= 100
#   puts "The number is between 51 and 100"
# else
#   puts "The number is greater than 100"
# end


#Problem 4
#1. The ternary operator first checks the condition before the ? operator. In this case since comparing a string to a number will results false, it will run the false scenario, which is to the of the : operator. It will print FALSE
#2. The left parenthesis resolves to 6/2, which is 3, and the right parenthesis evaluates to 3 as well, it will print "Did you get it right?"
#3. The first elsif evaluates to true, since 11 > 9. Prints "Alright now!"

#Problem 5
#The error is due to a missing end keyword for the if block

