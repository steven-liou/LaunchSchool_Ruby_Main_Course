=begin

Input : a hex string

Output : integer of decimal representatino of input hex string

Rules


Data structure / Algorithms
  have a lookup array table that have ['0' - '9'] and ['a' - 'f']

  Follow the same pattern as octal and trinary problem
=end

class Hex
  def initialize(hex_string)
    @hex_string = hex_string.downcase
  end

  def to_decimal
    return 0 if @hex_string =~ /[^a-f0-9]/
    table = ('0'..'9').to_a + ('a'..'f').to_a

    @hex_string.chars.reduce(0) { |acc, digit| acc * 16 + table.index(digit) }
  end
end

p Hex.new('f').to_decimal
p Hex.new('11').to_decimal
p Hex.new('100').to_decimal
