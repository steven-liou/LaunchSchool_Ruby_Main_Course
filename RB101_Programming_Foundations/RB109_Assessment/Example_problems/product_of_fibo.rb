#  the fibo sequence is
#  0, 1, 1, 2, 3, 5, 8, 13 ...

=begin

Input : A number

Output : an array of two consecutive fibo numbers that result in their product equal to given number

Rules :

Algorithm:
    find the fibo numbers
      -have a variable that holds the prev2, and prev1 elements in the sequence
      - for each iteration, the next sequence is their sum
      - update prev2 to prev1 and prev1 to sum
    check if their products equal to the given number
      - if so, return [prev2, prev1]
=end


def productFib(number)
  prev2 = 1
  prev1 = 1

  while true
    if prev2 * prev1 == number
      return [prev2, prev1, true]
    elsif prev2 * prev1 > number
      return [prev2, prev1, false]
    end


    prev2, prev1 = prev1, prev2 + prev1
  end

end



p productFib(4895) == [55, 89, true]
p productFib(5895) == [89, 144, false]
