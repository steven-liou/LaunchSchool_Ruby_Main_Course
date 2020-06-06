# Input: year
# output century string that ends with st nd rd th as appropriate for that number

#logic
  # To get the current century number
  #   Base is the current year divided by 100, integer division
  #   Check if the number ends with 00, convert to string and compare the string values
  #     if true, don't increment the base by 1, else increment the base by 1

  # Append suffix
  #     if the second to last century digit is 1, append everything to 'th'
  #                         else
  #                           If the last century digit is
  #                                  1, append "st
  #                                  2, append end
  #                                  3. append rd
  #                             else append 'th'


def century(year)
  base_century = year / 100
  remain_years = year % 100
  century = remain_years == 0 ? base_century : base_century + 1

  century.to_s + century_suffix(century)

end

def century_suffix(century)

  if !([11, 12, 13].include?(century % 100))
    last_digit = century % 10

    case last_digit
    when 1
      'st'
    when 2
      'nd'
    when 3
      'rd'
    else
     'th'
    end
  else
    'th'
  end
end







puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'

