def get_path(hash, start, dest)
    visit(hash, [start], dest)
end

def visit(hash, path, dest)
    current = path[-1]
    if hash[current].include? dest
        return path + [dest]
    else
        hash[current].each do |next_node|
            unless path.include? next_node
                full_path = visit(hash, path + [next_node], dest)
                return full_path if full_path
            end
        end
        false
    end
end

def breadth_first_search(graph)
    queue = [0]
    visited = Array.new(graph.size, false)
    until queue.empty? do
        removed = queue.shift
        unless visited[removed]
            graph[removed].each { |n| queue << n }
            yield(removed) if block_given?
            visited[removed] = true
        end
    end
end

def bfs_caller(graph)
    res = []
    breadth_first_search(graph) { |i| res << i }
    res
end