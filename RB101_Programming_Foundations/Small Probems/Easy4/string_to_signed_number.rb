# input: string of digits, potentially + or - or no signed
# output: integer with specified signed value


def string_to_signed_integer(string)
  sign = 1
  case string[0]
  when '-'
    string.slice!(0)
    sign = -1
  when '+'
    string = string[1..-1]
  end
  sign * string_to_integer(string)
end



def string_to_integer(string)
  num_hash = {'0'=> 0, '1'=> 1, '2'=> 2, '3' => 3, '4' => 4, '5'=> 5,
              '6'=> 6, '7'=> 7, '8'=> 8, '9'=> 9}

  array = string.chars.map do |char|
    num_hash[char]
  end

  num = 0
  array.each do |val|
    num = num * 10 + val
  end
  num

end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100