require_relative 'node'

class Tree
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
                if queue[0].nil?
                    idx += 2
                    next
                end
                idx += 1
                queue[0].left = assign_node(array[idx])
                queue << queue[0].left
                idx += 1
                queue[0].right = assign_node(array[idx])
                queue << queue[0].right
                queue.shift
            end
        end
    end
end
