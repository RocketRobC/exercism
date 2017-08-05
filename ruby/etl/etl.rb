class ETL
  def self.transform(hash_value)
    hash_value.each_with_object({}) do |(score, letters), result|
      letters.each { |l| result[l.downcase] = score }
    end
  end
end

module BookKeeping
  VERSION = 1
end
