# input : number
# output : (squares of the sum of first n) - (sum of the square of first n)

# find the squares of the sum first n
#   find the sum from 1 to n, then square it
# find the sum of squares of first n
#   square each integer from 1 to n, then sum them
# find the difference

def sum_square_difference(n)
  squares_of_sum = 0
  sum_of_squares = 0

  1.upto(n) do |nth|
    squares_of_sum += nth
    sum_of_squares += nth ** 2
  end
  squares_of_sum = squares_of_sum**2
  difference = squares_of_sum - sum_of_squares
end

p sum_square_difference(3) == 22
    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150