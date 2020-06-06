def find_greatest(numbers)
  saved_number = nil

  numbers.each do |num|
    saved_number ||= num #the ||= operator assign to first value
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end

  saved_number
end

numbers = [1, 2, 37, 2, 5]

puts find_greatest(numbers)


#1. A method that returns the sum of two integers

# START
# Accept two parameters into the function
# Add the two parameters and set the result to a variable
# return the variable


#2  A method that takes an array of strings, and returns a string that is all those string concatenated together

# START
# Set a parameter that takes an array of strings
# Set a new string that is empty, for storing each element of the array
# For each element in the array, concatenate the new string with the current element in the array
# Return the new string


#3 A method that takes an array of integers and returns a new array with every other element
# START
# Set a parameter that takes an array of integers
# Set an empty array, for storing the alternating elements in the original array
# Set iterator = 0
# While iterator < length of array
#   Push the array element at iterator index to the empty array
#   iterator += 2

# Returns the new array