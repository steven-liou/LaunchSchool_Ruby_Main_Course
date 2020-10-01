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
    triplets = []

    max_factor.downto(min_factor) do |side_c|
      break if side_c * 3 < sum if sum
      side_c.downto(min_factor) do |side_b|
        side_b.downto(min_factor) do |side_a|
          add_to_triplets!(triplets, side_a, side_b, side_c, sum)
        end
      end
    end
    triplets
  end

  def self.add_to_triplets!(triplets, side_a, side_b, side_c, sum)
    triplet = new(side_a, side_b, side_c)
    return unless triplet.pythagorean?
    if sum
      triplets << triplet if triplet.sum == sum
    else
      triplets << triplet
    end
  end
end


