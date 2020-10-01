# def get_grade(num1, num2, num3)
#   average = (num1 + num2 + num3) / 3

#   case average
#   when 90..100 then 'A'
#   when 80..90  then 'B'
#   when 70..89  then 'C'
#   when 60..70  then 'D'
#   when 0..59   then 'F'
#   else              'A++'
#   end
# end

def get_grade(num1, num2, num3)
  average = (num1 + num2 + num3) / 3

  case
  when average < 60 then 'F'
  when average < 70 then 'D'
  when average < 80 then 'C'
  when average < 90 then 'B'
  when average <= 100 then 'A'
  else                   'A+'
  end
end


puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"
puts get_grade(105, 103, 105) == 'A+'