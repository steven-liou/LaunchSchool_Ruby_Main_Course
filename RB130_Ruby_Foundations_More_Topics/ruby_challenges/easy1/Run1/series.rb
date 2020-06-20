=begin

Input : a number representing the consecutive number series length

Output :

Rules


Data structure / Algorithms
  throw an ArgumentError if the input number is greater than the string_digits length
  create a digits array for storing the subarray of possible digit series
  Iterate through each element in the string_digits with index
    if the current index is (string_digits.size - n + 1) break
    push the subarray of string_digits at current index and length n to result array
  return the result array
=end

class Series
  def initialize(string_digits)
    @string_digits = string_digits.chars.map(&:to_i)
  end

  def slices(n)
    raise ArgumentError if n > @string_digits.size
    result = []
    last_index = @string_digits.size - n
    
    @string_digits.each_with_index do |_, index|
      break if index > last_index
      result << @string_digits[index, n]
    end
    result
  end
end