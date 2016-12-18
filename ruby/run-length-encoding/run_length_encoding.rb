class RunLengthEncoding

  def self.encode(input)
    input_chars = input.chars.to_a
    char_count = input_chars.each_with_object(Hash.new(0)) do |c, hash|
      hash[c] += 1
    end
    char_count.map { |k, v| "#{v}#{k}" }.join  
  end

  def decode(input)
  end

end
