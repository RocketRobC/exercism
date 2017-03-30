module BookKeeping
  VERSION = 1
end

# Inspired by some other examples, here's another version without using each.

class Array
  def accumulate
    output = []
    c = 0
    until c == size
      output << yield(self[c])
      c += 1
    end
    output
  end
end
