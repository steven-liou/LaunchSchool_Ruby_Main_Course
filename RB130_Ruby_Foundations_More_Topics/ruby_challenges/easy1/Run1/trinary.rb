=begin

Input : a trinary number string

Output : integer representing the value of the trinary number

Rules


Data structure / Algorithms
  String first - use Regex to check valid trinary digits
  The approach here is the same as the octal problem

=end

class Trinary
  def initialize(tri_string)
    @tri_string = tri_string
  end

  def to_decimal
    return 0 if @tri_string =~ /[^0-2]/
    @tri_string.chars.reduce(0) { |acc, digit| acc * 3 + digit.to_i }
  end
end

