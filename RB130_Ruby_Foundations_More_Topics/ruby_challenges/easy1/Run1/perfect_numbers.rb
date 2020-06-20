=begin

Input : a number

Output : qualification of input number

Rules


Data structure / Algorithms
  - Find the divisors of a number, not including the number itself
    - iterate from 1 to n / 2
      check if the current number can divide into the given number
      if it can, add it to the divisors
  - Get the sum of the divisors, and compares the sum to the number
      if sum is greater than number , return abundant
                equal                 return perfect
                smaller               return deficient

=end

class PerfectNumber
  def self.classify(number)
    raise RuntimeError, 'Please give integer greater than 1' if number <= 1 || !number.instance_of?(Integer)

    divisors = divisors_for(number)
    sum = divisors.sum
    case sum <=> number
    when -1 then 'deficient'
    when 0  then 'perfect'
    else         'abundant'
    end
  end

  def self.divisors_for(number)
    1.upto(number / 2).select do |divisor|
      divisor if number % divisor == 0
    end

  end
end