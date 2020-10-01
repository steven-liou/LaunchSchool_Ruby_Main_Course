class Triplet
  attr_reader :side1, :side2, :side3
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def sum
    side1 + side2 + side3
  end

  def product
    side1 * side2 * side3
  end

  def pythagorean?
    return false unless valid_triangle?
    side_a, side_b, side_c = [side1, side2, side3].sort
    side_a**2 + side_b**2 == side_c**2
  end

  def valid_triangle?
    sides = [side1, side2, side3]
    max_side = sides.max
    sides.sum - max_side > max_side
  end

  def self.where(min_factor: 1, max_factor: 10, sum:nil)
    squares = generate_square_series_hash(min_factor, max_factor)
    triplets = []

    max_factor.downto(min_factor) do |factor1|
      (factor1 - 1).downto(min_factor) do |factor2|
        third_square = factor1**2 - factor2**2
        factor3 = squares.fetch(third_square, nil)
        next unless factor3 && factor2 > factor3
        triplet = Triplet.new(factor1, factor2, factor3)
        next unless triplet.pythagorean?
        if sum
          triplets << triplet if triplet.sum == sum
        else
          triplets << triplet
        end
      end
    end

    triplets
  end

  def self.generate_square_series_hash(min_number, max_number)
    min_number.upto(max_number).with_object({}) do |number, series|
      series[number**2] = number
    end
  end
end

p Triplet.generate_square_series_hash(1, 10)