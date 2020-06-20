=begin

Input :  a number

Output : Roman numeral representation of number

Rules
  Ones I
  Five V
  Ten  X
  Fifty L
  Centum C
  500    D
  1000   M




  D
  DC
  DCC
  DCCC
  CM

  M
  MM
  MMM

Data structure / Algorithms
  create a hash table for integer to roman numerals

=end


class Integer
  THOUSANDS = [nil, 'M', 'MM', 'MMM']
  HUNDREDS = [nil, 'C', 'CC,', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM']
  TENS = [nil, 'X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC']
  ONES = [nil, 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX']
  CONVERSIONS = [ONES, TENS, HUNDREDS, THOUSANDS]

  def to_roman
    digits = self.digits
    romans = []

    digits.each_with_index do |digit, index|
      romans.unshift(CONVERSIONS[index][digit])
    end
    romans.join('')
  end
end

