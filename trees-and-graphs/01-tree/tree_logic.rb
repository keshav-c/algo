module TreeLogic
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