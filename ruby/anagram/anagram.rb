class Anagram
  def initialize(word)
    @input_word = word
  end

  def match(match_list)
    match_list.select do |w|
      w.downcase != @input_word.downcase &&
        letters_of(w) == letters_of(@input_word)
    end
  end

  private

  def letters_of(word)
    word.downcase.each_char.sort
  end
end

module BookKeeping
  VERSION = 2
end
