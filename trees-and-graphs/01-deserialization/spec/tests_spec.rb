require './breadth-first-des'

describe "#Tree Deserialization and routines on unflatenned tree" do
    context "#leftmost_nodes_sum" do
        it "passes test 1" do
            array = [2, 7, 5, 2, 6, 0, 9]
            expect(leftmost_nodes_sum(array)).to eql 11
        end
        it "passes test 2" do
            array = [1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0]
            expect(leftmost_nodes_sum(array)).to eql 13
        end
    end
    context "#tree_height" do
        it "passes test 1" do
            array = [2, 7, 5, 2, 6, 0, 9]
            expect(tree_height(array)).to eql 3
        end
        it "passes test 2" do
            array = [1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0]
            expect(tree_height(array)).to eql 4
        end
        it "passes test 3" do
            array = [5, 3, 2, 9, 0, 0, 7, 0, 0, 0, 0, 0, 0, 5, 0]
            expect(tree_height(array)).to eql 4
        end
    end
end
