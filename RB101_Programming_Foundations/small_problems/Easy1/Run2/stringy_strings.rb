def stringy(number, start=1)
  base = start == 1 ? '10' : '01'
  result = base * (number / 2)
  number.odd? ? result + base[0] : result
end


puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
