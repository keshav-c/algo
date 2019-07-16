class Peak
  attr_reader :height, :row, :col
  attr_accessor :neighbours

  def initialize(height, row, col)
    @height = height
    @row = row
    @col = col
    @neighbours = []
  end

  def assign_adjoining(peak)
    neighbours << peak unless neighbours.include? peak
  end

  def >(other)
    height > other.height
  end
end