def valid_number?(string)
  !!string.match(/^\d+$/)
end


p valid_number?('15')
p valid_number?('he15')
p valid_number?('15h')