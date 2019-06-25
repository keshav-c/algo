require_relative 'tree'
require_relative 'node'

def leftmost_nodes_sum(array)
    tree = Tree.new(array)
    tree.sum_left(tree.root)
end

def tree_height(array)
    tree = Tree.new(array)
    tree.height_from(tree.root)
end

def pre_order(array)
    tree = Tree.new(array)
    res = []
    tree.pre_order(tree.root) { |i| res << i.data }
    res
end

def post_order(array)
    tree = Tree.new(array)
    res = []
    tree.post_order(tree.root) { |i| res << i.data }
    res
end