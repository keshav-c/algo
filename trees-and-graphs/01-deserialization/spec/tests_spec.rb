require './breadth-first-des'

describe "#leftmost_nodes_sum" do

    it "passes test 1" do
        array = [2, 7, 5, 2, 6, 0, 9]
        expect(leftmost_nodes_sum(array)).to eql 11
    end
    it "passes test 2" do
        array = [1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0]
        expect(leftmost_nodes_sum(array)).to eql 13
    end
end