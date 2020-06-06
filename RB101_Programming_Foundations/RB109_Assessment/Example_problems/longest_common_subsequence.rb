=begin
Write a function called LCS that accepts two sequences and returns the longest subsequence common to the passed in sequences.

Subsequence
A subsequence is different from a substring. The terms of a subsequence need not be consecutive terms of the original sequence.

Example subsequence
Subsequences of "abc" = "a", "b", "c", "ab", "ac", "bc" and "abc".

LCS examples
lcs( "abcdef" , "abc" ) => returns "abc"
lcs( "abcdef" , "acf" ) => returns "acf"
lcs( "132535365" , "123456789" ) => returns "12356"
Notes
Both arguments will be strings
Return value must be a string
Return an empty string if there exists no common subsequence
All tests will only have a single longest common subsequence. Don't worry about cases such as LCS( "1234", "3412" ), which would have two possible longest common subsequences: "12" and "34".
=end

=begin

Input : two strings

Output : the longest subsequence

Rules :
    A subsequence of a string in another string does not limit to exact match
Algorithm:
  - determine the subsequence of one string in another
    -create an empty string that holds the results
    - create an index for str2 that starts at 0
    - iterate through the current string char by char
      - iterate through the other string character by character (start at index, and stops at length - 1)
       = check the str2 current char is equal to str1 char
        - if it is, then push the result, increment index by 1, break
          - if it isn't index += 1
  - determine the subsequence for both strings
            -return the subsequence that is longer of the two

=end
def lcs(str1, str2)
  sub1 = subsequence(str1, str2)
  sub2 = subsequence(str2, str1)

  if sub1.length >= sub2.length
    sub1
  else
    sub2
  end

end

def subsequence(str1, str2)
  result = ''
  index = 0

  str1.each_char do |char|
    while index < str2.length
      if char == str2[index]
        result << char
        index += 1
        break
      end
      index += 1
    end
  end
  result

end



# p subsequence( "abcdef" , "abc" )
# p subsequence( "abcdef" , "acf" )
# p subsequence( "132535365" , "123456789" )


# p lcs( "abcdef" , "abc" ) == "abc"
# p lcs( "abcdef" , "acf" ) == "acf"
p lcs( "132535365" , "12356789" )# == "12356"