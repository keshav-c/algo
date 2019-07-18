class Navigator
  attr_accessor :pos, :path
  
  def initialize(pos, path)
    @pos = pos
    @path = path
  end
end