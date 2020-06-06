# input : arry of numbers
# output : a string that display the results in the specification

# multiplies all the numbers together, divide the product by the number of elements in the array. Print the result rounded to 3 decimal places.


def show_multiplicative_average(array)
  product = 1.0
  number_of_elements = array.size

  array.each do |number|
    product *= number
  end

  average = product / number_of_elements

  "The result is #{format('%.3f', average)}"
end



p show_multiplicative_average([3, 5])
p show_multiplicative_average([6])
p show_multiplicative_average([2, 5, 7, 11, 13, 17])
