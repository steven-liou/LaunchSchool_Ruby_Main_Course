=begin
In mathematics, a perfect power is a positive integer that can be expressed as an integer power of another positive integer. More formally, n is a perfect power if there exist natural numbers m > 1, and k > 1 such that mk = n.

Your task is to check wheter a given integer is a perfect power. If it is a perfect power, return a pair m and k with mk = n as a proof. Otherwise return Nothing, Nil, null, NULL, None or your language's equivalent.

Note: For a perfect power, there might be several pairs. For example 81 = 3^4 = 9^2, so (3,4) and (9,2) are valid solutions. However, the tests take care of this, so if a number is a perfect power, return any pair that proves it.
=end


=begin

Input : a number

Output : an array of the base, power, if it is a perfet power, else return nil

Rules :
    perfect power can be expressed as an integer power of another positive integer
    m ** k = n
Algorithm:
  - increment from 2 to the number / 2
  - for each iteration
      -create an array,  check if the current number is divisible by the divisor
        - if it is not, set array to false, next
        - if it is, add the divisor to the array,
        - continue until the remainder is 1
      -if array is not false, then return the divisor, and its length
    - return nil
=end



def isPP(number)
  2.step(number ** 0.5). each do |m|
    k = 0
    number_temp = number

    while number_temp > 1
      number_temp, remainder = number_temp.divmod(m)
      if remainder == 0
        k += 1
      else
        k = false
        break
      end
    end
    return [m, k] if k
  end
  nil
end


p isPP(4)    # [2,2], "4 = 2^2")
p isPP(8)    # [2,3], "8 = 2^3")
p isPP(36)   # [6,2],  "36 = 6^2")
p isPP(9)    # [3, 2], "9 = 3^2")
p isPP(5)    # nil, "5 is not perfect")