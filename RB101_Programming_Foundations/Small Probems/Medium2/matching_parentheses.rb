# input : a string
# output : boolean true if all () are matching and balanced, false otherwise

# GO through the string character by character, if the character is ( then, add 1 to count
# if the character is ), then -1 to count
# if there are equal numbers, the count should be 0
# if the first parenthesis is a closing one, then the count should be -1, return false

def balanced?(string)
  count = 0
  string.split('').each do |char|
    if char == '('
      count += 1
    elsif char == ')'
      count -= 1
    end
    return false if count < 0
  end
  if count == 0
    true
  else
    false
  end
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false