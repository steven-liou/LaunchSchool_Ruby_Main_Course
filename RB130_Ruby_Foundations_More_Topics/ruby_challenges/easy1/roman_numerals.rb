class Integer
  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def to_roman
    number = self
    ROMAN_NUMERALS.each_with_object('') do |(roman_letter, numeral_value), numerals|
      next if number < numeral_value

      counts, number = number.divmod(numeral_value)
      numerals << roman_letter * counts
    end
  end
end