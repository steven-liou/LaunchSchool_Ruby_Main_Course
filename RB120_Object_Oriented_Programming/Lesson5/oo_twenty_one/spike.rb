class Card
  SUITS = ["H", "D", "S", "C"]
  FACES = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def to_s
    "The #{face} of #{suit}"
  end

  def face
    case @face
    when "J" then "Jack"
    when "Q" then "Queen"
    when "K" then "King"
    when "A" then "Ace"
    else
      @face
    end
  end

  def suit
    case @suit
    when "H" then "Hearts"
    when "D" then "Diamonds"
    when "S" then "Spades"
    when "C" then "Clubs"
    end
  end

  def ace?
    face == "Ace"
  end

  def king?
    face == "King"
  end

  def queen?
    face == "Queen"
  end

  def jack?
    face == "Jack"
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = Array.new(52)
    idx = 0
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards[idx] = Card.new(suit, face)
        idx += 1
      end
    end

    scramble!
  end

  def scramble!
    @cards.shuffle!
  end

  def deal_one
    cards.pop
  end
end

module Hand
  def show_hand
    puts "---- #{name}'s Hand ----"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
    puts ""
  end

  def total
    total = preliminary_count

    cards.select(&:ace?).count.times do
      break if total <= 21
      total -= 10
    end
    total
  end

  def preliminary_count
    cards.reduce(0) do |acc, card|
      if card.ace?
        acc + 11
      elsif card.jack? || card.queen? || card.king?
        acc + 10
      else
        acc + card.face.to_i
      end
    end
  end

  def add_card(new_card)
    cards << new_card
  end

  def busted?
    total > 21
  end
end

class Participant
  include Hand

  attr_accessor :name, :cards

  def initialize
    @cards = []
    set_name
  end
end

class Player < Participant
  def set_name
    name = ""
    loop do
      puts "What's your name?"
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, must enter a value."
    end
    self.name = name
  end

  def show_flop
    show_hand
  end
end

class Dealer < Participant
  ROBOTS = ["R2D2", "Hal", "Chappie", "Sonny", "Number 5"]

  def set_name
    self.name = ROBOTS.sample
  end

  def show_flop
    puts "---- #{name}'s Hand ----"
    puts cards.first
    puts " ?? "
    puts ""
  end
end

class TwentyOne
  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def reset
    self.deck = Deck.new
    player.cards.clear
    dealer.cards.clear
  end

  def deal_cards
    2.times do
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
    end
  end

  def show_flop
    player.show_flop
    dealer.show_flop
  end

  def hit_or_stay
    puts "Would you like to (h)it or (s)tay?"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ["h", "s"].include?(answer)
      puts "Sorry,  must enter 'h' or 's'."
    end
    answer
  end

  def player_hit
    player.add_card(deck.deal_one)
    puts "#{player.name} hits!"
    player.show_hand
  end

  def dealer_hit
    puts "#{dealer.name} hits!"
    dealer.add_card(deck.deal_one)
  end

  def player_turn
    puts "#{Player.name}'s turn..."

    loop do
      if hit_or_stay == "s"
        puts "#{player.name} stays!"
        break
      else # show only for hit
        player_hit
        break if player.busted?
      end
    end
  end

  def dealer_turn
    puts "#{dealer.name}'s turn..."

    loop do
      if dealer.total >= 17 && !dealer.busted?
        puts "#{dealer.name} stays!"
        break
      else
        dealer_hit
        break if dealer.busted?
      end
    end
  end

  def show_busted
    if player.busted?
      puts "It looks like #{player.name} busted! #{dealer.name} wins!"
    elsif dealer.busted?
      puts "It looks like #{dealer.name} busted! #{player.name} wins!"
    end
  end

  def show_cards
    player.show_hand
    dealer.show_hand
  end

  def show_result
    if player.total > dealer.total
      puts "It looks like #{player.name} wins!"
    elsif player.total < dealer.total
      puts "It looks like #{dealer.name} wins!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ["y", "n"].include? answer
      puts "Sorry, must be y or n."
    end

    answer == "y"
  end

  def busted_response
    show_busted
    again = play_again?
    reset if again
    again
  end

  def starting_hands
    deal_cards
    show_flop
  end

  def round_ends
    show_cards
    show_result
  end

  def start
    puts "Welcome to a game of twenty_one!"
    exec_round
    puts "Thank you for playing Twenty-One. Goodbye!"
  end

  def exec_round
    loop do
      system("clear")
      starting_hands

      player_turn
      dealer_turn unless player.busted?
      again = busted_response if player.busted? || dealer.busted?
      next if again

      # both stayed
      round_ends
      play_again? ? reset : break
    end
  end
end

game = TweentyOne.new
game.start
