require 'yaml'

MESSAGES = YAML.load_file('lizard_spock_messages.yml')

VALID_CHOICES = %w(rock paper scissors lizard Spock)
# For when user specify with just one character
VALID_CHOICES_INITIALS = MESSAGES["VALID_CHOICES_INITIALS"]

# Messages for user prompt
def prompt(message)
  puts "=> #{message}"
end

# List the available moves
def list_choices
  VALID_CHOICES.each_with_index do |val, idx|
    puts "#{idx+1}. #{val}"
  end
end

# Determine if the user input a valid number move, or a valid string move
def valid_choice(input)
  matched = /^\d$/.match(input)
  if matched
    number = input.to_i
    if number <= VALID_CHOICES.size && number > 0
      return lookup_choice(number)
    end
  elsif input[0] == 'S'
    return 'Spock'
  elsif VALID_CHOICES_INITIALS.key?(input.downcase)
    return VALID_CHOICES_INITIALS[input.downcase]
  end
  false
end

# Lookup for when user input a number as a move
def lookup_choice(number)
  VALID_CHOICES[number - 1]
end

# Display who wins the round
def display_results(player, computer)
  if win?(player, computer)
    puts "You win!"
    result_prompt(player, computer)
  elsif win?(computer, player)
    puts "You lose!"
    result_prompt(computer, player)
  else
    puts "It's a tie!"
  end
end

# Determines who wins the round
def win?(player1, player2)
  # using a hash, with keys that correspond to the first player's move, and its values as arrays that contain the losing moves if player2 picked them
  conditions = { "scissors" => %w(paper lizard), "paper" => %w(rock Spock), "rock" => %w(lizard scissors),
                 "lizard" => %w(Spock paper), "Spock" => %w(scissors rock) }
  return true if conditions[player1].include?(player2)
  false
end

# Display specific verbs to use depending on the player's moves
def result_prompt(player1, player2)
  puts "#{player1.capitalize} #{MESSAGES['verbs'][[player1, player2]]} #{player2}!\n\n"
end

# Clear console after each round
def clear_console
  system("cls") || system("clear")
end 

# check if game should end
def end_game?
  if SCORES[:Player] >= 5
    puts "You become the grand champion!"
    return true
  elsif SCORES[:Computer] >= 5
    puts "You have lost the tournament."
    return true
  end
  false
end

# initialize score trackers
SCORES = { Round: 1, Player: 0, Computer: 0 }

loop do
  # list the possible moves for a player to pick
  puts("Round #{SCORES[:Round]}:\n\n")
  prompt("Please select a move from the list: [Can select number options, full name, or first letter, except ss or Spock]")
  list_choices
  # get moves from user and for computer
  user_choice = ''
  loop do
    answer = gets.chomp
    user_choice = valid_choice(answer)
    if user_choice
      break
    else
      prompt("That is not a valid move, pick again")
    end
  end

  computer_choice = VALID_CHOICES.sample
  
  puts "\nYou picked #{user_choice}; Computer picked #{computer_choice}"
  display_results(user_choice, computer_choice)

  # update the scores
  win?(user_choice, computer_choice) ? SCORES[:Player] += 1 : SCORES[:Computer] += 1
  puts "Player scores: #{SCORES[:Player]}; Computer scores: #{SCORES[:Computer]}\n\n"

  # end the game if someone has scored 5 points
  break if end_game?

  # ask if user wants to play again
  answer = ''
  loop do
    prompt("Do you want to play again? [y/n]")
    answer = gets.chomp
    break if ['y', 'n'].include?(answer.downcase[0])
    puts "That is not a valid option, pick again"
  end
  break unless answer.start_with?('y')
  SCORES[:Round] += 1
  clear_console
end

puts("\nThanks for playing rock, paper, and scissors! Come again!")

