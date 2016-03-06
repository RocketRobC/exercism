class Gigasecond
  VERSION = 1

  def self.from(datetime)
    datetime + (10**9)
  end

end
