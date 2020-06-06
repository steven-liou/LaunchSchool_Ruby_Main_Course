# get the middle index
# if the length of the string is odd, return 1 character
# if the length of the string is even, return 2 characters


def center_of(string)
  length = string.size
  middle_idx = length / 2

  if length.odd?
    string[middle_idx]
  else
    string[middle_idx - 1, 2]
  end
end

p center_of('I love ruby')  == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'