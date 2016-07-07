class Pangram
  VERSION = 1

  def self.is_pangram?(str)
    str.downcase.chars.uniq.map { |c| ('a'..'z').include?(c) ? c : nil }.compact.count == 26
  end

end
