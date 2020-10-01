# def average(array)
#   array.reduce(&:+) / array.size
# end

def average(array)
  sum = 0
  array.each do |number|
    sum += number
  end
  sum / array.size.to_f
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
