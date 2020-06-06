
def joinor(array, delimeter= ', ', conj='or')
  case array.size
  when 0 then ''
  when 1 then array[0]
  when 2 then array.join(" #{conj} ")
  else
    array[-1] = "#{conj} #{array[-1]}"
    array.join(delimeter)
  end
end








puts joinor([1, 2])                   # => "1 or 2"
puts joinor([1, 2, 3])                # => "1, 2, or 3"
puts joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
puts joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"