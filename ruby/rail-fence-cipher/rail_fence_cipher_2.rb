class RailFenceCipher
  VERSION = 1

  def self.encode(string, rails)
    new(string, rails).encode
  end

  def self.decode(string, rails)
    new(string, rails).decode
  end

  def encode
    char_collection = Array.new(rails, '')
    rail_char_cycle { |char, i| char_collection[i] += char }
    char_collection.join
  end

  def decode
    result = ''
    str_copy = string.dup
    string_groups = rail_char_count.values.map do |char|
      str_copy.slice!(0...char)
    end
    rail_char_cycle do |_, index|
      result += string_groups[index].slice!(0)
    end
   result 
  end
  
  private

  attr_reader :string, :rails

  def initialize(string, rails)
    @string = string
    @rails = rails
  end

  def rail_char_count
    rail_char_cycle.each_with_object(Hash.new(0)) do |(_, index), indeces|
      indeces[index] += 1
    end
  end

  def rail_char_cycle
    return enum_for(:rail_char_cycle) unless block_given?
    string.each_char.with_index do |char, char_index|
      yield(char, index_in_array(char_index))
    end
  end

  def max_rail_index
    rails > 1 ? (rails - 1) * 2 : 1
  end

  def index_in_array(char_index)
    cycle_index = char_index % max_rail_index
    return max_rail_index - cycle_index if cycle_index >= rails
    cycle_index
  end
end
