# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

def multiply(num1, num2)
  num1 * num2
end


def square(num, n)
  base = num
  (n-1).times {base = multiply(base, num)}
  base
end

puts square(5, 3)
puts square(-8, 3)