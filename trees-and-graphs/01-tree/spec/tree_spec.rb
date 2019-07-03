require './lib/tree'

describe Tree do
    context "#leftmost_sum" do
        it "passes test 1" do
            array = [2, 7, 5, 2, 6, 0, 9]
            tree = Tree.new(array)
            expect(tree.leftmost_sum).to eql 11
        end
        it "passes test 2" do
            array = [1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0]
            tree = Tree.new(array)
            expect(tree.leftmost_sum).to eql 13
        end
    end
    context "#height" do
        it "passes test 1" do
            array = [2, 7, 5, 2, 6, 0, 9]
            tree = Tree.new(array)
            expect(tree.max_height).to eql 3
        end
        it "passes test 2" do
            array = [1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0]
            tree = Tree.new(array)
            expect(tree.max_height).to eql 4
        end
        it "passes test 3" do
            array = [5, 3, 2, 9, 0, 0, 7, 0, 0, 0, 0, 0, 0, 5, 0]
            tree = Tree.new(array)
            expect(tree.max_height).to eql 4
        end
        it "passes test 4" do
            array = [1, 2, 3, 4, 0, 5, 6, 7, 8, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0]
            tree = Tree.new(array)
            expect(tree.max_height).to eql 5
        end
    end
    context "#pre_order" do
        it "passes test 1" do
            array = [10, 1, 2, 3, 4, 5, 6]
            tree = Tree.new(array)
            res = []
            tree.pre_order(tree.root) { |node| res << node.data }
            expect(res).to eql [10, 1, 3, 4, 2, 5, 6]
        end
        it "passes test 2" do
            array = [2, 7, 5, 2, 6, 0, 9]
            tree = Tree.new(array)
            res = []
            tree.pre_order(tree.root) { |node| res << node.data }
            expect(res).to eql [2, 7, 2, 6, 5, 9]
        end
        it "passes test 3" do
            array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
            tree = Tree.new(array)
            res = []
            tree.pre_order(tree.root) { |node| res << node.data }
            expect(res).to eql [1, 2, 4, 8, 9, 5, 3, 6, 7]
        end
        it "passes test 4" do
            array = [1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0]
            tree = Tree.new(array)
            res = []
            tree.pre_order(tree.root) { |node| res << node.data }
            expect(res).to eql [1, 7, 2, 3, 7, 6, 5, 11, 5, 9, 4]
        end
    end
    context "#post_order" do
        it "passes test 1" do
            array = [10, 1, 2, 3, 4, 5, 6]
            tree = Tree.new(array)
            res = []
            tree.post_order(tree.root) { |node| res << node.data }
            expect(res).to eql [3, 4, 1, 5, 6, 2, 10]
        end
        it "passes test 2" do
            array = [2, 7, 5, 2, 6, 0, 9]
            tree = Tree.new(array)
            res = []
            tree.post_order(tree.root) { |node| res << node.data }
            expect(res).to eql [2, 6, 7, 9, 5, 2]
        end
        it "passes test 3" do
            array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
            tree = Tree.new(array)
            res = []
            tree.post_order(tree.root) { |node| res << node.data }
            expect(res).to eql [8, 9, 4, 5, 2, 6, 7, 3, 1]
        end
        it "passes test 4" do
            array = [1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0]
            tree = Tree.new(array)
            res = []
            tree.post_order(tree.root) { |node| res << node.data }
            expect(res).to eql [3, 7, 2, 5, 11, 6, 7, 4, 9, 5, 1]
        end
    end
end