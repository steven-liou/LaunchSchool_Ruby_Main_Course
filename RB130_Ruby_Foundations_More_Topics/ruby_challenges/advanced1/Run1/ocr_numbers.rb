# Recognize that each number has 3 columns and 4 rows
# there is no space between numbers

# Represent a digit by having an array of

class OCR
  NUMBERS = {
    [" _ ", "| |", "|_|"] => "0",
    ["   ", "  |", "  |"] => "1",
    [" _ ", " _|", "|_ "] => "2",
    [" _ ", " _|", " _|"] => "3",
    ["   ", "|_|", "  |"] => "4",
    [" _ ", "|_ ", " _|"] => "5",
    [" _ ", "|_ ", "|_|"] => "6",
    [" _ ", "  |", "  |"] => "7",
    [" _ ", "|_|", "|_|"] => "8",
    [" _ ", "|_|", " _|"] => "9",

  }

  def initialize(text)
    @text = text
  end

  def convert
    number_string = ''
    ocr_lines = @text.split("\n\n")
    digit_lines = ocr_lines.each_with_object([]) do |digit_line, line_array|
      line_array << convert_line(digit_line)
    end
    digit_lines.join(',')
  end

  def convert_line(digit_line)
    *line = digit_line.split("\n")
    line_length = (line.first.length / 3.0).zero? ? 3 : (line.first.length / 3.0).ceil * 3
    padded_line = pad_last_column(line, line_length)

    (0...line_length).step(3).with_object("") do |index, digits|
      digits << convert_digit(padded_line, index)
    end

  end

  def convert_digit(rows, index)
    digit = rows.each_with_object([]) do |row, digit_array|
      digit_array << row[index, 3]
    end
    NUMBERS[digit] || "?"
  end

  def pad_last_column(rows, pad_to_number)
    rows.each_with_object([]) do |row, padded_rows|
      padded_rows << row.center(pad_to_number)
    end
  end

end