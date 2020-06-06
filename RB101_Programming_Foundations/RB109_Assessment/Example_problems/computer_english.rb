# Write a method that will generate random english math problems. The method should take a number, then return a math phrase with that many operations


# < a number
# > a string of math expression with N number of operatinos

# randomly pick out N numbers of operators from the operations list
# randomly pick out N + 1 numbers of operators from the operations list
# create an array that contains the first number
# iterate N times, for each iteration, add 1 operation, and 1 number to the array
# join the array with the space

NUMBERS = %w(one two three four five six seven eight nine ten)
OPERATORS = %w(plus minus times divided)


def mathphrase(n)
  expression = [NUMBERS.sample]

  for i in 0...n
    operation = OPERATORS.sample
    operation += " by" if operation == "divided"
    expression << operation << NUMBERS.sample
  end

  expression.join(' ')

end




# puts mathphrase(1) #=> "five minus two"
# puts mathphrase(2) #=> "two plus three times eight"
# puts mathphrase(3) #=> "one divided by three plus five times zero"

# write a program that will generate random english math problems of varying length between 1 and 10

p  mathphrase(rand(1..10))


