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
