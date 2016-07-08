class Year
  
  def self.leap?(year)
    if year < 1752
      julian_leap?(year)
    else
      gregorian_leap?(year)
    end
  end

  def self.julian_leap?(year)
    year % 4 == 0
  end

  def self.gregorian_leap?(year)
    year % 4 == 0 && year % 100 == 0 ? year % 400 == 0 : year % 4 == 0
  end
end

class BookKeeping
  VERSION = 2
end
