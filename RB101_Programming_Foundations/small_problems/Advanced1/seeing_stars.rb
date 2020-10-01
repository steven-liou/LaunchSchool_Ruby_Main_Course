# input : an odd number >= 7
# output : print the pattern

# pttern : the center of the pattern has that many stars ( n / 2 + 1)
#          any other lines have 3 stars
#          maximum distance from center is n / 2
#          each line that is away from the stars would have side padding of (n - 3- 2*(d - 1) ) / 2
#          each line that is away from the center, would have gap padding of (d - 1)

def star(n)
  center = n / 2 + 1
  max_distance = n / 2

  max_distance.downto(1) do |d|
    print_stars(n, d)
  end
  print_stars(n)

  1.upto(max_distance) do |d|
    print_stars(n, d)
  end

end

def print_stars(n, d=0)
  if d == 0
    puts '*' * n
  else
    side_padding = ' ' * ( (n - 3 - 2*(d - 1)) / 2 )
    gap_padding = ' ' * (d - 1)
    puts side_padding + (['*'] * 3).join(gap_padding) + side_padding
  end
end

star(9)



