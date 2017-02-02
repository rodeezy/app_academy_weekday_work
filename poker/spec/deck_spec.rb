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

      it "contains 13 of each suit" do
        expect(deck.pile.select { |card| card.suit == :hearts }.length).to eq(13)
      end

      it "shuffles the deck" do
        expect(deck.pile).to_not eq(deck.pile.sort)
      end
  end


end
