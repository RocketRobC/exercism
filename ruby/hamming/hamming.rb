class Hamming
  VERSION = 1

  def self.compute(listA, listB)
    if listA.length != listB.length
      raise ArgumentError
    end
    counter = 0
    listA.length.times do |index|
      if listA[index] != listB[index]
        counter += 1
      end
    end
    counter
  end

end
