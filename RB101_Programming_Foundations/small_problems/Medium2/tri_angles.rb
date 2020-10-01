# input : 3 numbers that represent each side of a triangle
# output : determine whether the triangle is :invalid, :acute, :right, :obtuse


# backgounrd
# right : one angle is 90 degrees
# acute : all angles < 90
# obtuse : one angle > 90
# sum of three angles must be 180 degrees, and all angles must be > 0

# first check if the three angles make a valid triangle, sum == 180? each angle > 0?
# Check if the largest angle is == 90, if it is, then it's a right triangle
# check if the largest angle is > 90, if it is, it's an obtuse triangle
# else, it's an acute triangle

def triangle(a1, a2, a3)
  valid = [a1, a2, a3].all? { |angle| angle > 0 } && [a1, a2, a3].reduce(&:+) == 180
  return :invalid unless valid

  largest_angle = [a1, a2, a3].max

  case largest_angle
  when 90       then :right
  when 90..180  then :obtuse
  else               :acute
  end
end

p triangle(60, 70, 50) #== :acute
p triangle(30, 90, 60) #== :right
p triangle(120.5, 50, 9.5) #== :obtuse
p triangle(0, 90, 90) #== :invalid
p triangle(50, 50, 50) #== :invalid