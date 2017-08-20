class Frame
  attr_reader :roll1

  def initialize
    @roll1, @roll2, @last_roll = nil, nil, nil
    @bonus = nil
  end

  def add_roll(pins)
    if @roll1.nil?
      @roll1 = pins
    elsif @roll2.nil?
      @roll2 = pins
    else
      @last_roll = pins
    end
  end

  def add_bonus(roll)
    @bonus = roll
    self
  end

  def last_frame_complete?
    ((@roll1 || 0) + (@roll2 || 0) < 10 && !@roll2.nil?) || !@last_roll.nil?
  end

  def complete?
    @roll1 == 10 || !@roll2.nil?
  end

  def strike?
    @roll1 == 10 && @roll2.nil?
  end

  def spare?
    score == 10
  end

  def score
    @roll1 + (@roll2 || 0) + (@bonus || 0) + (@last_roll || 0)
  end
end

class ScoreCard
  def initialize
    @frame_scores = []
    @stack = []
  end

  def add(frame:, last_frame:)
    if last_frame == true
      @frame_scores << frame.score
    elsif frame.strike? || frame.spare?
      @stack << frame
    elsif @stack.empty?
      @frame_scores << frame.score
    else
      @frame_scores << frame.score
      calculate_frame(frame)
    end
  end

  def calculate_frame(frame)
    if !@stack.empty? && @stack.last.strike?
      previous_frame = @stack.pop
      @frame_scores << previous_frame.score + frame.score
      calculate_frame(previous_frame.add_bonus(frame.roll1))
    elsif !@stack.empty? && @stack.last.spare?
      previous_frame = @stack.pop
      @frame_scores << previous_frame.score + frame.roll1
      calculate_frame(previous_frame)
    end
  end

  def last_frame?
    @frame_scores.size == 9
  end

  def total_score
    @frame_scores.reduce(:+)
  end
end

class Game
  def initialize(frame: Frame.new, score_card: ScoreCard.new)
    @current_frame = frame
    @score_card = score_card
  end

  def roll(pins)
    @current_frame.add_roll(pins)
    if @score_card.last_frame? && @current_frame.last_frame_complete?
      @score_card.add(frame: @current_frame, last_frame: true)
    elsif !@score_card.last_frame? && @current_frame.complete?
      @score_card.add(frame: @current_frame, last_frame: false)
      @current_frame = Frame.new
    end
  end

  def score
    @score_card.total_score
  end
end
