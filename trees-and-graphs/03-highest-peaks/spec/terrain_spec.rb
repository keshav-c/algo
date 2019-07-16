require './lib/terrain'

RSpec.describe Terrain do
  def peak_heights(peaks)
    peaks.map(&:height)
  end

  def controlled_peaks(terrain, x, y)
    ctrl_peaks = []
    visited_peaks = terrain.descend(terrain.peaks[x][y]) { |peak| ctrl_peaks << peak.height }
    {c: ctrl_peaks, v: visited_peaks}
  end

  def sorted_area_heights(terrain)
    terrain.group_peaks.map(&:sort)
  end

  context "#ascend" do
    context "3x3 map" do
      before {@t = Terrain.new([[9,8,5], [5,6,3], [8,4,1]])}

      it "ascends from 3 to 9" do
        expect(peak_heights @t.ascend(@t.peaks[1][2])).to eql [9, 8, 6, 3]
      end
      it "ascends from 1 to 8" do
        expect(peak_heights @t.ascend(@t.peaks[2][2])).to eql [8, 4, 1]
      end
      it "stays at 9" do
        expect(peak_heights @t.ascend(@t.peaks[0][0])).to eql [9]
      end
    end
    context "4x4 map" do
      before {@t = Terrain.new([[4,3,2,1], [2,1,0,5], [0,7,4,6], [10,8,4,7]])}

      it "ascends from 1 to 10" do
        expect(peak_heights @t.ascend(@t.peaks[1][1])).to eql [10, 8, 7, 1]
      end
      it "ascends from 2 to 4" do
        expect(peak_heights @t.ascend(@t.peaks[0][2])).to eql [4, 3, 2]
      end
      it "ascends from 0 to 7" do
        expect(peak_heights @t.ascend(@t.peaks[1][2])).to eql [7, 6, 5, 0]
      end
    end
  end

  context "#descend" do
    context "3x3 map" do
      before {@t = Terrain.new([[9,8,5], [5,6,3], [8,4,1]])}

      it "gets all peaks belonging to 9(0, 0)" do
        controlled_peaks_data = controlled_peaks(@t, 0, 0)
        expect(controlled_peaks_data[:c].sort).to eql [9,5,8,5,6,3].sort
        expect(controlled_peaks_data).to include(v: [[true,true,true],[true,true,true],[false,false,false]])
      end
      it "gets all peaks belonging to 6(1, 1)" do
        controlled_peaks_data = controlled_peaks(@t, 1, 1)
        expect(controlled_peaks_data[:c].sort).to eql [6,3].sort
        expect(controlled_peaks_data).to include(v: [[false,false,false],[false,true,true],[false,false,false]])
      end
      it "gets all peaks belonging to 8(2, 0)" do
        controlled_peaks_data = controlled_peaks(@t, 2, 0)
        expect(controlled_peaks_data[:c].sort).to eql [8, 4, 1].sort
        expect(controlled_peaks_data).to include(v: [[false,false,false],[false,false,false],[true,true,true]])
      end
    end
    context "4x4 map" do
      before {@t = Terrain.new([[4,3,2,1], [2,1,0,5], [0,7,4,6], [10,8,4,7]])}

      it "gets all peaks belonging to 4(0, 0)" do
        controlled_peaks_data = controlled_peaks(@t, 0, 0)
        expect(controlled_peaks_data[:c].sort).to eql [2,4,3,2].sort
        expect(controlled_peaks_data).to include(v: [[true,true,true,false],[true,false,false,false],[false,false,false,false],[false,false,false,false]])
      end
      it "gets all peaks belonging to 10(3, 0)" do
        controlled_peaks_data = controlled_peaks(@t, 3, 0)
        expect(controlled_peaks_data[:c].sort).to eql [0,10,1,7,8,4,4].sort
        expect(controlled_peaks_data).to include(v: [[false,false,false,false],[false,true,false,false],[true,true,true,false],[true,true,true,false]])
      end
      it "gets all peaks belonging to 7(3, 3)" do
        controlled_peaks_data = controlled_peaks(@t, 3, 3)
        expect(controlled_peaks_data[:c].sort).to eql [1,0,5,6,7].sort
        expect(controlled_peaks_data).to include(v: [[false,false,false,true],[false,false,true,true],[false,false,false,true],[false,false,false,true]])
      end
    end
  end
  
  context "#areas" do
    it "partitions the 3x3 map" do
      t = Terrain.new([[9,8,5], [5,6,3], [8,4,1]])
      sorted_heights = sorted_area_heights(t)
      expect(sorted_heights).to include([8,9,5,5,6,3].sort)
      expect(sorted_heights).to include([8,4,1].sort)
    end
    it "partitions the 4x4 map" do
      t = Terrain.new([[4,3,2,1], [2,1,0,5], [0,7,4,6], [10,8,4,7]])
      sorted_heights = sorted_area_heights(t)
      expect(sorted_heights).to include([2,4,3,2].sort)
      expect(sorted_heights).to include([0,10,1,7,8,4,4].sort)
      expect(sorted_heights).to include([0,5,6,7,1].sort)
    end
  end

  context "#min_max_areas" do
    it "Gets the minimum and maximum areas in 3x3 map" do
      t = Terrain.new([[9,8,5],[5,6,3],[8,4,1]])
      expect(t.min_max_areas).to eql [3, 6]
    end
    it "Gets the minimum and maximum areas in 4x4 map" do
      t = Terrain.new([[4,3,2,1],[2,1,0,5],[0,7,4,6],[10,8,4,7]])
      expect(t.min_max_areas).to eql [4,7]
    end
    it "Gets the minimum and maximum areas in 4x4 map" do
      t = Terrain.new([[2,6,9,11],[7,8,9,8],[6,7,12,9],[10,7,6,4]])
      expect(t.min_max_areas).to eql [3,9]
    end
    it "Gets the minimum and maximum areas in 5x5 map" do
      t = Terrain.new([[3,6,9,11,3],[5,8,12,4,6],[7,10,13,2,14],[0,1,5,9,3],[2,8,6,4,0]])
      expect(t.min_max_areas).to eql [2,13]
    end
  end
end