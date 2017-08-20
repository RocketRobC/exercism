class Frame
  attr_reader :roll1

  def initialize
    @roll1, @roll2 = nil, nil
    @bonus = nil
  end

  def add_roll(pins)
    @roll1.nil? ? @roll1 = pins : @roll2 = pins
  end

  def add_bonus(roll)
    @bonus = roll
    self
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
    @roll1 + (@roll2 || 0) + (@bonus || 0)
  end
end

class ScoreCard
  def initialize
    @frame_scores = []
    @stack = []
  end

  def add(frame:, last_frame:)
    if last_frame == true
      last_frame(frame)
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

  def last_frame(frame)
    puts @stack.inspect
    previous_frame = @stack.pop
    @frame_scores << previous_frame.score + frame.roll1
  end

  def last_frame?
    @frame_scores.size == 10 || (@frame_scores.size == 9 && !@stack.empty?)
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
    if @score_card.last_frame?
      @score_card.add(frame: @current_frame, last_frame: true)
    elsif @current_frame.complete?
      @score_card.add(frame: @current_frame, last_frame: false)
      @current_frame = Frame.new
    end
  end

  def score
    @score_card.total_score
  end
end
