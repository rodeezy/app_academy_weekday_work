require 'hand'

describe Hand do
  let(:card_one) { double("card", :value => 'A', :suit => :spades)}
  let(:card_two) { double("card", :value => 'K', :suit => :spades)}
  let(:card_three) { double("card", :value => 'Q', :suit => :spades)}
  let(:card_four) { double("card", :value => 'J', :suit => :spades)}
  let(:card_five) { double("card", :value => '10', :suit => :spades)}
  subject(:hand) { Hand.new()}

  describe '#initialize' do
    
    it "takes 5 cards initially" do

    end

  end

end
