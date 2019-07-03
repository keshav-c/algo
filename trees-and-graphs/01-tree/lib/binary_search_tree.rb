require_relative 'node'
require_relative 'tree'

class BinarySearchTree < Tree
    attr_reader :root

    def initialize(array)
        @root = Node.new(array[0])
        array[1..-1].each { |el| insert(Node.new(el)) }
    end
    
    def insert(node, position = self.root)
        if position.data > node.data
            if position.left.nil?
                position.left = node
            else
                insert(node, position.left)
            end
        else
            if position.right.nil?
                position.right = node
            else
                insert(node, position.right)
            end
        end
    end
end