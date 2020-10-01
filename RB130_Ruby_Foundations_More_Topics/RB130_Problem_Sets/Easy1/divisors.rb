def divisors(number)
  divisor_array = []

  1.upto(Math.sqrt(number)) do |divisor|
    dividend, remainder = number.divmod(divisor)
    divisor_array << divisor << dividend if remainder == 0
  end
  divisor_array.sort.uniq
end


p divisors(1) == [1]
puts divisors(7) == [1, 7]
puts divisors(12) == [1, 2, 3, 4, 6, 12]
puts divisors(98) == [1, 2, 7, 14, 49, 98]
puts divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute