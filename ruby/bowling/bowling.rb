class Game
  def roll(pins)
    tally << pins
  end

  def score
    tally.reduce(:+)
  end

  def tally
    @tally ||= []
  end
end
