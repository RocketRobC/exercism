module BookKeeping
  VERSION = 2
end

class RunLengthEncoding

  def self.encode(input)
    input.chars.chunk { |chars| chars }.inject("") do |result, (name, chars)|
      value = chars.size == 1 ? chars[0] : chars.size.to_s + name
      result << value
    end
  end

  def self.decode(input)
    input.scan(/(\d+)?(.)/).inject("") do |result, (count, char)|
      value = count ? char * count.to_i : char
      result << value
    end
  end

end
