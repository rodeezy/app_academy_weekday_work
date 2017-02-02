require 'card'

describe Card do
  subject(:card) { Card.new(2,:spades)}
  describe '#initialize' do
    it 'sets a value' do
      expect(card.value).to eq(2)
    end

    it 'sets a suit' do
      expect(card.suit).to eq(:spades)
    end
  end
end
