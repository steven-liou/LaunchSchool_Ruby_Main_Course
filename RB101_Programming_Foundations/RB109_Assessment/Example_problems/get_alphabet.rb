=begin
  Given a character string, ex: 'a', 'b' ...
  Return an array of characters from the given character to the end of the English alphabet
  * Cannot use slice
  * Can only reference array element one at a time (no range input, or (index, length) input)
=end


get_alphabet('a')  # == ['a', 'b'... 'z']
get_alphabet('o')  # == ['o', 'p'... 'z']