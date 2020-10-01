=begin

Input : a letter

Output : a string that gives the shape determined by input letter

Rules
  The middle row of the diamond is the given letter
  The diamond is symetrical both in vertical and horizaontal direction

Data structure / Algorithms
  to print a single line, need to know the distance from middle, and the middle character index
  the width of the line is (2 * middle + 1) -> n
  have a left index that is at distance, and a right index that is (n- distance -1)
  iterate from 0 to n, if the index is not either the left or right index, insert a ' ', else insert the current character

  to create the diamond, iterate from distance that is (middle - 1) down to 0
  and then iterate from 1 to (middle - 1)
  join the string with new line
=end

module Diamond
  LETTER = ('A'..'Z').to_a

  def self.make_diamond(middle_letter)
    middle_row = LETTER.index(middle_letter)

    top_diamond = (middle_row).downto(0).map { |distance| make_line(distance, middle_row) }
    bottom_diamond = 1.upto(middle_row).map { |distance| make_line(distance, middle_row) }

    (top_diamond + bottom_diamond).reduce("") { |string, line| string + line + "\n" }
  end

  def self.make_line(distance, middle_row)
    width = 2 * middle_row + 1
    left_index = distance
    right_index = width - distance - 1

    width.times.reduce('') do |string, index|
      if index == left_index || index == right_index
        string << LETTER[middle_row - distance]
      else
        string << ' '
      end
    end
  end
end

