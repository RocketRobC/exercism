class Crypto
  def initialize(text)
    @source_text = normalise(text)
  end

  def ciphertext
    return source_text if source_text.empty?
    encode
  end

  private

  attr_reader :source_text

  def normalise(text)
    text.downcase.scan(/[a-z1-9]/).join
  end

  def encode
    generate_rectangle(source_text).transpose.map(&:join).join(' ')
  end

  def generate_rectangle(string)
    apply_padding(string).chars.each_slice(columns).to_a
  end

  def apply_padding(string)
    padding = (columns * rows) - string.size
    string.concat(' ' * padding)
  end

  def columns
    n = Math.sqrt(source_text.size).ceil
    n.zero? ? 1 : n
  end

  def rows
    (source_text.size / columns.to_f).ceil
  end
end

module BookKeeping
  VERSION = 1
end
