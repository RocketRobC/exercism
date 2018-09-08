class RailFenceCipher
  VERSION = 1

  def self.encode(string, rails)
    new(string, rails).encode
  end

  def self.decode(string, rails)
    new(string, rails).decode
  end

  def encode
    fence(rails_pattern).join
  end

  def decode
    full_fence = fence(rails_pattern.sort)
    puts full_fence.inspect
    rails_pattern.map { |i| full_fence[i].shift }.join
  end

  private

  attr_reader :string, :rails

  def initialize(string, rails)
    @string = string
    @rails = rails
  end

  def fence(pattern)
    empty_fence = Hash.new { |h, k| h[k] = [] }
    puts pattern.inspect
    rail_indexed_chars = string.chars.zip(pattern)
    puts rail_indexed_chars.inspect
    h = rail_indexed_chars.each_with_object(empty_fence) do |(char, rail), col|
      col[rail] << char
    end
    puts h.inspect
    h.values
  end

  def rails_pattern
    (rails_sequence(offset: 0) + rails_sequence(offset: 1).reverse).
      cycle.first(string.size)
  end

  def rails_sequence(offset:)
    (offset...(rails - offset)).to_a
  end
end
