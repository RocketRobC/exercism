class Prime

  def initialize(r)
    prime(r)
  end

  def prime(r)
    s = (0..r).to_a
    s[0] = s[1] = nil
    # show(s)
    s.each do |v|
      next unless v
      # show(v)
      break if v*v > r
      (v*v).step(r, v) { |i| s[i] = nil }
    end
    show(s)
  end

  def show(s)
    # puts s
    puts "============"
    puts s.respond_to?("compact") ? s.compact : s
    puts "============"
    puts s.compact.count
    puts "=*=*=*=*=*=*"
  end

end

r = ARGV[0].to_i
Prime.new(r)
