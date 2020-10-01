# first, generate the mulitiples of 3 or 5 smaller than the given number, store them into an array
# find the sum of the array

class SumOfMultiples
  def initialize(*factors)
    @factors =  factors.empty? ? [3, 5] : factors
  end

  def self.to(number)
    new.to(number)
  end

  def to(number)
    @factors.min.upto(number - 1).reduce(0) do |sum, multiple|
      multiples_of_factors?(multiple) ? sum + multiple : sum
    end
  end

  def multiples_of_factors?(multiple)
    @factors.any? { |factor| multiple % factor == 0 }
  end
end