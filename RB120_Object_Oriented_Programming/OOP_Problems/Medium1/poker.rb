class PokerHand
  attr_reader :hand

  def initialize(deck)
    @hand = []
    if deck.is_a?(Array)
      @hand = deck
    else
      5.times { @hand << deck.draw }
    end
    @hand.sort!
  end

  def print
    puts hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    hand.reduce(0) {|acc, card| acc + card.rank_value} == 60 && flush?
  end

  def straight_flush?
    straight? && flush?
  end

  def n_of_a_kind?(number)
    hand_groups = hand.group_by { |card| card.rank_value }
    hand_groups.any? {|_, group| group.size == number }
  end

  def four_of_a_kind?
    n_of_a_kind?(4)
  end

  def full_house?
    hand_groups = hand.group_by { |card| card.rank_value }
    hand_groups.any? {|_, group| group.size == 3 } &&
      hand_groups.any? {|_, group| group.size == 2 }
  end

  def flush?
    hand_groups = hand.group_by { |card| card.suit_value }
    hand_groups.any? {|_, group| group.size == 5 }
  end

  def straight?
    consecutive_count = 0
    checks_num = hand.size - 1
    checks_num.times do |index|
      if hand[index + 1].rank_value - hand[index].rank_value == 1
        consecutive_count += 1
      else
        break
      end
    end
    consecutive_count == checks_num
  end

  def three_of_a_kind?
    n_of_a_kind?(3)
  end

  def two_pair?
    hand_groups = hand.group_by { |card| card.rank_value }
    hand_groups.count {|_, group| group.size == 2 } == 2
  end

  def pair?
    n_of_a_kind?(2)
  end
end


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


  def <=>(other_card)
    value <=> other_card.value
  end

  def value
    rank_value + suit_value
  end

  def rank_value
    RANK_VALUES.fetch(rank, rank)     # fetch the value from the hash, if not found, use the current card's face value
  end

  def suit_value
    SUIT_VALUES[suit]
  end

  protected
  def to_s
    "#{rank} of #{suit}"
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
# class Array
#   alias_method :draw, :pop
# end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'
