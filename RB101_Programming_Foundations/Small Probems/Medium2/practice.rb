=begin

Input : string

Output : bool t/f if the parenthesis match

Rules


Data structure / Algorithms
  create a counter that starts at 0

  iterate through the each char in the string
    check if the current char is '('
      if it is, add 1 to counter
    check if the current char is ')'
        if it is, -1 to counter

    if the counter is < 0, then return false
  return true if counter == 0 else false

=end

def balanced?(string)
  counter = { ['(', ')'] => 0 , ['[', ']'] => 0 }

  string.each_char do |char|
    if ['(', '['].include?(char)
      mark = counter.select { |key| key.include?(char) }
      counter[mark.keys[0]] = mark.values[0] += 1
    elsif [')', ']'].include?(char)
      mark = counter.select { |key| key.include?(char) }
      counter[mark.keys[0]] = mark.values[0] -= 1
    end
    return false if counter.any? { |_, val| val < 0 }
  end

  counter.all? { |_, val| val.zero? }
end

p balanced?('What (is) [[]]]this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false