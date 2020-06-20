=begin

Input : a string representatino of octal number

Output : decimal number representation of original value

Rules


Data structure / Algorithms
  Convert the string to array of integers
  Have an accumulator starting at 0
  Iterating through the digits
    multiply the current accumulator by 8, then add the current value
  Return the accumulator
=end

class Octal
  def initialize(octal_string)
    @octal_string = octal_string
  end

  def to_decimal
    return 0 if @octal_string =~ /[^0-7]/
    digits = @octal_string.chars.map(&:to_i)
    digits.reduce(0) { |acc, value| 8 * acc + value }
  end
end

