# Have a variable that holds the sum
# Iterate through each digiit
# multiply the current sum by 8 to advance the place by 1, then add the current digit to sum

class Octal
  def initialize(number_string)
    @number_string = number_string
  end

  def to_decimal
    return 0 if @number_string =~ /[^0-7]/
    @number_string
      .chars
      .map(&:to_i)
      .reduce(0) { |number, digit| number * 8 + digit }
  end
end