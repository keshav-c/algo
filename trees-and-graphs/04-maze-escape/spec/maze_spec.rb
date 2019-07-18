require './lib/maze'

RSpec.describe Maze do
  context "7x7 maze" do
    before { @m = Maze.new([[0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 1, 0, 0], [0, 1, 1, 1, 1, 1, 1], [0, 0, 0, 0, 0, 0, 9], [0, 1, 1, 1, 1, 0, 0], [0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 1, 0, 0]]) }
    
    context "#neighbours" do
      it "gets the neighbours of (1, 6)" do
        expect(Set.new(@m.neighbours(r: 1, c: 6))).to eql Set[{r: 0, c: 6}, {r: 1, c: 5}]
      end
      it "gets the neighbours of (3, 5)" do
        expect(Set.new(@m.neighbours(r: 3, c: 5))).to eql Set[{r: 3, c: 6}, {r: 3, c: 4}, {r: 4, c: 5}]
      end
    end
    context "#escape" do
      it "escapes the maze" do
        expect(@m.escape).to eql [[0, 0], [0, 1], [0, 2], [0, 3], [1, 3], [2, 3], [3, 3], [4, 3], [5, 3], [6, 3]]
      end
    end
  end
  context "3x3 maze" do
    before { @m = Maze.new([[0, 0, 0], [0, 1, 9], [0, 0, 0]]) }

    context "#neighbours" do
      it "gets the neighbours of (0, 2)" do
        expect(Set.new(@m.neighbours(r: 0, c: 2))).to eql Set[{r: 0, c: 1}, {r: 1, c: 2}]
      end
    end
    
    context "#escape" do
      it "escapes the maze" do
        expect(@m.escape).to eql [[0, 0], [1, 0], [2, 0], [2, 1]]
      end
    end
  end
  context "9x9 maze" do
    before { @m = Maze.new([[0, 0, 0, 0, 0, 1, 0, 0, 0], [0, 1, 0, 1, 0, 1, 1, 0, 1], [0, 1, 0, 1, 0, 0, 0, 0, 0], [1, 1, 0, 1, 1, 1, 0, 1, 1], [0, 0, 0, 0, 0, 1, 0, 0, 1], [1, 1, 1, 1, 0, 1, 1, 1, 1], [0, 0, 0, 0, 0, 0, 0, 0, 1], [0, 1, 1, 0, 0, 1, 1, 0, 9], [0, 0, 1, 0, 0, 0, 0, 0, 0]]) }

    context "#neighbours" do
      it "gets the neighbours of (2, 6)" do
        expect(Set.new(@m.neighbours(r: 2, c: 6))).to eql Set[{r: 2, c: 7}, {r: 3, c: 6}, {r: 2, c: 5}]
      end
    end
    
    context "#escape" do
      it "escapes the maze" do
        expect(@m.escape).to eql [[0, 0], [1, 0], [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [3, 4], [4, 4], [4, 5], [4, 6], [5, 6], [6, 6], [7, 6], [7, 7], [8, 7]]
      end
    end
  end
  context "5x5 maze" do
    before { @m = Maze.new([[0, 0, 0, 0, 0], [0, 1, 0, 1, 0], [0, 1, 0, 1, 1], [0, 1, 0, 0, 0], [0, 0, 0, 1, 9]]) }

    context "#escape" do
      it "escapes the maze" do
        expect(@m.escape).to eql [[0, 0], [1, 0], [2, 0], [2, 1], [2, 2], [2, 3], [3, 3], [4, 3], [4, 4]]
      end
    end
  end
end
