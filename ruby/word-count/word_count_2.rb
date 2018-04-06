class Phrase
  def initialize(phrase)
    @word_list = generate_word_list(phrase)
  end

  def word_count
    word_list.each_with_object(Hash.new(0)) do |word, hash|
      hash[word] += 1
    end
  end

  private

  attr_reader :word_list

  def generate_word_list(phrase)
    phrase.downcase.scan(/\w+'\w+|\w+/)
  end
end

module BookKeeping
  VERSION = 1
end
