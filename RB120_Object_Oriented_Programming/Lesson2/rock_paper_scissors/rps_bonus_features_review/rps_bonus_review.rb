module UserInterface
  def prompt(string)
    puts(">> " + string)
  end

  def self.prompt(string)
    puts(">> " + string)
  end
end

module Rules
end

class Move
  include Rules
  attr_reader :value

  DISPLAY_VALUES = { "rock" => "rock", "paper" => "paper",
                     "scissors" => "scissors",
                     "lizard" => "lizard", "spock" => "Spock" }

  VALUES = ["rock", "paper", "scissors", "lizard", "spock"]

  WIN_CONDITIONS = { "rock" => ["scissors", "lizard"],
                     "paper" => ["rock", "spock"],
                     "scissors" => ["paper", "lizard"],
                     "lizard" => ["paper", "spock"],
                     "spock" => ["rock", "scissors"] }

  LOSE_CONDITIONS = { "rock" => ["paper", "spock"],
                      "paper" => ["scissors", "lizard"],
                      "scissors" => ["rock", "spock"],
                      "lizard" => ["scissors", "rock"],
                      "spock" => ["paper", "lizard"] }

  def initialize(value)
    @value = value
  end

  def >(other_move)
    WIN_CONDITIONS[@value].include?(other_move.value)
  end

  def <(other_move)
    LOSE_CONDITIONS[@value].include?(other_move.value)
  end

  def to_s
    @value
  end
end

class Player
  include UserInterface
  attr_accessor :points, :move_history
  attr_reader :move, :name
  def initialize
    @points = 0
    @move_history = []
  end
end

class Human < Player
  def initialize(name)
    super()
    @name = name
  end

  def move=(choice)
    @move = Move.new(choice)
    move_history << choice
  end
end

class Computer < Player
  attr_writer :move

  def initialize
    super
    @name = random_name
  end

  def random_name
    ["R2D2", "He1", "Chappie", "Sonny", "Number 5"].sample
  end

  def random_choice
    choice = case @name
             when "R2D2" then r2d2_choice
             when "He1" then he1_choice
             when "Chappie" then chappie_choice
             when "Sonny" then sonny_cohice
             when "Number 5" then number5_choice
             end
    self.move = Move.new(choice)
  end

  def r2d2_choice
    "rock"
  end

  def he1_choice
    ["scissors", "paper"].sample
  end

  def chappie_choice
    (Move::VALUES + ["rock", "paper"] * 2).sample
  end

  def sonny_cohice
    (Move::VALUES + ["spock"] * 3).sample
  end

  def number5_choice
    ["lizard", "spock"].sample
  end
end

class RPSGame
  include UserInterface

  MATCHPOINT = 10
  attr_accessor :human, :computer

  def self.input_valid_name
    name = ""
    loop do
      UserInterface.prompt "What is your name?"
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, must enter a value."
    end
    name
  end

  def self.input_valid_move
    choice = nil
    loop do
      UserInterface.prompt "Please choose rock, paper, scissors, lizard, or Spock:"
      choice = gets.chomp.downcase
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    choice
  end

  def initialize
    @human = Human.new(RPSGame.input_valid_name)
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!\n\n"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts
    puts "#{human.name} chose #{Move::DISPLAY_VALUES[human.move.value]}."
    puts "#{computer.name} chose #{Move::DISPLAY_VALUES[computer.move.value]}."\
         "\n\n"
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
    puts "#{computer.name} has #{computer.points} points.\n\n"
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
    answer = ""
    loop do
      prompt "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ["y", "n"].include? answer.downcase
      puts "Sorry, must be 'y' or 'n'"
    end

    return false if answer.downcase == "n"
    return true if answer.downcase == "y"
  end

  def run_round
    display_moves
    determine_winner
    display_player_points
  end

  def play
    display_welcome_message

    loop do
      human.move = RPSGame.input_valid_move
      computer.random_choice
      run_round
      break unless player_won? || play_again?
      system("clear") || system("cls")
    end

    display_goodbye_message
  end
end



system("clear") || system("cls")
RPSGame.new.play
