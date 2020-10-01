
require 'pry'

def print_in_box(string)
  window_width = 76
  string_length = string.size
  final_line_width = string_length
  string_array = []
  idx = 0

  if string_length > window_width
    line_numbers, last_line_length = string_length.divmod(window_width)

    line_numbers.times do |num|
      string_array << string[idx,  window_width]
      idx += window_width
    end
    last_line_idx = line_numbers * window_width
    string_array << (string[last_line_idx, last_line_idx + last_line_length]) + ' ' * (window_width - last_line_length)
    final_line_width = window_width
  end

  horizontal_rule = '+' + ('-' * (final_line_width + 2)) + '+'
  vertical_rule = '|' + (' ' * (final_line_width + 2)) + '|'




  puts horizontal_rule
  puts vertical_rule


  if string_length > window_width
    string_array.each do  |str|
      puts "| #{str} |"
    end
  else
    puts "| #{string} |"
  end
  puts vertical_rule
  puts horizontal_rule
end


def temp(string)
  window_width = 76
  string_length = string.size
  string_array = []
  idx = 0

  if string_length > window_width
    line_numbers, last_line_length = string_length.divmod(window_width)

    line_numbers.times do |num|
      string_array << string[idx,  window_width]
      idx += window_width
    end
    last_line_idx = line_numbers * window_width
    string_array << (string[last_line_idx, last_line_idx + last_line_length]) + ' ' * (window_width - last_line_length)
    string_length = window_width
  end
  string_array
end


print_in_box('line 1 hello what is going to do line s a;wr naw sljfd sdkjf lks line 1 this should be how to line2 line 2 line 2 line 2 line 3 line 3 line 4 line 4 line4 line 4 lin 5 lin5 lin5 lin5 we lin6 line 6 line 6')

