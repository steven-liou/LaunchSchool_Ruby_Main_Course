require 'pry'

module UI
  def prompt(message)
    puts ">> #{message}"
  end

  def joinor(array, delimiter=', ', conj='or')
    case array.size
    when 0 then ''
    when 1 then array.first
    when 2 then array.join(" #{conj} ")
    else
      array[-1] = "#{conj} #{array.last}"
      array.join(delimiter)
    end
  end

  def self.randomize_marker
    ['X', 'O'].sample(2)
  end
end

class Board
  attr_reader :board_size, :winning_lines

  def initialize(board_size)
    @squares = Hash.new
    @board_size = board_size
    @winning_lines = set_winning_lines
    reset
  end

  def reset
    (board_size**2).times do |idx|
      @squares[idx + 1] = Square.new
    end
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def draw
    horizontal_divider = (["-----"] * board_size).join('+')
    board_size.times do |row_idx|
      print_columns(row_idx)
      puts horizontal_divider unless row_idx == board_size - 1
    end
  end

  def print_columns(row_idx)
    horizontal_spaces = (["     "] * board_size).join('|')
    3.times do |grid_row_idx|
      if grid_row_idx == 1
        print_marks(row_idx)
      else
        puts horizontal_spaces
      end
    end
  end

  def print_marks(row_idx)
    grid_array = Array.new(board_size) { [] }
    board_size.times do |col_idx|
      marker_index = row_idx * board_size + col_idx + 1
      grid_array[col_idx] = "  #{@squares[marker_index]}  "
    end
    puts grid_array.join('|')
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    winning_lines.each do |line|
      marks = @squares.values_at(*line)
      return marks.first.marker if three_identical_markers(marks)
    end
    nil
  end

  private

  def three_identical_markers(marks)
    connect = marks.all?(&:marked?)
    return marks.map(&:marker).uniq.size == 1 if connect
  end

  def set_winning_lines
    set_winning_rows + set_winning_columns + set_winning_diagonals
  end

  def set_winning_rows
    Array.new(board_size) do |row|
      (1..board_size).map do |col|
        row * board_size + col
      end
    end
  end

  def set_winning_columns
    Array.new(board_size) do |col|
      (0...board_size).map do |row|
        col + 1 + (row * board_size)
      end
    end
  end

  def set_winning_diagonals
    diagonals = Array.new(2) do
      Array.new(board_size) { [] }
    end

    (0...board_size).each do |row|
      diagonals[0][row] = row * board_size + 1 + row
      diagonals[1][row] = board_size * (row + 1) - row
    end

    diagonals
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end
  # maybe a "status" to keep track of this square's mark?

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker
  attr_accessor :score

  def initialize(marker)
    @marker = marker
    @score = 0
  end

  def score_reset
    self.score = 0
  end
end

# orchestratrion engine
class TTTGame
  HUMAN_MARKER, COMPUTER_MARKER = UI.randomize_marker
  GAME_POINT = 5

  include UI

  attr_reader :board, :board_size, :human, :computer
  attr_accessor :current_player, :round

  def initialize(board_size)
    @board_size = board_size
    @board = Board.new(board_size)
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_player = randomize_player
    @round = 1
  end

  def play
    display_welcome_message
    loop do
      exec_game
      break unless play_again?
      game_reset
    end
    display_goodbye_meesage
  end

  private

  def exec_game
    loop do
      exec_round
      break if game_winner?
      break unless next_round?
      self.round += 1
      round_reset
    end
    display_game_winner_message
  end

  def exec_round
    display_board
    loop do
      current_player_moves
      break if board.full? || board.someone_won?
      clear_screen_and_display_board if human_turn?
    end
    display_result unless game_winner?
  end

  def display_welcome_message
    clear_screen
    puts "Welcome to Tic Tac Toe!\n\n"
  end

  def display_round_message
    puts "Round #{round}:\n\n"
  end

  def display_play_again_message
    puts "Let's play again!\n\n"
  end

  def display_goodbye_meesage
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen
    system("clear") || system("cls")
  end

  def display_board
    display_round_message
    puts "You are a #{human.marker}. Computer is a #{computer.marker}."
    puts
    board.draw
    puts
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def display_result
    clear_screen
    display_round_result
    puts "Your score: #{human.score}. Computer score: #{computer.score}"\
    unless game_winner?
    puts
  end

  def display_round_result
    case board.winning_marker
    when human.marker
      human.score += 1
      display_human_win_message
    when computer.marker
      computer.score += 1
      display_computer_win_message
    else
      puts "The board is full!"
    end
  end

  def display_human_win_message
    puts "You won!" if human.score < GAME_POINT
  end

  def display_computer_win_message
    puts "Computer won!" if computer.score < GAME_POINT
  end

  def display_game_winner_message
    if human.score == GAME_POINT
      puts "Congradulation!!! You win a Tic Tac Toc best of #{GAME_POINT}!"
    else
      puts "Sorry, you lost #{human.score} to #{computer.score} "\
      "to a computer..."
    end
    puts
  end

  def current_player_moves
    case current_player
    when human then human_moves
    when computer then computer_moves
    end
    rotate_player
  end

  def rotate_player
    case current_player
    when human    then self.current_player = computer
    when computer then self.current_player = human
    end
  end

  def human_turn?
    current_player == human
  end

  def randomize_player
    [human, computer].sample
  end

  def human_moves
    square = nil
    loop do
      prompt("Choose a square to place a piece "\
      "(#{joinor(board.unmarked_keys)}): ")
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice"
    end
    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def next_round?
    answer = nil
    loop do
      prompt "Continue to next round? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def play_again?
    answer = nil
    loop do
      prompt "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def game_reset
    board.reset
    human.score_reset
    computer.score_reset
    self.round = 1
    self.current_player = randomize_player
    clear_screen
  end

  def round_reset
    board.reset
    self.current_player = randomize_player
    clear_screen
  end

  def game_winner?
    human.score == GAME_POINT || computer.score == GAME_POINT
  end
end

# Start the game by instantiating a game object and invoke its run engine method
n = 3
game = TTTGame.new(n)
game.play
