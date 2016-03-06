class Hamming
  VERSION = 1

  def self.compute(strand_1, strand_2)
    if strand_1.length != strand_2.length
      raise ArgumentError
    end
    (strand_1.length.times).count { |i| strand_1[i] != strand_2[i] }
  end

end
