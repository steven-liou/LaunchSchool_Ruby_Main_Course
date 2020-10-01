# modify the previous method so that it can work with any dimension matrix

# iterate through the columns of the matrix, then within each column iterate through the rows of the matrix, store the rows' elements into a subarray. Push the subarray into the new array


def transpose(matrix)
  transposed_array = []
  row_dim = matrix.size
  column_dim = matrix[0].size

  column_dim.times do |column|

  row_array = (0...row_dim).map do |row|
      matrix[row][column]
    end
    transposed_array << row_array
  end
  transposed_array
end





p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
   [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]