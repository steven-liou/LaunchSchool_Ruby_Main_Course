# input : a string
# output : an array of substrings of increasing numbers of characters from the original string


def substrings_at_start(string)
  array = []

  string.size.times do |idx|
    array << string[0..idx]
  end
  array
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']