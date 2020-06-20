=begin

Input : a max_factor number, and a min_factor number

Output : all palindrome products in between the range

Rules
  a palindrome number reads the same forward and backword


Data structure / Algorithms
  - check if a number is palindrome


  - get all combination of products from min_factor to max_factor
    - iterate starting with min_factor to max_factor
      - for each factor, iterate up to max_factor
        multiply to get the product, add it to palindromes if the product is a palindrome number
=end


class Palindromes
  attr_reader :min_factor, :max_factor, :palindromes
  def initialize(min_factor: 1, max_factor: 1)
    @min_factor = min_factor
    @max_factor = max_factor
  end

  def generate
    @palindromes = []

    min_factor.upto(max_factor) do |start_factor|
      start_factor.upto(max_factor) do |end_factor|
        @palindromes << [start_factor, end_factor] if palindrome?(start_factor * end_factor)
      end
    end
  end

  def largest
    PalindromeFactors.new(palindrome_value_groups.max)
  end

  def smallest
    PalindromeFactors.new(palindrome_value_groups.min)
  end

  def palindrome?(number)
    digits = number.digits
    middle = (digits.size - 1) / 2

    0.upto(middle) do |index|
      return false if digits[index] != digits[digits.size - index - 1]
    end
    true
  end

  def palindrome_value_groups
    palindromes.group_by do |factor_pair|
      factor_pair.first * factor_pair.last
    end
  end
end

class PalindromeFactors

  def initialize(factors)
    @factors = factors
  end

  def factors
    @factors.last
  end

  def value
    @factors.first
  end
end

