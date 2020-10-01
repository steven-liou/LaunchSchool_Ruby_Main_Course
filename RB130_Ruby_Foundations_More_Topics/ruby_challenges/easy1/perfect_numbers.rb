module PerfectNumber
  NUMBER_TYPES = {
    -1 => "deficient",
     0 => "perfect",
     1 => "abundant",
  }

  def self.classify(number)
    raise RuntimeError if number <= 0
    NUMBER_TYPES[factors_of(number).sum <=> number]
  end

  def self.factors_of(number)
    factors = 2.upto(Math.sqrt(number)).with_object([]) do |divisor, factors|
      dividend, remainder = number.divmod(divisor)
      factors << divisor << dividend if remainder == 0
    end
    factors << 1 unless number == 1
    factors
  end
end