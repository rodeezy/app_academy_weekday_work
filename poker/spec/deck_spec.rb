require 'deck'

describe Deck do

  subject(:deck) { Deck.new }

  describe '#initialize' do
    it "should set a deck of 52 cards" do
      expect(deck.pile.length).to eq(52)
      expect(deck.pile.all? { |card| card.is_a? Card }).to be true
    end

    it "contains 4 aces" do
      expect(deck.pile.select { |card| card.value == "A" }.length).to eq(4)
    end

    it "contains 13 hearts" do
      expect(deck.pile.select { |card| card.suit == :hearts }.length).to eq(13)
    end
  end

  describe "#deal_cards" do
    let(:player1) { double("player1", :cards => []) }
    before(:each) { deck.deal_cards(player1, 5) }

    it "deals cards to the correct player" do
      expect(player1.cards.length).to eq(5)
    end

    it "removes the right amount of cards from the pile after they've been dealt" do
      expect(deck.pile.length).to eq(47)
    end
  end
end
