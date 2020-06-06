class GuessingGame
  attr_reader :lb, :ub, :guesses
  def initialize(lb, ub)
    @lb = lb
    @ub = ub
    @target_number = generate_target
    @guesses = self.class.number_guesses(lb, ub)
  end

  def self.number_guesses(lb, ub)
    Math.log2(ub - lb).ceil
  end

  def play

    guesses.times do
      guess = guess_prompt
      display_result(guess)
      return if won?(guess)
      @guesses -= 1
    end
    puts "You have no more guesses. You lost!"
  end

  def won?(guess)
    guess == @target_number
  end

  def display_result(guess)
    if too_high?(guess)
      puts "Your guess it too high."
    elsif too_low?(guess)
      puts "Your guess is too low."
    else
      puts "Thtat's the number!"
    end
  end

  def guess_prompt
    puts "You have #{@guesses} guesses remaining."
    choice = nil
    loop do
      print "Enter a number between #{lb} and #{ub}: "
      choice = gets.chomp
      break if valid_number?(choice)
      print "Invalid guess. "
    end
    choice.to_i
  end

  def valid_number?(choice)
    (lb..ub).cover?(choice.to_i)
  end

  def generate_target
    rand(lb..ub)
  end

  def too_high?(guess)
    guess > @target_number
  end

  def too_low?(guess)
    guess < @target_number
  end

end


game = GuessingGame.new(501, 1500)
game.play

