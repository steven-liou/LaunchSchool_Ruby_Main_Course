# def penultimate(string)
#   words = string.split
#   words[-2]
# end


# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'


def middle(string)
  words = string.split
  middle_idx = words.size / 2

  if words.empty?
    ''
  elsif words.size.odd?
    words[middle_idx]
  else
    words[middle_idx - 1] + " " + words[middle_idx]
  end
end


p middle('')
p middle('last')
p middle('last word')
p middle('last word here')
p middle('last word here near')
p middle('last word here world ends')