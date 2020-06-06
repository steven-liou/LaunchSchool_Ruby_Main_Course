# Task
# Write a function that accepts msg string and returns local tops of string from the highest to the lowest.
# The string's tops are from displaying the string in the below way:

#                                                       3
#                               p                     2   4
#             g               o   q                 1
#   b       f   h           n       r             z
# a   c   e       i       m          s          y
#       d           j   l             t       x
#                     k                 u   w
#                                         v

# The next top is always 1 character higher than the previous one. For the above example, the solution for the abcdefghijklmnopqrstuvwxyz1234 input string is 3pgb.

# When the msg string is empty, return an empty string.
# The input strings may be very long. Make sure your solution has good performance.


=begin

Input : a string

Output : the characters of original string that are at the peaks

Rules :
    # number of elements in each peak is
    1 * 4, 2* 4 3 * 4 ...
    The peak is (n * 4) / 3
    
Algorithm:
      - create an array that stores the peaks character
      - iterate through each character of the array
        - the initial height of the character starts at 0,
        - it increments by 1 until the the maximum height, prepend the array with the peak character
        - then it decrement by 1 until the maximum trough, increment maximum height by 1
      - then the pattern repeats

=end




def tops(msg)
  peaks = []
  peak_number = 1
  height = 1

  while peak_number * height <= msg.length
    peaks.unshift(msg[height * peak_number])
    height += 1
    peak_number += 2
  end
  peaks.join('')
end

tops('abcdefghijklmnopqrstuvwxyz1234') #== '3pgb'