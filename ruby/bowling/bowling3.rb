class Frame
  def initialize
    @roll1 = nil
    @roll2 = nil
    @extra_roll = nil
  end

  def add_roll(pins)
    if @roll1.nil?
      @roll1 = pins
    elsif @roll2.nil?
      @roll2 = pins
    else
      @extra_roll = pins
    end
  end

  def add_bonus(roll)
    @extra_roll = roll
    self
  end

  def last_frame_complete?
    (!@roll2.nil? && roll1 + roll2 < 10) || !@extra_roll.nil?
  end

  def complete?
    roll1 == 10 || !@roll2.nil?
  end

  def strike?
    roll1 == 10 && @roll2.nil?
  end

  def spare?
    score == 10
  end

  def score
    roll1 + roll2 + extra_roll
  end

  def roll1
    @roll1 || 0
  end

  def valid?(last_frame:)
    return true if last_frame && [roll1, roll2].all? { |r| r == 10 }
    if last_frame && roll1 == 10
      roll2 + extra_roll <= 10
    else
      roll1 + roll2 <= 10
    end
  end

  private

  def roll2
    @roll2 || 0
  end

  def extra_roll
    @extra_roll || 0
  end
end

class ScoreCard
  def initialize
    @frame_scores = []
    @stack = []
  end

  def add(frame:, last_frame:)
    raise Game::BowlingError if @frame_scores.size == 10
    tally_and_calc_frame(frame) if @stack.size == 10
    if last_frame == false && (frame.strike? || frame.spare?)
      @stack << frame
    else
      tally_and_calc_frame(frame)
    end
  end

  def last_frame?
    @frame_scores.size == 9
  end

  def total_score
    raise Game::BowlingError if @frame_scores.size < 10
    @frame_scores.reduce(:+)
  end

  private

  def tally_and_calc_frame(frame)
    @frame_scores << frame.score
    calculate_frame(frame)
  end

  def calculate_frame(frame)
    return if @stack.empty?
    previous_frame = @stack.pop
    if previous_frame.strike?
      add_strike_to_tally(previous_frame, frame)
    elsif previous_frame.spare?
      add_spare_to_tally(previous_frame, frame)
    end
  end

  def add_strike_to_tally(previous_frame, frame)
    @frame_scores << previous_frame.score + frame.score
    calculate_frame(previous_frame.add_bonus(frame.roll1))
  end

  def add_spare_to_tally(previous_frame, frame)
    @frame_scores << previous_frame.score + frame.roll1
    calculate_frame(previous_frame)
  end
end

class Game
  class BowlingError < StandardError; end
  def initialize(frame: Frame.new, score_card: ScoreCard.new)
    @current_frame = frame
    @score_card = score_card
  end

  def roll(pins)
    valid_roll?(pins)
    @current_frame.add_roll(pins)
    if last_frame_complete?
      valid_frame?(last_frame: true)
      @score_card.add(frame: @current_frame, last_frame: true)
    elsif standard_frame_complete?
      valid_frame?(last_frame: false)
      @score_card.add(frame: @current_frame, last_frame: false)
      @current_frame = Frame.new
    end
  end

  def score
    @score_card.total_score
  end

  private

  def last_frame_complete?
    @score_card.last_frame? && @current_frame.last_frame_complete?
  end

  def standard_frame_complete?
    !@score_card.last_frame? && @current_frame.complete?
  end

  def valid_roll?(pins)
    raise BowlingError unless (0..10).cover?(pins)
  end

  def valid_frame?(last_frame)
    raise BowlingError unless @current_frame.valid?(last_frame)
  end
end

module BookKeeping
  VERSION = 3
end
