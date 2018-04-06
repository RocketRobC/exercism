class Nucleotide
  def self.from_dna(dna)
    new(dna)
  end

  def initialize(dna)
    @dna = dna
    raise ArgumentError unless valid?
  end

  def count(letter)
    histogram[letter]
  end

  def histogram
    dna.chars.each_with_object(adenosine_library) do |c, hash|
      hash[c] += 1
    end
  end

  private

  attr_reader :dna

  def valid?
    dna.chars.each do |c|
      return false unless adenosine_library.keys.include?(c)
    end
    true
  end

  def adenosine_library
    { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }
  end
end
