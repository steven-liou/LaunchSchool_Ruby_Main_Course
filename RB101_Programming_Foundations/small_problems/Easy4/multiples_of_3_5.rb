#input: a number
# find multiples of 3 or 5 between 1 and the given number
# compute the sum of those numbers
#output: return the sum


# def multisum(number)
#   sum = 0
#   for i in 1..number
#     if i % 3 == 0 || i % 5 == 0
#       sum += i
#     end
#   end
#   sum
# end

def multisum(number)

  1.upto(number).inject(0) do |acc, num|
    if num % 3 == 0 || num % 5 == 0
      acc += num
    end
    acc
  end
end


puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168