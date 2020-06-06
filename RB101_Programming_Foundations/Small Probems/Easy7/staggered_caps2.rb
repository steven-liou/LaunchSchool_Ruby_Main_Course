def staggered_case(string, count_special= true)
  need_cap = true
  result = ''
  if count_special
    regex_pattern = /./
  else
    regex_pattern = /[A-Za-z]/i
  end


  chars = string.split('')

  chars.each do |char|
    if char =~ regex_pattern
      if need_cap
        result += char.upcase
      else
        result += char.downcase
      end
      need_cap = !need_cap
    else
      result += char
    end
  end

  result
end


p staggered_case('I Love Launch School!', false) == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL CaPs'
p staggered_case('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 nUmBeRs'