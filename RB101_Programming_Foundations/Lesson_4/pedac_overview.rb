def substrings(str)
  result = []
  start_substring_idx = 0
  end_substring_idx = start_substring_idx + 1

  loop do
    break if start_substring_idx == str.size
    start_substring_idx += 1
  end
  
end

substrings("abc").tap {|val| puts val}