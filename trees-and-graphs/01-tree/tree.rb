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

    def sum_left(node)
        node.nil? ? 0 : node.data + sum_left(node.left)
    end

    def height_from(node)
        if node.nil?
            0
        else
            1 + [height_from(node.left), height_from(node.right)].max
        end
    end

    def pre_order(node, &proc)
        unless node.nil?
            proc.call(node)
            pre_order(node.left, &proc)
            pre_order(node.right, &proc)
        end
    end

    def post_order(node, &proc)
        unless node.nil?
            post_order(node.left, &proc)
            post_order(node.right, &proc)
            proc.call(node)
        end
    end
end
