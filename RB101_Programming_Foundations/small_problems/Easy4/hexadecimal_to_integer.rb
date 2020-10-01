def hexadecimal_to_integer(string)
  num_hash = {'0'=> 0, '1'=> 1, '2'=> 2, '3' => 3, '4' => 4, '5'=> 5,
              '6'=> 6, '7'=> 7, '8'=> 8, '9'=> 9, 'A'=> 10, 'B'=> 11,
              'C'=> 12, 'D'=> 13, 'E'=> 14, 'F'=> 15}

  digits = string.split('').map {|char| num_hash[char.upcase]}

  num = 0

  digits.each do |digit|
    num = num * 16 + digit
  end
  num

end

puts hexadecimal_to_integer('4D9f') == 19871
