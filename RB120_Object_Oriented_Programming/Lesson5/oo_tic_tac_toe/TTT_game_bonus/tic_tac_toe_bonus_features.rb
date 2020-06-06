module UI
  def clear_screen
    system("clear") || system("cls")
  end

  def prompt(message)
    puts ">> #{message}"
  end

  def quit_prompt?(choice)
    !!choice.match(/^q$/i)
  end

  def invalid_input
    puts "Sorry, that is not a valid input"
  end

  def valid_number?(string)
    !!string.match(/^\d+$/)
  end

  def joinor(array, delimiter = ", ", conj = "or")
    case array.size
    when 0 then ""
    when 1 then array.first
    when 2 then array.join(" #{conj} ")
    else
      array[-1] = "#{conj} #{array.last}"
      array.join(delimiter)
    end
  end
end

class Board
  attr_reader :size, :winning_lines, :squares

  def initialize(size)
    @squares = Hash.new
    @size = size
    @winning_lines = set_winning_lines
    reset
  end

  def reset
    (size**2).times do |idx|
      @squares[idx + 1] = Square.new
    end
  end

  def [](key)
    @squares[key]
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def marked_keys
    @squares.keys.select { |key| @squares[key].marked? }
  end

  def draw
    horizontal_divider = (["-----"] * size).join("+")
    size.times do |row_idx|
      print_columns(row_idx)
      puts horizontal_divider unless row_idx == size - 1
    end
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    winning_lines.each do |line|
      marks = squares.values_at(*line)
      return marks.first.marker if three_identical_markers(marks)
    end
    nil
  end

  def winning_diagonals?(line)
    set_winning_diagonals.include?(line)
  end

  private

  def print_columns(row_idx)
    horizontal_spaces = (["     "] * size).join("|")
    3.times do |grid_row_idx|
      if grid_row_idx == 1
        print_marks(row_idx)
      else
        puts horizontal_spaces
      end
    end
  end

  def print_marks(row_idx)
    grid_array = Array.new(size) { [] }
    size.times do |col_idx|
      marker_index = row_idx * size + col_idx + 1
      grid_array[col_idx] = "  #{@squares[marker_index]}  "
    end
    puts grid_array.join("|")
  end

  def three_identical_markers(marks)
    connect = marks.all?(&:marked?)
    return marks.map(&:marker).uniq.size == 1 if connect
  end

  def set_winning_lines
    set_winning_rows + set_winning_columns + set_winning_diagonals
  end

  def set_winning_rows
    Array.new(size) do |row|
      (1..size).map do |col|
        row * size + col
      end
    end
  end

  def set_winning_columns
    Array.new(size) do |col|
      (0...size).map do |row|
        col + 1 + (row * size)
      end
    end
  end

  def set_winning_diagonals
    diagonals = Array.new(2) do
      Array.new(size) { [] }
    end

    (0...size).each do |row|
      diagonals[0][row] = row * size + 1 + row
      diagonals[1][row] = size * (row + 1) - row
    end

    diagonals
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
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
  attr_accessor :score, :marker

  def initialize(marker)
    @marker = marker
    @score = 0
  end

  def score_reset
    self.score = 0
  end

  def to_s
    "Human"
  end
end

class Computer < Player
  attr_accessor :difficulty

  def initialize(marker, difficulty=1)
    super(marker)
    @difficulty = difficulty
  end

  def to_s
    "Computer"
  end
end

class Options
  include UI

  MARKER_CHOICES = ["X", "O"]
  START_PLAYER_CHOICES = ["First", "Second"]
  DIFFICULTY = { 1 => "Easy", 2 => "Medieum", 3 => "God" }

  attr_accessor :game_points, :board_size, :human, :computer,
                :start_player

  def initialize
    @game_points = 5
    @board_size = 3
    @human = Player.new("X")
    difficulty = 3
    @computer = Computer.new("O", difficulty)
    @start_player = computer
  end

  def reset_options
    self.game_points = 5
    self.board_size = 3
    human.marker = "X"
    computer.marker = "O"
    self.start_player = human
  end

  def set_game_points
    points = nil
    loop do
      prompt "Enter number of points to win [A number >=1, q to return]"
      points = gets.chomp
      return if quit_prompt?(points)
      break if valid_number?(points) && points.to_i >= 1
      puts "Sorry, that is not a valid number"
    end
    self.game_points = points.to_i
  end

  def set_board_size
    choice = nil
    loop do
      prompt "Set board size [A number between 3~10, q to return]"
      choice = gets.chomp
      return if quit_prompt?(choice)
      break if valid_board_size?(choice)
      puts "Sorry, that is not a valid number"
    end
    self.board_size = choice.to_i
  end

  def valid_board_size?(choice)
    valid_number?(choice) && choice.to_i.between?(3, 10)
  end

  def set_players_markers
    choice = nil
    loop do
      display_player_marker_prompt
      choice = gets.chomp
      return if valid_number?(choice) && choice == "4" ||
                choice.capitalize == "Return"
      break if valid_marker_selection?(choice)
      invalid_input
    end
    human.marker, computer.marker = determine_players_markers(choice)
  end

  def display_player_marker_prompt
    prompt "Please select whether you want Tic or Tac "\
           "[Pick a number or type the selections]\n1. X\n2. O\n3. Random\n"\
           "4. Return"
  end

  def valid_marker_selection?(choice)
    valid_number?(choice) && choice.to_i.between?(1, 3) ||
      (MARKER_CHOICES + ["Random"]).include?(choice.capitalize)
  end

  def determine_players_markers(choice)
    case choice.capitalize
    when "1", "X"
      ["X", "O"]
    when "2", "O"
      ["O", "X"]
    when "3", "Random"
      ["X", "O"].sample(2)
    end
  end

  def set_round_start_player
    choice = nil
    loop do
      display_start_player_prompt
      choice = gets.chomp
      return if valid_number?(choice) && choice == "4" ||
                choice.capitalize == "Return"
      break if valid_start_player?(choice)
      invalid_input
    end
    self.start_player = determine_start_player(choice)
  end

  def valid_start_player?(choice)
    valid_number?(choice) && choice.to_i.between?(1, 3) ||
      (START_PLAYER_CHOICES + ["Random"]).include?(choice.capitalize)
  end

  def display_start_player_prompt
    prompt "Please select you want to go first, second, or random " \
    "[Pick a number or type the selection]:\n1. First\n2. Second\n"\
    "3. Random\n4. Return"
  end

  def determine_start_player(choice)
    case choice.capitalize
    when "1", "First"
      human
    when "2", "Second"
      computer
    when "3", "Random"
      [human, computer].sample
    end
  end

  def set_computer_difficulty
    choice = nil
    loop do
      display_computer_difficulty_prompt
      choice = gets.chomp
      return if valid_number?(choice) && choice == "5" ||
                choice.capitalize == "Return"
      break if valid_computer_difficulty?(choice)
      invalid_input
    end
    computer.difficulty = determine_computer_difficulty(choice)
  end

  def display_computer_difficulty_prompt
    prompt "Please select computer difficulty level "\
    "[Pick a number or type the selection]:\n"\
    "1. Easy\n2. Medium\n3. God\n4. Random\n5. Return"
  end

  def valid_computer_difficulty?(choice)
    valid_number?(choice) && choice.to_i.between?(1, 4) ||
      (DIFFICULTY.values + ["Random"]).include?(choice.capitalize)
  end

  def determine_computer_difficulty(choice)
    case choice.capitalize
    when "1", "Easy"
      1
    when "2", "Medieum"
      2
    when "3", "God"
      3
    when "4", "Random"
      (1..3).to_a.sample
    end
  end
end

class TTRGame
  include UI

  GAME_MENU =  { ["1", "Reset Default"] => "reset_options", ["2", "Game Points"] => "set_game_points",
    ["3", "Board Size"] => "set_board_size", ["4", "Player Marker"] => "set_players_markers",
    ["5", "Start Player"] => "set_round_start_player", ["6", "Difficulty"] => "set_computer_difficulty"}
  attr_accessor :game_options

  def initialize
    @game_options = Options.new
  end

  def start
    display_welcome_message
    loop do
      option_menu if set_options?
      GamePlay.new(game_options).play
      break unless play_again?
      reset_player_scores
    end
    display_goodbye_meesage
  end

  private

  def display_welcome_message
    clear_screen
    puts "Welcome to Tic Tac Toe!\n\n"
  end

  def display_goodbye_meesage
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def set_options?
    choice = nil
    loop do
      prompt "Do you want to see game option menu? [y/n]"
      choice = gets.chomp.downcase
      break if %w(y n).include?(choice)
    end
    choice == "y"
  end

  def option_menu
    loop do
      display_game_options
      choice = gets.chomp
      break if quit_game_options(choice)
      clear_screen
      choose_game_options(choice)
    end
  end

  def display_game_options
    prompt "Please pick a game option you want to change "\
           "[Pick a number or input option]:\n1. Reset Default\n"\
           "2. Game Points [Current is #{game_options.game_points} to win]\n"\
           "3. Board Size [Current is #{game_options.board_size}]\n"\
           "4. Player Marker [Your current marker is "\
           "#{game_options.human.marker}]\n"\
           "5. Start Player [Current is #{game_options.start_player}]\n"\
           "6. Computer difficulty [Current is "\
           "#{Options::DIFFICULTY[game_options.computer.difficulty]}]\n"\
           "7. Quit"
  end


  def choose_game_options(choice)
    option = GAME_MENU.select { |key,_| key.include?(choice) }.values.first
    if option
      game_options.send(option)
    else
      puts "Please input a valid option.\n\n"
    end
  end



  def quit_game_options(choice)
    choice.capitalize == "Quit" || quit_prompt?(choice) || choice == "7"
  end

  def play_again?
    answer = nil
    loop do
      prompt "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, must be y or n"
    end

    answer == "y"
  end

  def reset_player_scores
    game_options.human.score_reset
    game_options.computer.score_reset
  end
end

class GamePlay
  include UI

  def initialize(game_options)
    @board = Board.new(game_options.board_size)
    @human = game_options.human
    @computer = game_options.computer
    @start_player = game_options.start_player
    @current_player = @start_player
    @game_points = game_options.game_points
    @round = 1
  end

  def play
    loop do
      exec_round
      break if game_winner?
      return unless next_round?
      round_reset
    end
    display_game_winner_message
  end

  private

  def exec_round
    clear_screen_and_display_board
    loop do
      current_player_moves
      break if board.full? || board.someone_won?
      clear_screen_and_display_board if human_turn?
    end
    display_result unless game_winner?
  end

  def display_round_message
    puts "Round #{round}:\n\n"
  end

  def display_play_again_message
    puts "Let's play again!\n\n"
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
    clear_screen_and_display_board
    display_round_result
    puts
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
    puts "You won!" if human.score < game_points
  end

  def display_computer_win_message
    puts "Computer won!" if computer.score < game_points
  end

  def display_game_winner_message
    if human.score == game_points
      puts "Congradulation!!! You win a Tic Tac Toc best of #{game_points}!"
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
    self.round += 1 if current_player == start_player
  end

  def rotate_player
    case current_player
    when human then self.current_player = computer
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
      prompt("Specify [row, col pair] or choose a square to place a piece "\
      "(#{joinor(board.unmarked_keys)}): ")
      choice = gets.chomp.strip
      square = get_square(choice)
      break if board.unmarked_keys.include?(square)
      invalid_input
    end
    board[square] = human.marker
  end

  def get_square(choice)
    return unless choice.match(/^\d/)

    num_str_arr = choice.split(/\D+/)
    num_str_arr.delete("")
    if num_str_arr.size >= 2
      numbers = num_str_arr.first(2).map(&:to_i)
      (numbers.first - 1) * board.size + numbers.last
    else
      num_str_arr.first.to_i
    end
  end

  def computer_moves
    square = offense_or_defense unless computer.difficulty < 2
    square = best_move unless computer.difficulty < 3 || square
    board[board.unmarked_keys.sample] = computer.marker unless square
  end

  def best_move
    evaluated_squares_hash = evaluate_square.select do |key, _|
      board[key].unmarked?
    end
    grouped_square_values = evaluated_squares_hash.group_by { |_, val| val }
    best_square_values = grouped_square_values.max
    random_best_square = best_square_values.last.sample.first
    board[random_best_square] = computer.marker
    random_best_square
  end

  def create_board_values_hash
    board_square_values = Hash.new
    (1..board.size**2).each { |key| board_square_values[key] = 0 }
    board_square_values
  end

  def evaluate_square
    board_square_values = create_board_values_hash
    board.winning_lines.each do |line|
      line.each do |key|
        calculate_values(board_square_values, line, key)
      end
    end
    board_square_values
  end

  def calculate_values(board_square_values, line, key)
    calculate_open_spots(board_square_values, line, key)
    calculate_computer_spots(board_square_values, line, key)
    calculate_human_spots(board_square_values, line, key)
  end

  def calculate_open_spots(board_square_values, line, key)
    board_square_values[key] += line.count do |line_key|
      board[line_key].marker == Square::INITIAL_MARKER
    end
  end

  def calculate_computer_spots(board_square_values, line, key)
    points = 2 * line.count do |line_key|
      board[line_key].marker == computer.marker
    end
    board_square_values[key] += points
  end

  def calculate_human_spots(board_square_values, line, key)
    points = 0

    line.each do |line_key|
      if board[line_key].marker == human.marker
        points += 1
        points += 1 if !board.winning_diagonals?(line)
      end
    end
    board_square_values[key] -= points
  end

  def offense_or_defense
    square = offensive_square
    board[square] = computer.marker if square

    square = defensive_square unless square
    board[square] = computer.marker if square
    square
  end

  def offensive_square
    profit = nil
    board.winning_lines.each do |line|
      profit = danger_square(line, computer.marker)
      return(profit) if profit
    end
    nil
  end

  def defensive_square
    risk = nil
    board.winning_lines.each do |line|
      risk = danger_square(line, human.marker)
      return(risk) if risk
    end
    nil
  end

  def danger_square(line, marker)
    line_hash = board.squares.select { |key, _| line.include?(key) }
    enemy_squares = line_hash.count { |_, square| square.marker == marker }
    determine_danger_square(line_hash) if line_hash &&
                                          enemy_squares == board.size - 1
  end

  def determine_danger_square(line_hash)
    spot = line_hash.select do |_, square|
      square.marker == Square::INITIAL_MARKER
    end
    spot.keys.first
  end

  def next_round?
    answer = nil
    loop do
      prompt "Continue to next round? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, must be y or n"
    end

    answer == "y"
  end

  def round_reset
    board.reset
    self.current_player = start_player
    clear_screen
    self.round = 1
  end

  def game_winner?
    human.score == game_points || computer.score == game_points
  end

  private
  attr_reader :board, :human, :computer, :game_points, :start_player
  attr_accessor :current_player, :round
end

# Start the game by instantiating a game object and invoke its run engine method
TTRGame.new.start
