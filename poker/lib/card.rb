class Card
  attr_reader :value, :suit
  VALUES = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
  SUITS = [:spades, :hearts, :diamonds, :clubs]
  def initialize(value, suit) #, deck)
    @value = value
    @suit = suit
  end

end
