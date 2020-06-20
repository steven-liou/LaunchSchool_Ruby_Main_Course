=begin

Input : a number

Output : an array of prime numbers from 2 up to the given number

Rules
  Find the prime number using Sieve alogorithm


Data structure / Algorithms
  create an array of consecutive integers from 2 to n
  assign a variable p to 2, the smallest prime number
  iterate from p to n, with step size p
    mark the numbers that are multiples of p
  find the first number greater than p in the digits array that is not marked
    if there is no such number, stop
    else, assign p to that number
    return the numbers remaining in the array that are not marked
=end

class Sieve
  def initialize(n)
    @n = n
  end

  def primes
    p = 2
    hash = (2..@n).each_with_object({}) { |num, obj| obj[num] = :unmarked }

    loop do
      p.step(@n, p) do |number|
        next if number == p
        hash[number] = :marked if number % p == 0
      end
      p += 1
      break if p >= @n
    end
    hash.select {|_, mark| mark == :unmarked }.keys
  end

end



