#Warm up question
#Given an array, rotate first element to last position, shift everything to the left. In place!
#Example ["a", "b", "c", "d"] --> ["b", "c", "d", "a"]
#In place means elements in the final array point to the original array's objects.
#Example, object_id of first element in original array is the same as object_id of last element in the rotated array



=begin
The input is a string str of digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size sz (ignore the last chunk if its size is less than sz).

If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk;
  otherwise rotate the first char of the chink to the end of the chunk.

If a chunk is shorter than sz, ignore the chunk in the final modified string
Put together these modified chunks and return the result as a string.

sz is <= 0 or if str is empty return ""
sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".
Examples:
revrot("123456987654", 6) --> "234561876549"
revrot("123456987653", 6) --> "234561356789"
revrot("66443875", 4) --> "44668753"
revrot("66443875", 8) --> "64438756"
revrot("664438769", 8) --> "67834466"
revrot("123456779", 8) --> "23456771"
revrot("", 8) --> ""
revrot("123456779", 0) --> ""
revrot("563000655734469485", 4) --> "0365065073456944"

=end


# input : a string of digits, and the chunk size

# output : modified chunks and return the result as a string

# Rules : cut the string into chunks of size sz
  # - if size of string is 0 or empty, return ""
  # sz is greater than length of str, also return ""
  # - if the chunk represents an integer such as the sum of the cubes of its digits is divisible by 2,
  #  - reverse that chunk
  #  - if not, rotate it to the left by one position

# Alog :
  # - guard cases against str
    #   - , or empty, return ""
    # - guard cases against sz
    #   - sz == 0
    #   - if sz > length of string. retirm ""
  # break up the original string into substrings by lengths specified by sz
  # for each substring, check if the number it represent is such that the sum of the cubes of its digits is divisible by 2
      #  - reverse that chunk
      #  - if not, rotate it to the left by one position
  # join the substrings into a modified string


def revrot(str, sz)
  return "" if str.empty? || sz <= 0 || sz > str.length

  substrings = []

  for start_index in 0.step(str.length, sz)
    substrings << str[start_index, sz]
  end
  substrings.delete("")

  for num_str, index in substrings.each.with_index
    if sz > num_str.length
      substrings.delete_at(index)
      break
    end
    # sum = 0
    # for digit in num_str.each_char
    #   sum += (digit.to_i) ** 3
    # end
    sum = num_str.split('').reduce(0) { |acc, digit| acc + (digit.to_i ** 3) }

    if sum % 2 == 0
      num_str.reverse!
    else
      substrings[index] = num_str[1..-1] + num_str[0]
    end
  end
  substrings.join('')
end

p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6)    == "234561356789"
p revrot("66443875", 4)  == "44668753"
p revrot("66443875", 8)  == "64438756"

p revrot("", 8) == ""
p revrot("123456779", 0) == ""

p revrot("563000655734469485", 4) == "0365065073456944"
p revrot("664438769", 8)  == "67834466"
p revrot("123456779", 8)  == "23456771"