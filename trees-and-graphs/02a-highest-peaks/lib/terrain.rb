require_relative 'peak'

class Terrain
  attr_accessor :peaks
  
  def initialize(data)
    @peaks = []
    (0...data.length).each do |r|
      @peaks[r] = []
      (0...data[r].length).each do |c|
        @peaks[r] << Peak.new(data[r][c], r, c)
      end
    end
    (0...data.length).each do |r|
      (0...data[r].length).each do |c|
        @peaks[r][c].assign_adjoining(@peaks[r + 1][c]) if (0...data.length).include?(r + 1)
        @peaks[r][c].assign_adjoining(@peaks[r - 1][c]) if (0...data.length).include?(r - 1)
        @peaks[r][c].assign_adjoining(@peaks[r][c + 1]) if (0...data[r].length).include?(c + 1)
        @peaks[r][c].assign_adjoining(@peaks[r][c - 1]) if (0...data[r].length).include?(c - 1)
      end
    end
  end

  def controlling_peak(peak)
    ctrl = nil
    peak.neighbours.each do |nebr|
      if nebr.height > peak.height
        if ctrl.nil?
          ctrl = nebr
        else
          ctrl = nebr if nebr.height > ctrl.height
        end
      end
    end
    ctrl
  end

  def ascend(peak)
    desc_from = controlling_peak(peak)
    if desc_from.nil?
      [peak]
    else
      ascend(desc_from) << peak
    end
  end

  def descend(peak, visited = Array.new(peaks.length) { Array.new(peaks.length, false) }, &proc)
    visited[peak.row][peak.col] = true
    yield(peak)
    peak.neighbours.each do |nebr|
      if controlling_peak(nebr) == peak && !visited[nebr.row][nebr.col]
        descend(nebr, visited, &proc)
      end
    end
    visited
  end

  def group_peaks
    areas_list = []
    visited = Array.new(peaks.length) { Array.new(peaks.length, false) }
    (0...peaks.length).each do |r|
      (0...peaks[r].length).each do |c|
        if !visited[r][c]
          super_peak = ascend(peaks[r][c]).first
          super_area = []
          visited = descend(super_peak, visited) { |peak| super_area << peak.height }
          areas_list << super_area
        end
      end
    end
    areas_list
  end

  def min_max_areas
    areas = group_peaks.map(&:length)
    [areas.min, areas.max]
  end
end