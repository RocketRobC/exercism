class FlattenArray
  def self.flatten(list)
    new.flatten(list)
  end

  def initialize
    @result = []
  end

  def flatten(list)
    return if list.empty?
    if list[0].is_a?(Array)
      flatten(list[0])
    else
      @result << list[0]
    end
    flatten(list[1..-1])
    @result.compact
  end
end
