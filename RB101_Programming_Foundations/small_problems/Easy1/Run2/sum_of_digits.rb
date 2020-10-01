# def sum(number)
#   number.to_s.chars.map(&:to_i).reduce(&:+)
# end


def sum(number)
  digits = []

  while number > 0
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
  end

  digits.reduce {|sum, digit| sum + digit }
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
