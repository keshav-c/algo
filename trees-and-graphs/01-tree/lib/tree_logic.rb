module TreeLogic
    def sum_left_from(node)
        node.nil? ? 0 : node.data + sum_left_from(node.left)
    end

    def leftmost_sum
        sum_left_from(root)
    end

    def height_from(node)
        if node.nil?
            0
        else
            1 + [height_from(node.left), height_from(node.right)].max
        end
    end

    def max_height
        height_from(root)
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

    def is_bst?
        def in_range(node, range_min, range_max)
            return true if node.nil?
            if node.data >= range_min and node.data <= range_max
                left_in_range = in_range(node.left, range_min, node.data)
                right_in_range = in_range(node.right, node.data, range_max)
                left_in_range and right_in_range
            else
                false
            end
        end
        in_range(root, -Float::INFINITY, Float::INFINITY)
    end
end