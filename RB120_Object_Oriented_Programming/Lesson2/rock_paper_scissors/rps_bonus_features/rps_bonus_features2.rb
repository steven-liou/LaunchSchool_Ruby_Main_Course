# Adding a class for each move is a bit redundent because the moves all share the same behaviors. They need to be able to compare values with each other, and are more like attributes and belong to the same class. To initialize the user's choice to instantiate a specific move class also adds extra case statements that are not necessary.


module Rules
  WIN_CONDITIONS = { 'rock' => ['scissors', 'lizard'],
                     'paper' => ['rock', 'Spock'],
                     'scissors' => ['paper', 'lizard'],
                     'lizard' => ['paper', 'Spock'],
                     'Spock' => ['rock', 'scissors'] }

  LOSE_CONDITIONS = { 'rock' => ['paper', 'Spock'],
                      'paper' => ['scissors', 'lizard'],
                      'scissors' => ['rock', 'Spock'],
                      'lizard' => ['scissors', 'rock'],
                      'Spock' => ['paper', 'lizard'] }
end

class Move
  include Rules
  VALUES = ["rock", "paper", "scissors", 'lizard', 'Spock']

  def >(other_move)
    WIN_CONDITIONS[@value].include?(other_move.value)
  end

  def <(other_move)
    LOSE_CONDITIONS[@value].include?(other_move.value)
  end

  def to_s
    @value
  end

  protected

  attr_reader :value
end

class Rock < Move
  def initialize
    @value = 'rock'
  end
end

class Paper < Move
  def initialize
    @value = 'paper'
  end
end

class Scissors < Move
  def initialize
    @value = 'scissors'
  end
end

class Lizard < Move
  def initialize
    @value = 'lizard'
  end
end

class Spock < Move
  def initialize
    @value = 'Spock'
  end
end

class Player
  attr_accessor :move, :name, :points

  def initialize
    set_name
    @points = 0
  end

  def choose_move(move)
    case move
    when 'rock'     then Rock.new
    when 'paper'    then Paper.new
    when 'scissors' then Scissors.new
    when 'lizard'   then Lizard.new
    when 'Spock'    then Spock.new
    end
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What is your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts 'Please choose rock, paper, scissors, lizard, or Spock:'
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = choose_move(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'He1', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = choose_move(Move::VALUES.sample)
  end
end

class RPSGame
  MATCHPOINT = 10
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def determine_winner
    if human.move > computer.move
      human.points += 1
    elsif human.move < computer.move
      computer.points += 1
    end
  end

  def display_player_points
    if human.points < MATCHPOINT && computer.points < MATCHPOINT
      display_round_winner
      display_round_points
    else
      display_game_winner
    end
  end

  def display_round_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_round_points
    puts "#{human.name} has #{human.points} points."
    puts "#{computer.name} has #{computer.points} points."
  end

  def display_game_winner
    if human.points == MATCHPOINT
      puts "#{human.name} has won the game!"
    else
      puts "#{computer.name} has won the game!"
    end
  end

  def player_won?
    human.points == MATCHPOINT || computer.points == MATCHPOINT
  end

  def play_again?
    answer = ''
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be 'y' or 'n'"
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      determine_winner
      display_player_points
      break unless player_won? || play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
