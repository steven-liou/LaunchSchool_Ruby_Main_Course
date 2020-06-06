class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @deck = []
    reset
  end

  def draw
    reset if deck.empty?
    deck.pop
  end

  private
  attr_reader :deck

  def reset
    fill_deck
    shuffle_deck
  end

  def fill_deck
    SUITS.each do |suit|
      RANKS.each do |rank|
        deck << Card.new(rank, suit)
      end
    end
  end

  def shuffle_deck
    deck.shuffle!
  end

end

class Card
  RANK_VALUES = {"Jack" => 11, "Queen" => 12, "King" => 13, "Ace" => 14}
  SUIT_VALUES = {"Diamonds" => 0, "Clubs" => 0.25, "Hearts" => 0.5, "Spades" => 0.75}
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def ==(other_card)
    rank == other_card.rank
  end

  protected

  def <=>(other_card)
    (rank_value <=> other_card.rank_value) + (suit_value <=> other_card.suit_value)
  end

  def rank_value
    RANK_VALUES.fetch(rank, rank)     # fetch the value from the hash, if not found, use the current card's face value
  end

  def suit_value
    SUIT_VALUES[suit]
  end

  def to_s
    "#{rank} of #{suit}"
  end
end



deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13


drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always