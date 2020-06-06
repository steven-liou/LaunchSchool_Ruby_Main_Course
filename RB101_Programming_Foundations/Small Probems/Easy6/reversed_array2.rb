# def reverse(strings)
#   reverse_strings = Array.new(strings.size)

#   for i in 0..(strings.size-1)
#     reverse_strings[-i-1] = strings[i]
#   end
#   reverse_strings
# end


def reverse(strings)
  strings.inject([]) { |acc, string| acc.unshift(string) }
end


puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

puts list = [1, 3, 2]                      # => [1, 3, 2]
puts new_list = reverse(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]