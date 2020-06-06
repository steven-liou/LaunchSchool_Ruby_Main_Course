array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value.clone }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# to avoid having the elements of array2 point to the same respective string objects in each index, you can push the copy of the string by calling String#clone or String#dup.

# alternatively, you can add by assignment