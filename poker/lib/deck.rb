require_relative 'card'

class Deck
  attr_reader :pile

  VALUES = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
  SUITS = [:spades, :hearts, :diamonds, :clubs]

  def initialize(pile=[])
    @pile = pile
    setup.shuffle
  end

  def setup
    SUITS.each do |suit|
      VALUES.each do |value|
        @pile << Card.new(value, suit)
      end
    end
  end

  def deal_cards
    # keeps track of which cards have been dealt
    # remove
  end


end
