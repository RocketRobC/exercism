class Binary

  def self.to_decimal(n)
    n.reverse.chars.each_with_index.map do |n, i|
      valid?(n)
      n.to_i << i
    end.inject(:+)
  end

  def self.valid?(n)
    return if ["0", "1"].include?(n)
    raise ArgumentError
  end

end

module BookKeeping
  VERSION = 3
end

