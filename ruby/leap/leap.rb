class Year
  def self.leap?(year)
    if (8..1581).include?(year)
      julian_leap?(year)
    elsif year >= 1582
      gregorian_leap?(year)
    else
      raise ArgumentError, "Year out of range"
    end
  end

  def self.julian_leap?(year)
    year % 4 == 0
  end

  def self.gregorian_leap?(year)
    (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)
  end
end

class BookKeeping
  VERSION = 2
end
