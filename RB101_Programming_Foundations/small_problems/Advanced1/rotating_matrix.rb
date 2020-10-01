

def rotate90(matrix)
  row_dim = matrix.size
  column_dim = matrix.first.size
  rotated_matrix = []

  column_dim.times do |column|
    row_array = (0...row_dim).map do |row|
      matrix[row_dim - 1 - row][column]
    end
    rotated_matrix << row_array
  end
  rotated_matrix
end







matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
p new_matrix1
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2