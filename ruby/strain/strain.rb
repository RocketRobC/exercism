# monkey patch keep and discard
class Array
  def keep
    select { |i| yield(i) == true }
  end

  def discard(&block)
    self - keep(&block)
  end
end
