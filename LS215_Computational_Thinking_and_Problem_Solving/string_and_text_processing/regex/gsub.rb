text = 'Four score and seven'
vowelless = text.gsub(/[aeiou]/, '*')
puts vowelless

text = %(We read "War of the Worlds".)
puts text.sub(/(['"]).+\1/, "\1The Time Machine\1")
