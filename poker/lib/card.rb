class Card
  attr_reader :value, :suit
  def initialize(value, suit) #, deck)
    @value = value
    @suit = suit
  end

end
