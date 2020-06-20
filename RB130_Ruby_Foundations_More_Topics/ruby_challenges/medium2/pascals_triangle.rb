=begin
    1
   1 1
  1 2 1
 1 3 3 1
1 4 6 4 1

=end

class Triangle
  def initialize(levels)
    @levels = levels
  end

  def rows
    # return [[1]] if @levels == 0
    # return [[1], [1, 1]] if @levels == 1

    row_arrays = [[1]]

    1.upto(@levels - 1) do
      row_arrays << create_next_row(row_arrays.last)
    end
    row_arrays
  end

  def create_next_row(previous_row)
    previous_row = [0] + previous_row + [0]
    middles = previous_row.each_cons(2).map do |first, second|
      first + second
    end
  end
end

