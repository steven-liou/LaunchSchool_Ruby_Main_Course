# input : a matrix array
# output : original array that is mutated

# iterate diagonally in the outer loop, [0][0], [1][1], [2][2]
#   for each iteratino, an inner loop will go from [i][idx..(n-1), swap with the reverse index element

def transpose!(matrix)
  dim = matrix.size
  row = 0

  loop do
      column = row
      loop do
        matrix[row][column], matrix[column][row] = matrix[column][row], matrix[row][column]

        column += 1
        break if column > dim - 1
      end
    row += 1
    break if row > dim - 1
  end

end



matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

transpose!(matrix)
p matrix  == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]



matrix = [
  [1, 5, 8, 10],
  [4, 7, 2, 12],
  [3, 9, 6, 13],
  [14, 15, 16, 17]
]

transpose!(matrix)
p matrix