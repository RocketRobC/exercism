class Raindrops
  VERSION = 1

  SOUNDS = {
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  def self.convert(number)
    primes = SOUNDS.keys.select { |n| number % n == 0 }.map { |pn| SOUNDS[pn] }.join
    primes.empty? ? number.to_s : primes
  end


end
