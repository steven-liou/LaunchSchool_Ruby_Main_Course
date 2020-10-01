# input : 3 numbers representing each side of a triangle
# output : a key that identifies if the input dimensions are valid. If valid, further identify the type of triangle

# A valid triange has sum of any two sides greater than the third, and all sides have positive number. Return :invalid if fail


require 'pry'


def triangle(side1, side2, side3)
  return :invalid unless valid_sides?(side1, side2, side3)
  if side1 == side2  && side2 == side3
    :equilateral
  elsif [side1, side2, side3].uniq != [side1, side2, side3]
    :isosceles
  else
    :scalene
  end
end

def valid_sides?(side1, side2, side3)
  positives = [side1, side2, side3].all? { |side| side > 0 }
  sides = [side1, side2, side3]
  largest_side = sides.max

  check_sides = 2 * largest_side < sides.sum

  positives && check_sides
end

def greater_than_third?(side1, side2, side3)
  side1 + side2 > side3
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid