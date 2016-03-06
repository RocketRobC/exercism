class Complement
  VERSION = 3

  VALUES = {
    "G" => "C",
    "C" => "G",
    "T" => "A",
    "A" => "U"
  }

  def self.of_dna(string)
    string.chars.map { |n| VALUES.keys.include?(n) ? VALUES[n] : (raise ArgumentError) }.join
  end


end
