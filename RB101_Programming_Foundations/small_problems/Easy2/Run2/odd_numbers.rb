# x = 1
# loop do
#   puts x
#   x += 2
#   break if x > 99
# end


# (1..99).each do |num|
#   puts num if num.odd?
# end

# 1.upto(99).select(&:odd?).each { |num| puts num }
1.step(99, 2).each { |num| puts num}
