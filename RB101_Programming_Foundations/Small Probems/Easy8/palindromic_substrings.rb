# input : string
# output : an array of strings that are all possible substrings to the original that are palindromic
# palindrome is a word that is the same read forward and reverse



def palindromes(string)
  all_substrings = substrings(string)
  all_substrings.select { |word| palindrome?(word) }
end

def palindrome?(string)
  #ignores non-alphanumeric and is case insensitive
  string = string.delete('^A-Za-z0-9').downcase
  string == string.reverse && string.length > 1

end


def substrings(string)
  array = []
  string_length = string.size

  string_length.times do |idx|
    (string_length - idx).times do |last_index|
      array << string[idx..(idx + last_index)]
    end
  end

  array
end


p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]