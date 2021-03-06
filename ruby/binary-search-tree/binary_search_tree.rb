class Bst
  attr_reader :data, :left, :right

  def initialize(value)
    @data = value
  end

  def insert(value)
    if value <= data
      @left = create_node(value, @left)
    else
      @right = create_node(value, @right)
    end
    self
  end

  def each(&block)
    return to_enum(&:each) unless block_given?
    left.each(&block) unless left.nil?
    yield data
    right.each(&block) unless right.nil?
    self
  end

  private

  def create_node(value, node)
    if node.nil?
      Bst.new(value)
    else
      node.insert(value)
    end
  end
end

module BookKeeping
  VERSION = 1
end
