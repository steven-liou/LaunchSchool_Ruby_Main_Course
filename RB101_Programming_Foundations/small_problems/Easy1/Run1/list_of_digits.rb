#Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

def list_digits(integer)
  digits = []
  loop do
    digits.unshift(integer % 10 )
    integer /= 10
    break if integer == 0
  end
  digits
end


def list_digits2(integer)
  integer.to_s.chars.map(&:to_i)   #the &:to_i is syntatic sugar for |val| val.to_i
end

p list_digits(12345)
p list_digits(7)

