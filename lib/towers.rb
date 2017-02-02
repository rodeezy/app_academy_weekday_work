class Game
  attr_reader :piles, :discs

  def initialize(discs)
    @discs = discs
    @piles = [(1..discs).to_a.reverse, [], []]
  end

  def play
    #until won?
      puts "make a move"
      user_move = parse(gets.chomp)

      move(user_move)
    #end
  end

  def parse(str)
    str.split(",").map { |el| el.to_i }
  end

  def move(user_move)
    raise "invalid starting pile" unless user_move.first.between?(0, 2)
    raise "invalid ending pile" unless user_move.last.between?(0, 2)

    first_disc = @piles[user_move.first].last
    next_disc = @piles[user_move.last].last

    raise "No disc to move" unless first_disc
    if next_disc
      raise "NO BIG DISCS ON SMALLER DISCS" if first_disc > next_disc
    end

    @piles[user_move.last] << @piles[user_move.first].pop
  end

  def won?
    # returns true if all discs are in piles.last
    return false unless @piles.last == (1..@discs).to_a.reverse
    true
  end
end
