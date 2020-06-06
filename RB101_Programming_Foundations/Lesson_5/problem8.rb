# Using the each method, write some code to output all of the vowels from the strings.



hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
vowels = []

hsh.each_value do |arr|
  arr.each do | string |
    vowels << string.scan(/[aeiou]/)
  end
end

vowels.flatten!

p vowels


#alternative
vowels = []
hsh.each_value do |arr|
  arr.each do |string|
    string.chars.each do |char|
      vowels << char if 'aeiou'.include?(char)
    end
  end
end

p vowels
