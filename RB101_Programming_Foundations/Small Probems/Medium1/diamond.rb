# 1   1
# 3   1 3 1
# 5   1 3 5 3 1

# Generate an array with sequence starting at 1 and ending at n, and increment by 2
# the padding would be the width (n - (idx+1)) / 2

def diamond(n)
  array = Array.new(n)
  middle = n / 2

  (0..middle).each { |idx|array[idx] = idx * 2 + 1 }
  array[(middle+1)..-1] = array[0, middle].reverse

  array.each do |diamonds|
    side_paddings = ' ' * ( (n - diamonds) / 2 )
    middle_padding = ' ' * (diamonds - 2) if diamonds > 1
    if diamonds > 1
      puts "#{side_paddings}*#{middle_padding}*#{side_paddings}"
    else
      puts "#{side_paddings}#{'*'}#{side_paddings}"
    end
  end



end

diamond(9)