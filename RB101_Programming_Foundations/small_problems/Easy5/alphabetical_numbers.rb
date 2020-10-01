# input: array of integers between 0 and 19
# output: an array of those integers sorted based on the English word of those integers



ENGLISH_NUMBERS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine',
                   'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen',
                   'eighteen', 'nineteen' ]

# def alphabetic_number_sort(numbers_array)
#   numbers_array.sort_by do |number|
#       ENGLISH_NUMBERS[number]
#   end
# end

def alphabetic_number_sort(numbers_array)
  numbers_array.sort do |number1, number2|
      ENGLISH_NUMBERS[number1] <=> ENGLISH_NUMBERS[number2]
  end
end



p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0]