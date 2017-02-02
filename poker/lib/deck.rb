require_relative 'card'

class Deck
  attr_reader :pile,

  def initialize(pile=[])
    @pile = pile
    setup
    @pile.shuffle!
  end

  def setup
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        @pile << Card.new(value, suit)
      end
    end
  end

  def deal_cards(player, amount)
    amount.times do
      player.cards << @pile.pop
    end
  end

end
