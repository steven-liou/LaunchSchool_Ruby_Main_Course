=begin

Input : a number asking for the nth prime

Output : the nth prime

Rules
  prime is a number greater than 1 and is only divisible by 1 and itself

Data structure / Algorithms
  have an array for storing the primes
  start looping with an index at 2, break if the array for stroing prime has size equal to n
    check if the current index is a prime, if it is , add it to the array of primes
    increment index by 1

  To check if a number is prime,
    iterate from 2 to itself - 1, if any index can divide into the given number, then it is not a prime

=end


class Prime
  def self.nth(n)
    raise ArgumentError, 'nth Prime number has to be greater than 0' if n <= 0
    primes = [2]
    current_number = 3

    while primes.size < n
      primes << current_number if is_prime?(current_number, primes)
      current_number += 2
    end

    primes.last
  end

  def self.is_prime?(number, primes)
    return true if number == 2
    index = 0

    while primes[index] <= Math.sqrt(number)
      return false if number % primes[index] == 0
      index += 1
    end
    true
  end
end