# input : a matrix array
# output : a new array that have original array transposed

# create a new array with 3 empty elements for each 'column'
# Go over each subarray in the original matrix
#   iterate the subarray elements, append each to the new array's respective elements



def transpose(matrix)
  transposed_array = Array.new(3) {[]}

  matrix.each do |row|
    row.each_with_index do |element, idx|
      transposed_array[idx] << element
    end
  end

  transposed_array
end



matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]


new_matrix = transpose(matrix)

p new_matrix  == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix  == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
