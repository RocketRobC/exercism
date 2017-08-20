class Game
  attr_reader :score

  def initialize
    @frame = 0
    @buffer = []
    @score = 0
  end

  def roll(pins)
    @buffer[@frame] ||= []
    @buffer[@frame] << pins
    calculate_score
    @frame += 1 if increment_frame
  end

  private

  def calculate_score
    if @buffer[@frame].size == 1 && spare?(@frame - 1)
      @score += 10 + @buffer[@frame][0]
    elsif strike?(@frame - 1) && !strike?(@frame)
      @score += 10 + @buffer[@frame].reduce(:+)
    elsif strike?(@frame - 1) && strike?(@frame)
      @score += 10 + @buffer[@frame].reduce(:+)
    end
  end

  def strike?(frame)
    @buffer[frame].size == 1 && @buffer[frame].reduce(:+) == 10
  end

  def spare?(frame)
    print @buffer
    @buffer[frame].size == 2 && @buffer[frame].reduce(:+) == 10
  end

  def increment_frame
    (@frame < 10 && (@buffer[@frame].size == 2 || @buffer[@frame].reduce(:+) == 10)) ||
     (@buffer[@frame].size == 2 && @buffer[@frame].reduce(:+) < 10 || @buffer[@frame].size == 3)
  end
end
