=begin

Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is dicisible by 3 and 5, print "FizzBuzz"

=end

# < 2 numbers, 1 represents the starting number, 2nd represnts the ending number
# > print out all the numbers between the two, except
#   divisible by 3 : prints "Fizz"
#   divisible by 5 : prints "Buzz"
#   divisible by 3 & 5 : prints "FizzBuzz"

# create an empty array to store the resulting strings
# iterate through the numbers from the first to the second, inclusive
# for each iteration, check if the index is divisible by 3 & 5, add "FizzBuzz" to array
#                     then check if it is divisible by 3, add "Fizz" to array
#                     then if it is divisble by 5, add "Buzz" to array
#                     else, add the number converted to string, to tarray
# join the array with ', '


def fizzbuzz(num1, num2)
  string_array = Array.new(num2 - num1 + 1)

  for index in (num1..num2)
    if index % 3 == 0 && index % 5 == 0
      string_array[index - 1] = "FizzBuzz"
    elsif index % 3 == 0
      string_array[index - 1] = "Fizz"
    elsif index % 5 == 0
      string_array[index - 1] = "Buzz"
    else
      string_array[index - 1] = index.to_s
    end
  end
  string_array.join(', ')
end


p fizzbuzz(1, 15) #== 1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz"