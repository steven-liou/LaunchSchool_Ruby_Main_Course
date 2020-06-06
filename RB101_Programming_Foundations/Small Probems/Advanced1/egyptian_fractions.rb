# input : a rational number
# output : an array of the denominator of the Egyptian fractions

# Rules:
#  the neumerator of the sequence must be 1
#  The denominator of the sequence must not repeat
#  The start of the denominator should be 1 if the Rational number is greater than 1, else it starts at the current denominator value of the input number

# increment the denominator by 1 if the numerator of the previous result is not equal to 1, and else set the denominator to that result's denominator

require 'pry'

def egyptian(rational_number)
  denominator = rational_number.denominator
  numerator = rational_number.numerator
  egyptian_fractions = []

  sequence_denominator = 1


  while rational_number > 0
    unit_fraction = Rational(1, sequence_denominator)

    if unit_fraction <= rational_number
      rational_number -= unit_fraction
      egyptian_fractions << sequence_denominator
    end
    sequence_denominator += 1

  end
  egyptian_fractions
end

def unegyptian(array)

  array.reduce(Rational(0)) do |acc, denominator|
    acc + Rational(1, denominator)
  end

end




p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]


p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)