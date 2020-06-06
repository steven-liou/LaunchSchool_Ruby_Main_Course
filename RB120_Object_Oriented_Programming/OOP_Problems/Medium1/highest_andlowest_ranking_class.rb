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


cards = [Card.new(2, 'Hearts'),
  Card.new(10, 'Diamonds'),
  Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
  Card.new(4, 'Diamonds'),
  Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
  Card.new('Jack', 'Diamonds'),
  Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
  Card.new(8, 'Clubs'),
  Card.new(8, 'Spades')]
puts cards.min
puts cards.max