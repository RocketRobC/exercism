class Clock
  include Comparable

  def self.at(hours, minutes)
    new(hours, minutes)
  end

  def to_s
    "#{format_string(hours)}:#{format_string(minutes)}" 
  end

  def +(added_minutes)
    @given_minutes += added_minutes
    self
  end
  
  def <=>(other)
    if self.hours > other.hours
      1
    elsif self.hours == other.hours && self.minutes > other.minutes
      1
    elsif self.hours == other.hours && self.minutes == other.minutes
      0
    elsif self.hours < other.hours
      -1
    elsif self.hours == other.hours && self.minutes < other.minutes
      -1
    end
  end

  def hours
    a = @given_hours % 24
    b = @given_minutes / 60 % 24
    (a + b) % 24
  end

  def minutes
    @given_minutes % 60
  end

  private

  def initialize(hours, minutes)
    @given_hours = hours
    @given_minutes = minutes
  end

  def format_string(value)
    "%02d" % value
  end
end

module BookKeeping
  VERSION = 2
end
