class Bst
  attr_reader :data, :left, :right

  def initialize(value)
    @data = value
  end

  def insert(value)
    branch = value <= data ? 'left' : 'right'
    if !branch.nil?
      # WIP
      send(:"#{branch}=", "@#{branch}".insert(value))
    else
      branch = Bst.new(value)
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
