require './main'

describe "The main file" do
    context "#get_path" do
        it "finds a path" do
            graph = {0 => [2], 1 => [4], 2 => [5, 0, 3], 3 => [2], 4 => [1, 5], 5 => [4, 2]} 
            expect(get_path(graph, 0, 4)).not_to eql false
        end
        it "returns false when no path exists" do
            hash = {0 => [1, 3], 1 => [4, 0], 2 => [5], 3 => [0], 4 => [1], 5 => [2]}
            expect(get_path(hash, 0, 5)).to eql false
        end
        it "finds a path" do
            hash = {0 => [1], 1 => [2, 4], 2 => [3, 1], 3 => [4, 2], 4 => [1, 5, 3, 5], 5 => [4, 6], 6 => [5, 7, 9], 7 => [6, 8], 8 => [7, 9], 9 => [6, 8]}
            expect(get_path(hash, 0, 8)).not_to eql false
        end
        it "finds the only path" do
            hash = {0 => [3], 1 => [2, 3], 2 => [4, 1], 3 => [1, 0], 4 => [2]}
            expect(get_path(hash, 0, 4)).to eql [0, 3, 1, 2, 4]
        end
        it "No path exists, passes test 5" do
            hash = {0 => [1, 2, 3], 1 => [2, 0, 3], 2 => [0, 3, 1], 3 => [0, 1, 2], 4 => [5], 5 => [4]}
            expect(get_path(hash, 0, 4)).to eql false
        end
    end

    context "#bfs_caller" do
        it "breadth_first_search returns array in BFS form" do
            graph = {0 => [2], 1 => [4], 2 => [5, 0, 3], 3 => [2], 4 => [1, 5], 5 => [4, 2]}
            expect(bfs_caller(graph)).to eql [0, 2, 5, 3, 4, 1]
        end
        it "breadth_first_search returns array in BFS form" do
            graph = {0 => [1, 2, 3], 1 => [0, 4, 5], 2 => [0, 5, 6], 3 => [0, 7, 8, 9], 4 => [1, 10, 11], 5 => [1, 2, 12], 6 => [2, 13], 7 => [3], 8 => [3], 9 => [3], 10 => [4], 11 => [4], 12 => [5], 13 => [6]}
            expect(bfs_caller(graph)).to eql [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
        end
    end
end