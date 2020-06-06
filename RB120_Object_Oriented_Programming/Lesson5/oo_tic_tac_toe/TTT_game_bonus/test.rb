

def best_square
  board_size = 3
  board_values = Hash.new
  (1..board_size**2).each { |key| board_values[key] = 0 }

  evaluate_square(board_values)
end

def evaluate_square(board_values)
  board.squares.va

end

p evaluate_board

