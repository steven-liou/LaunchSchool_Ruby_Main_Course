# Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

# For example:

# greatestProduct("123834539327238239583") // should return 3240
# The input string always has more than five digits.

=begin

Input : string of numbers

Output : largest product of 5 consecutive digits in the string

Rules :

Algorithm:
    a variable that holds the largest product
    iterate from index 0 to -5
      - for each iteration, get the number from current index to length of 5
        - for each num_str
        - set a current_product variable that starts at 1
        - split them into digits
          - multiply them by the current_product by the current digit
        - if the current_product is > than the largest_product, update the largest_product
=end

def greatest_product(n)
  largest_product = 0

  0.step(n.length-5).each do |index|
    num_str = n[index, 5]

    current_product = num_str.chars.reduce(1) { |acc, num| acc * num.to_i }
    if largest_product < current_product
      largest_product = current_product
    end
  end
  largest_product
end




p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0