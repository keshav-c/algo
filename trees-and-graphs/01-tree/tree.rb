require_relative 'node'
require_relative 'tree_logic'

class Tree
    include TreeLogic

    attr_reader :root

    def assign_node(val)
        (val.nil? or val.zero?) ? nil : Node.new(val)
    end

    def initialize(array)
        @root = Node.new(array[0])
        queue = [@root]
        idx = 0
        while idx < array.size
            unless queue.empty?
                idx += 1
                new_node = assign_node(array[idx])
                queue[0].left = new_node unless queue[0].nil?
                queue << new_node
                idx += 1
                new_node = assign_node(array[idx])
                queue[0].right = new_node unless queue[0].nil?
                queue << new_node
                queue.shift
            end
        end
    end
end
