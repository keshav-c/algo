require_relative 'navigator'

class Maze
  attr_reader :map

  def initialize(map)
    @map = map
  end

  def nrows
    map.length
  end

  def ncols
    map[0].length
  end

  def not_wall?(pos)
    map[pos[:r]][pos[:c]] != 1
  end

  def is_dest?(pos)
    map[pos[:r]][pos[:c]] == 9
  end

  def in_map?(pos)
    (0...nrows).include?(pos[:r]) && (0...ncols).include?(pos[:c])
  end

  def neighbours(pos)
    nbrs = []
    south = {r: pos[:r] + 1, c: pos[:c]}
    nbrs << south if in_map?(south) && not_wall?(south)
    north = {r: pos[:r] - 1, c: pos[:c]}
    nbrs << north if in_map?(north) && not_wall?(north)
    west = {r: pos[:r], c: pos[:c] + 1}
    nbrs << west if in_map?(west) && not_wall?(west)
    east = {r: pos[:r], c: pos[:c] - 1}
    nbrs << east if in_map?(east) && not_wall?(east)
    nbrs
  end

  def path_as_array(array)
    array.map { |h| [h[:c], h[:r]] }
  end

  def escape
    visited = Array.new(map.length) { Array.new(map[0].length, false) }
    visited[0][0] = true
    start = {r: 0, c: 0}
    path = [start]
    queue = [Navigator.new(start, path)]
    while !queue.empty?
      nbrs = neighbours(queue[0].pos).filter do |nbr| 
        !visited[nbr[:r]][nbr[:c]] 
      end
      nbrs.each do |nbr|
        if is_dest? nbr
          return path_as_array(queue[0].path + [nbr])
        else
          queue << Navigator.new(nbr, queue[0].path + [nbr])
          visited[nbr[:r]][nbr[:c]] = true
        end
      end
      queue.shift
    end
  end
end