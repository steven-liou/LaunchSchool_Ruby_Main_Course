# write an exclusive or method, where only one of two operands is true

# xor(false, true) true
# xor(true, false) true
# xor(true, true) false
# xor(false, false) false

def xor?(bool1, bool2)
  result = nil
  if !(bool1 && bool2)
    if bool1 || bool2
      result = true
    else
      result = false
    end
  else
    result = false   #address both true case
  end
  result
end

# shorter version
def xor?(value1, value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end

puts xor?(5.even?, 4.even?)
puts xor?(5.odd?, 4.odd?)
puts xor?(5.odd?, 4.even?)
puts xor?(5.even?, 4.odd?)