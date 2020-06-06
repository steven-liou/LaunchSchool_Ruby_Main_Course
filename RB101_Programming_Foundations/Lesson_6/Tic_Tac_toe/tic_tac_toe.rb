require 'pry'

def board_size_num
  number = 3
  loop do
    prompt "Please input a board size number greater than 3: Default is 3"
    answer = gets.chomp
    if valid_integer?(answer) && answer.to_i > 2
      number = answer.to_i
      break
    elsif answer == ''
      break
    end
    puts "Please input a valid board size input"
  end
  number
end

def set_board(board, board_size)
  (board_size**2).times do |idx|
    row_idx = idx / board_size
    column_idx = idx % board_size
    key = [row_idx, column_idx]
    board[key] = ' '
  end
end

def update_board_options
  BOARD_OPTIONS.clear
  remaining_spots.times do |idx|
    board = REMAINING_BOARD.to_a.sort_by { |arr| arr[0] }
    BOARD_OPTIONS[idx] = board[idx][0]
  end
end

def show_board_options
  BOARD_OPTIONS.size.times do |idx|
    puts "#{idx + 1} Row #{BOARD_OPTIONS[idx][0] + 1} Column #{BOARD_OPTIONS[idx][1] + 1}"
  end
end

def display_board(hash, board_size)
  board_matrix = display_board_matrix(board_size)
  hash.each_with_index do |(_, mark), idx|
    row_idx = idx / board_size
    column_idx = idx % board_size
    board_matrix[(row_idx * 4) + 1][(column_idx * 6) + 2] = mark
  end

  board_matrix.each do |row_array|
    row_array.each { |elem| print elem }
    puts ''
  end
  puts "\n\n"
end

def display_board_matrix(board_size)
  row_dim_length = board_size * 4 - 1
  column_dim_length = board_size * 6 - 1
  matrix = Array.new(row_dim_length) { [] }

  matrix.each_with_index do |row_arr, row_idx|
    sep_row = (row_idx + 1) % 4 == 0 && row_idx != row_dim_length - 1

    if sep_row
      board_matrix_set_mark(row_arr, column_dim_length, '_', '+')
    else
      board_matrix_set_mark(row_arr, column_dim_length, ' ', '|')
    end
  end
  matrix
end

def board_matrix_set_mark(array, column_dim, place_mark, sep_mark)
  column_dim.times do |column_idx|
    sep_column = (column_idx + 1) % 6 == 0 && column_idx != column_dim
    if sep_column
      array[column_idx] = sep_mark
    elsif column_idx != column_dim
      array[column_idx] = place_mark
    end
  end
  array
end

def set_players_mark
  marks = ['O', 'X']
  answer = ''
  loop do
    prompt "Do you want tic or tac? Pick a number.\n1. Tic #{marks[0]} \n2. Tac #{marks[1]}"
    answer = gets.chomp
    break if %w(1 2).include?(answer)
    puts "That is not a valid answer, try again."
  end

  case answer
  when '1'
    EXISTING_PLAYERS['player1'] = marks[0]
    EXISTING_PLAYERS['computer'] = marks[1]
  when '2'
    EXISTING_PLAYERS['player1'] = marks[1]
    EXISTING_PLAYERS['computer'] = marks[0]
  end

end

def full_board?
  remaining_spots < 1 ? true : false
end

def mark_square(array, number, mark)
  array[number] = mark
end

def win?(mark)
  board_array = BOARD.values
  matrix_by_row = vector_to_matrix(board_array)
  matrix_by_column = matrix_by_row.transpose

  return true if win_line?(matrix_by_row, mark)
  return true if win_line?(matrix_by_column, mark)
  return true if win_diagonal?(matrix_by_row, mark)
  false
end

def win_line?(matrix, mark)
  matrix.any? do |sub_arr|
    sub_arr.all? do |spot|
      spot == mark
    end
  end
end

def win_diagonal?(matrix, mark)
  counter = matrix.size - 1

  descending_diagonal_array = []
  ascending_diagonal_array = []
  matrix.each_with_index do |sub_arr, idx|
    descending_diagonal_array.push(sub_arr[idx])
    ascending_diagonal_array.push(sub_arr[counter - idx])
  end
  descending_diagonal_array.all? { |elem| elem == mark } ||
    ascending_diagonal_array.all? { |elem| elem == mark }
end

def computer_move(board_size, pc_mark, user_mark)
  square = find_threat(pc_mark)
  square = find_threat(user_mark) if !square
  square = find_center_spot(board_size) if !square

  if !square
    square, = REMAINING_BOARD.to_a.sample
  end
  square
end

def find_threat(mark)
  board_array = BOARD.values
  matrix_by_row = vector_to_matrix(board_array)
  matrix_by_column = matrix_by_row.transpose

  row_threat = row_line_threat(matrix_by_row, mark)
  return row_threat if row_threat

  column_threat = column_line_threat(matrix_by_column, mark)
  return column_threat if column_threat

  diag_threat = diagonal_threat(matrix_by_row, mark)
  return diag_threat if diag_threat
  false
end

def row_line_threat(matrix, mark)
  danger = nil
  matrix.each_with_index do |sub_arr, row_idx|
    free_spot_idx = vector_free_spot(sub_arr)
    if sub_arr.count(mark) == matrix.size - 1 && free_spot_idx
      column_idx = free_spot_idx
      danger = [row_idx, column_idx]
      break
    end
  end
  danger
end

def column_line_threat(matrix, mark)
  danger = nil
  matrix.each_with_index do |sub_arr, row_idx|
    free_spot_idx = vector_free_spot(sub_arr)
    if sub_arr.count(mark) == matrix.size - 1 && free_spot_idx
      column_idx = free_spot_idx
      danger = [column_idx, row_idx]
      break
    end
  end
  danger
end


def diagonal_threat(matrix, mark)
  des_diag_array, asc_diag_array = diagonal_vectors(matrix)
  danger = nil
  des_diag_free_idx = vector_free_spot(des_diag_array)
  asc_diag_free_idx = vector_free_spot(asc_diag_array)

  if des_diag_array.count(mark) == matrix.size - 1 && des_diag_free_idx
    column_idx = des_diag_free_idx
    danger = [column_idx, column_idx]
  elsif asc_diag_array.count(mark) == matrix.size - 1 && asc_diag_free_idx
    column_idx = asc_diag_free_idx
    danger = [matrix.size - column_idx - 1, column_idx]
  end
  danger
end


def find_center_spot(board_size)
  center_spots = BOARD.select do |coords, spot|
    coords.all? { |coord| coord > 0 && coord < board_size - 1 } && spot == ' '
  end
  center_spots.keys.sample if center_spots
end

def vector_free_spot(vector)
  vector.index(' ')
end

def vector_to_matrix(vector)
  matrix = Array.new(Integer.sqrt(vector.size)) { [] }

  matrix.size.times do |idx|
    matrix[idx] = vector.shift(matrix.size)
  end
  matrix
end

def diagonal_vectors(matrix)
  descending_diagonal_array = []
  ascending_diagonal_array = []
  matrix.each_with_index do |sub_arr, idx|
    descending_diagonal_array.push(sub_arr[idx])
    ascending_diagonal_array.unshift(sub_arr[matrix.size - 1 - idx])
  end
  return descending_diagonal_array, ascending_diagonal_array
end

def valid_integer?(string)
  /^\d+$/.match(string) ? true : false
end

def valid_array(string, board_size)
  array = string.scan(/\d+/)
  if array && array.size == 2 && array.all? { |val| val.to_i <= board_size }
    array.map { |val| val.to_i - 1 }
  end
end

def empty_square?(key)
  BOARD[key] == ' '
end

def prompt(string)
  puts "==> #{string}"
end

def assign_current_player
  ['player1', 'computer'].sample
end

def rotate_current_player(current_player)
  if current_player == 'player1'
    'computer'
  elsif current_player == 'computer'
    'player1'
  end
end

def current_player_move(board_size, current_player)
  current_mark = EXISTING_PLAYERS[current_player]
  if current_player == 'computer'
    opponent = rotate_current_player(current_player)
    opponent_mark = EXISTING_PLAYERS[opponent]
  end

  choice_key =  case current_player
                when 'player1' then player_move(board_size)
                when 'computer' then computer_move(board_size, current_mark, opponent_mark)
                end
  mark_square(BOARD, choice_key, current_mark)
  REMAINING_BOARD.delete(choice_key)
  return current_player if win?(current_mark)
end


def player_move(board_size)
  update_board_options
  choice_key = ''

  loop do
    prompt "Please select a square from the available options by a number, "\
          "or select the coordinates directly with row-column number pairs\n"
    show_board_options
    choice = gets.chomp
    if valid_integer?(choice)
      choice = choice.to_i - 1
      if choice <= BOARD_OPTIONS.size && choice >= 0
        choice_key = BOARD_OPTIONS[choice]
        break
      end
    elsif valid_array(choice, board_size)
      choice_key = valid_array(choice, board_size)
      if empty_square?(choice_key)
        break
      else
        puts "Please pick an empty square"
        next
      end
    end
    puts "That is not a valid input!"
  end
  choice_key
end


def remaining_spots
  BOARD.values.count(' ')
end




# ======================================
def tic_tac_toe
  round = 1
  winner = ''
  board_size = board_size_num

  set_board(BOARD, board_size)
  set_board(REMAINING_BOARD, board_size)
  puts 'Welcome to a game of Tic-Tac-Toe!'
  set_players_mark
  current_player = assign_current_player

  loop do
    puts "Round #{round}:\n\n"
    puts "You're a #{EXISTING_PLAYERS['player1']}. Computer is a #{EXISTING_PLAYERS['computer']}\n\n"
    display_board(BOARD, board_size) if current_player == 'player1'

    winner = current_player_move(board_size, current_player)
    display_board(BOARD, board_size) if current_player == 'computer'

    unless full_board? || winner
      current_player = rotate_current_player(current_player)
      winner = current_player_move(board_size, current_player)
      current_player = rotate_current_player(current_player)
    end

    case winner
    when 'player1'
      display_board(BOARD, board_size)
      puts "Congratulations! You win the game!\n\n"
      return 'player1'
    when 'computer'
      display_board(BOARD, board_size)
      puts "Sorry, you lost to a PC...\n\n"
      return 'computer'
    end

    if full_board?
      display_board(BOARD, board_size)
      puts "Well, good game everyone. Who'd thought of a tie game in TIC-TAC-TOE?"
      return
    end
    round += 1
    system("clear") || system("cls")
  end
end

# ============================
BOARD = {}
REMAINING_BOARD = {}
BOARD_OPTIONS = []
EXISTING_PLAYERS = {}
player_wins = 0
pc_wins = 0

loop do
  BOARD.clear
  REMAINING_BOARD.clear
  winner = tic_tac_toe
  case winner
  when 'player1' then player_wins += 1
  when 'computer' then pc_wins += 1
  end

  puts "Player score: #{player_wins}. Computer score: #{pc_wins}\n\n"
  if player_wins == 5
    puts "Congratulation, you win the touranment!\n\n"
    break
  elsif pc_wins == 5
    puts "The computer wins the tournament, too bad...\n\n"
    break
  end

  answer = ''
  loop do
    prompt "Do you want to play again? [y/n]"
    answer = gets.chomp
    break if %w(y n).include?(answer[0, 1].downcase)
    puts "Please enter a valid input"
  end
  break if answer[0] == 'n'
end

puts "Thank you for playing the game! Goodbye!"
