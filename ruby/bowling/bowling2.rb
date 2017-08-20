class Game
  attr_reader :score

  def initialize
    @frame_count = 1
    @buffer = []
    @score = 0
  end

  def roll(pins)
    @buffer << pins
    if @buffer.size > 0 && @buffer.size.even?
      @frame_count += 1
      update_score
    end
  end

  private

  def update_score
    if spare?(previous_frame)
      @score += 10 + current_frame[0]
    elsif strike?(previous_frame)
      @score += 10 + 

  end

  def strike?(frame_scores)
    frame_scores[0] == 10
  end

  def spare?(frame_scores)
    frame_scores.reduce(:+) == 10
  end
    
  def grouped_frames
    @buffer.each_slice(2).map { |f| f }
  end

  def previous_frame
    grouped_frames[@frame_count - 1]
  end

  def current_frame
    grouped_frames[@frame_count]
  end
end
