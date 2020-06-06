# Write method scramble(str1,str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.
# For example:
# str1 is 'rkqodlw' and str2 is 'world' the output should return true.
# str1 is 'cedewaraaossoqqyt' and str2 is 'codewars' should return true.
# str1 is 'katas' and str2 is 'steak' should return false.
# Only lower case letters will be used (a-z). No punctuation or digits will be included.


=begin

Input: two strings

Output: true/ false if portion of str1 chars can be rearranged to match str2

Rules

Data structure / Algorithms
  - keep in mind of the count
  - iterate through each char in str2
    - for each char, check if the count of this char in str2 is equal to str1's
      - if it is, continue
      - if it isn't, return false
  - return true

Pseudo Code

=end

def scramble(str1, str2)

  for char in str2.each_char
     return false unless str2.count(char) <= str1.count(char)
  end

  true
end


p scramble('javaass', 'jjss') == false
p scramble('rkqodlw','world') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true
p scramble('cedewaraaossoqqyt','codewars') #== true
