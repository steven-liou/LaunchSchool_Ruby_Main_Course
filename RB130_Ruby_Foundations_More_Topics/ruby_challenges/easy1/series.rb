class Series
  attr_reader :digits
  def initialize(string)
    @digits = string.chars.map(&:to_i)
  end

  def slices(n)
    raise ArgumentError if n > @digits.size
    @digits[0..-n].each_index.with_object([]) do |index, series|
      series << @digits[index, n]
    end
  end
end
