class RailFenceCipher
  VERSION = 1

  def self.encode(string, rails)
    new(string, rails).encode
  end

  def self.decode(string, rails)
    new(string, rails).decode
  end

  def encode
    cypher(string, code_map(sequence))
  end

  def decode
    cypher(string, code_map(sequence).invert)
  end

  private

  attr_reader :string, :rails, :length

  def initialize(string, rails)
    @string = string
    @rails = rails
    @length = @string.size
  end

  def cypher(string, mapped_sequence)
    mapped_sequence.sort.to_h.values.map { |value| string[value] }.join
  end

  def code_map(seq)
    (0...length).zip(seq).to_h
  end

  def sequence
    (0...rails).flat_map do |rail|
      (0...number_of_cycles).flat_map do |cycle_number|
        start_of_cycle = cycle_number * full_cycle
        if rail == 0
          start_of_cycle
        elsif rail == half_cycle
          start_of_cycle + half_cycle
        else
          [start_of_cycle + rail, start_of_cycle + full_cycle - rail]
        end
      end
    end.select { |i| i < length }
  end

  def half_cycle
    rails - 1
  end

  def full_cycle
    half_cycle > 0 ? half_cycle * 2 : 1
  end

  def number_of_cycles
    (length.to_f / full_cycle).ceil
  end
end
