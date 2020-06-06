# Consider the following expansion:

# solve("3(ab)") = "ababab" -- "ab" repeats 3 times
# solve("2(a3(b))" = "abbbabbb" -- "a3(b)" == "abbb" repeats twice.
# Given a string, return the expansion of that string.

# Input will consist of only lowercase letters and numbers (1 to 9) in valid parenthesis. There will be no letters or numbers after the last closing parenthesis.


=begin

Input : a string

Output : expansion of given string

Rules :
    if a number precedes a parenthesis, multiply the string inside the paranthesis by the number
Algorithm:
    if the string has '(', find the index of '(' and ')'
      -slice the string from the two indicies
      - check again
      return the string
    if the current char is numerical, multiply the string by the number
    else append the string to the char

=end

def solve(string)
  if string.include?('(')
    start_idx = string.index('(')
    end_idx = string.length - 1 - string.reverse.index(')')
    substring = solve( string[(start_idx + 1)..(end_idx - 1)] )
  else
    return string
  end

  num = string[0..start_idx - 1].match(/\d+/)
  char = string[0..start_idx - 1].match(/[^0-9]+/)

  new_string = substring
  if num
    new_string = substring * num[0].to_i
  end
  if char
    new_string = char[0] + new_string
  end
  new_string
end

p solve("3(ab)")           == "ababab"
p solve("2(a3(b))")        == "abbbabbb"
p solve("3(b(2(c)))")      == "bccbccbcc"
p solve("k(a3(b(a2(c))))") == "kabaccbaccbacc"