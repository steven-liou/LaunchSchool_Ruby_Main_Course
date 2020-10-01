=begin
- create a hash of number-marked pairs, from 2 to n, starting with :unmarked

- iterate from
take the next available unmarked number in your list (it is prime)
mark all the multiples of that number (they are not prime)

=end

class Sieve
  def initialize(n)
    @n = n
    @number_hash = 2.upto(n).with_object({}) { |number, hash| hash[number] = :unmarked }
  end

  def primes
    (2..@n).to_a.combination(2).each do |factor, number|
      @number_hash[number] = :marked if number % factor == 0
    end
    @number_hash.select { |_, value| value == :unmarked }.keys
  end
end
