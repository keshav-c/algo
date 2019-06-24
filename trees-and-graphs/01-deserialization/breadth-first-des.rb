require_relative 'tree'
require_relative 'node'

def leftmost_sum(node)
    node.nil? ? 0 : node.data + leftmost_sum(node.left)
end

def leftmost_nodes_sum(array)
    tree = Tree.new(array)
    leftmost_sum(tree.root)
end
