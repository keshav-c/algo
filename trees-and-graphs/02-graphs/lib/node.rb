class Node
  attr_accessor :data, :neighbours

  def initialize(data)
    @data = data
    @neighbours = []
  end

  def make_neighbour(node)
    neighbours << node unless neighbours.include? node
  end
end
