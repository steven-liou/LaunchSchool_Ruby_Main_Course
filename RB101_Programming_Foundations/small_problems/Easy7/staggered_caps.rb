#input : string
#output : new string with original sting with staggered capitalization patteren

# iterate through each character of the string, if the idx is even, uppercase it, else uppercase it

# def staggered_case(string)
#   chars = string.split('')
#   chars.each_with_index do |char, idx|
#     if idx.odd? then chars[idx] = char.downcase
#     else chars[idx] = char.upcase
#     end
#   end
#   chars.join
# end

def staggered_case(string)
  need_upper = true
  result = ''
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end

  result
end




p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'