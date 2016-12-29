module BookKeeping
  VERSION = 2
end

class RunLengthEncoding

  def self.encode(input)
    previous = input.chars.first
    count = 0
    input.chars.inject("") do |result, c|
      if previous == c
        count += 1
      else
        result << "#{show_count(count)}#{previous}"
        count = 1
        previous = c
      end
      @ans = result
    end
    @ans << "#{show_count(count)}#{previous}"
  end

  def self.decode(input)
    #result = ""
    input.scan(/(\d+)?(.)/).inject("") do |result, (d, c)|
      if d == nil
        result << c
      else
        result << c * d.to_i
      end
      result
    end
  end

  def self.show_count(count)
    count unless count == 1
  end

end
