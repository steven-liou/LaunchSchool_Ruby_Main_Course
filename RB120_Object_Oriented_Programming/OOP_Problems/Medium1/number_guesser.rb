class GuessingGame
  MAX_GUESSES = 7
  RANGE = 1..100

  RESULT = {
    low: "Your guess is too low.",
    high: "Your guess is too high.",
    match: "That's the number!"
  }.freeze

  WIN_OR_LOSE = {
    high: :lose,
    low: :lose,
    match: :win
  }.freeze

  RESULT_OF_GAME_MESSAGE = {
    win: "You won!",
    lose: "You have no more guesses. You lost!"
  }.freeze

  attr_reader :target_number

  def initialize
    @target_number = nil
  end

  def play
    reset_game
    result = play_game
    display_game_end_message(result)
  end

  private

  def reset_game
    @target_number = rand(RANGE)
  end

  def play_game
    result = nil
    MAX_GUESSES.downto(1) do |remaining_guesses|
      puts "You  have #{remaining_guesses} guesses remaining."
      guess = user_guess
      result = check_guess(target_number, guess)
      puts RESULT[result]
      break if result == :match
    end
    WIN_OR_LOSE[result]
  end

  def user_guess
    choice = ''
    loop do
      print "Enter a number between #{RANGE.first} and #{RANGE.last}: "
      choice = gets.chomp
      break if valid_guess?(choice)
      print "Invalid guess. "
    end
    choice.to_i
  end

  def valid_guess?(string)
    return false unless valid_integer?(string)
    (RANGE.first..RANGE.last).cover?(string.to_i)
  end

  def valid_integer?(string)
    string =~ /\A\d+\z/
  end

  def check_guess(target, guess)
    if guess < target
      return :low
    elsif guess > target
      return :high
    end
    :match
  end

def display_game_end_message(result)
  puts RESULT_OF_GAME_MESSAGE[result]
end

end


game = GuessingGame.new
game.play