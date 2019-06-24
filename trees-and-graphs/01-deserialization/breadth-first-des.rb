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