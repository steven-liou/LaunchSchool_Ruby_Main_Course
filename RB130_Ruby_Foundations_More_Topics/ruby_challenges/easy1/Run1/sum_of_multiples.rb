=begin

Input : a number

Output : sum of all multiples of particular numbers, but not including that number)

Rules
  default multiples are based on 3, and 5

Data structure / Algorithms


=end

class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def self.to(limit)
    self.new(3, 5).to(limit)
  end

  def to(limit)
    (0...limit).select { |number| @factors.any? {|factor| number % factor == 0 }}.reduce(&:+)
  end
end

