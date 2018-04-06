class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

#  def word_count 
#    words.each_with_object(Hash.new(0)) do |word, hash|
#      hash[word] += 1
#    end
#  end

  def word_count
    c = Hash.new(0)
    words.each { |word| c[word] += 1 }
    c
  end

  private

  attr_reader :phrase

  def words
    phrase.downcase.scan(/\b[\w']+\b/)
  end
end

module BookKeeping
  VERSION = 1
end
