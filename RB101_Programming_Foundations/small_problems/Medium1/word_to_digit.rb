# convert string that has english version to a string of digits

def word_to_digit(string)
  array = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']

  array.each_with_index do |number_str, idx|
    string = string.gsub(/\b#{number_str}\b/, idx.to_s)
  end
  string.gsub!(/(?<=[0-9])\s(?=[0-9])/, '')
end


p word_to_digit('Please call me at five five five  one two three four. Thanks.')
