=begin
Your job is to write a function which increments a string, to create a new string.

If the string already ends with a number, the number should be incremented by 1.
If the string does not end with a number. the number 1 should be appended to the new string.
Examples:

foo -> foo1

foobar23 -> foobar24

foo0042 -> foo0043

foo9 -> foo10

foo099 -> foo100
=end

# input: a string that may or may not end with a number
# output : a string with original characters, but with ending number + 1
# First check if the string ends with a number, if it doesn't, append 1 to string, return the string
#   if it does, iterate through the string, find the first index that has numerical characters
#   start storing each additional number character until the end of string

def increment_string(string)
  return string << "1" if !('0'..'9').include?(string[-1]) || string.empty?

  original_number_string = ''
  first_num_index = nil
  zero_padding = 0
  for char , index in string.each_char.with_index
    original_number_string << char if ('0'..'9').include?(char)
    zero_padding += 1 if char == '0' && original_number_string.count('[1-9]') == 0
    first_num_index = index if ('0'..'9').include?(char) && !first_num_index
  end
  original_number_length = original_number_string.to_i.to_s.length
  number = original_number_string.to_i + 1
  number_string = number.to_s

  zero_padding -= 1 if number_string.length > original_number_length || original_number_string.to_i == 0
  number_string = format("%0#{zero_padding + number_string.length}d", number)
  string[first_num_index..-1] = number_string
  string
end


# p increment_string("foo")         # == "foo1"
# p increment_string("foobar001")   # == "foobar002"
# p increment_string("foobar1")     # == "foobar2"
# p increment_string("foobar00")    # == "foobar01"
# p increment_string("foobar99")    # == "foobar100"
p increment_string("nra20")            # == "1"