class Phrase

  def initialize(phrase)
    @phrase = parse_phrase(phrase)
  end

  def word_count
    counts = Hash.new(0)
    @phrase.each do |word|
      counts[word] += 1
    end
    counts
  end

  def parse_phrase(phrase)
    phrase.downcase.scan(/\w+'\w+|\w+/)
  end
end

class BookKeeping
  VERSION = 1
end
