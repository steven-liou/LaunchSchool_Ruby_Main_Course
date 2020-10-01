def sum(num)
  sum = 0

  until num % 10 == 0
    sum += num % 10
    num /= 10
  end
  
  sum
end

puts sum(23)
puts sum(496)
puts sum(123_456_789)

def sum2(num)
  digits = num.to_s.chars.map(&:to_i)
  sum = digits.reduce {|sum, val| sum += val}
end
puts sum2(23)
puts sum2(496)