class Binary
  def self.to_decimal(input)
    raise ArgumentError unless valid?(input)
    input.reverse.chars.each_with_index.map do |n, i|
      n.to_i << i
    end.inject(:+)
  end

  def self.valid?(input)
    input.chars.all? { |c| %w(0 1).include?(c) }
  end
end

module BookKeeping
  VERSION = 3
end
