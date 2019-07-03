require './lib/binary_search_tree'

describe "BinarySearchTree" do

    context "#pre_order" do
        it "passes test 1" do
            array = [8, 3, 10, 1, 6, 14, 4, 7, 13]
            tree = BinarySearchTree.new(array)
            res = []
            tree.pre_order(tree.root) { |i| res << i.data }
            expect(res).to eql [8, 3, 1, 6, 4, 7, 10, 14, 13]
        end
        it "passes test 2" do
            array = [5, 3, 7, 1, 2, 6, 8]
            tree = BinarySearchTree.new(array)
            res = []
            tree.pre_order(tree.root) { |i| res << i.data }
            expect(res).to eql [5, 3, 1, 2, 7, 6, 8]
        end
        it "passes test 3" do
            array = [10, 12, 15, 7, 2, 23, 9, 14, 21]
            tree = BinarySearchTree.new(array)
            res = []
            tree.pre_order(tree.root) { |i| res << i.data }
            expect(res).to eql [10, 7, 2, 9, 12, 15, 14, 23, 21]
        end
        it "passes test 4" do
            array = [50, 25, 75, 15, 21, 62, 91]
            tree = BinarySearchTree.new(array)
            res = []
            tree.pre_order(tree.root) { |i| res << i.data }
            expect(res).to eql [50, 25, 15, 21, 75, 62, 91] 
        end
    end
end