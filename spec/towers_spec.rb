require 'towers'
describe Game do
  let(:discs) { 3 }
  subject(:game) { Game.new(discs) }

  describe '#initialize' do
    it "sets three piles" do
      expect(game.piles.length).to eq(3)
    end

    it "fills the first pile with all the discs" do
      expect(game.piles[0].length).to eq(discs)
    end

    it "leaves the other two piles empty" do
      expect(game.piles[1]).to be_empty
      expect(game.piles[2]).to be_empty
    end
  end

  describe '#parse' do
    it 'returns an array of integers' do
      expect(game.parse("1,2")).to eq([1,2])
    end
  end

  describe '#move' do
    before(:each) {game.move([0, 1])}

    it "removes top disc from start position" do
      expect(game.piles[0]).to eq([3, 2])
    end

    it "adds disc to top of end position" do
      expect(game.piles[1]).to eq([1])
    end

    it "rejects invalid moves" do
      expect { game.move([5, 0]) }.to raise_error("invalid starting pile")
      expect { game.move([0, 5]) }.to raise_error("invalid ending pile")
    end

    it "doesn't let you put a larger disc on a smaller disc" do
      expect { game.move([0, 1]) }.to raise_error("NO BIG DISCS ON SMALLER DISCS")
    end

    it "doesn't let you move a nonexistant disc" do
      expect { game.move([2, 1]) }.to raise_error("No disc to move")
    end

  end

  describe '#won?' do
    let (:game_for_wonners) {Game.new(2)}
    it 'returns true if all disks in last pile' do
      game_for_wonners.move([0,1])
      game_for_wonners.move([0,2])
      game_for_wonners.move([1,2])
      expect(game_for_wonners.won?).to be true
    end

    it 'returns false otherwise' do
      expect(game_for_wonners.won?).to be false
    end
  end

end
