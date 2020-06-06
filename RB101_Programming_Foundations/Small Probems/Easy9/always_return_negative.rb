# given a number
# if the number is positive, reutnr its negative value, else return the original number

def negative(number)
  number > 0 ? -number : number
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0