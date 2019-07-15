class Peak
  attr_reader :height, :row, :col
  attr_accessor :neighbours

  def initialize(height, row, col)
    @height = height
    @row, @col = row, col
    @neighbours = []
  end

  def assign_adjoining(peak)
    neighbours << peak unless neighbours.include? peak
  end

  def to_s
    "height: #{height}; Pos: [#{row}, #{col}]"
  end
end