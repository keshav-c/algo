class Node
    attr_accessor :index, :value, :next_node, :prev_node
    
    def initialize(index, value)
        @index = index
        @value = value
        @next_node = nil
        @prev_node = nil
    end
    
    def to_s
        "[#{@index}: #{@value}]"
    end
end
  
class Deque
    attr_accessor :front, :back
    
    def initialize()
        @front = nil
        @back = nil
    end
  
    def push_front(node)
        if @front == nil
            node.next_node = nil
            node.prev_node = nil
            @front = node
            @back = node
        else
            node.next_node = @front
            @front.prev_node = node
            @front = node
            node.prev_node = nil
        end
    end
    
    def push_back(node)
        if @back == nil
            node.next_node = nil
            node.prev_node = nil
            @front = node
            @back = node
        else
            node.prev_node = @back
            @back.next_node = node
            @back = node
            node.next_node = nil
        end
    end
    
    def empty?
        @front.nil?
    end
    
    def pop_front
        unless self.empty?
            result = @front
            @front = @front.next_node
            if @front.nil?
                @back = nil
            else
                @front.prev_node = nil
            end
            result.prev_node = nil
            result.next_node = nil
            return result
        else
            return nil
        end
    end
    
    def pop_back
        unless self.empty?
            result = @back
            @back = @back.prev_node
            if @back.nil?
                @front = nil
            else
                @back.next_node = nil
            end
            result.prev_node = nil
            result.next_node = nil
            return result
        else
            return nil
        end
    end
    
    def print(front = true)
        result = ""
        if front
            ptr = @front
            while ptr != nil
                result += "#{ptr} -> "
                ptr = ptr.next_node
            end
            result = result[0 ... -4]
        else
            ptr = @back
            while ptr != nil
                result += "#{ptr} -> "
                ptr = ptr.prev_node
            end
            result = result[0 ... -4]
        end
        result
    end
    
    def to_s
        self.print
    end
    
    def get_front
        @front.nil? ? nil : @front.value
    end
    
    def get_back
        @back.nil? ? nil : @back.value
    end
    
end
  
  
def sliding_maximum(k, array)
    array = array.each_with_index.map { |x,i| [i, x] }

    result = []
    imp_els = Deque.new

    array[0 ... k].each do |item|
        i = item[0]
        val = item[1]
        
        unless imp_els.empty?
            while !imp_els.empty? and imp_els.get_back < val
                imp_els.pop_back
            end
        end
    
        imp_els.push_back(Node.new(i, val))
    end

    array[k ... array.length].each do |item|
        i = item[0]
        val = item[1]
        
        result << imp_els.get_front
        
        while !imp_els.empty? and !((i - k + 1) .. i).include?(imp_els.front.index)
            imp_els.pop_front
        end
        
        while !imp_els.empty? and imp_els.back.value < val
            imp_els.pop_back
        end
        
        imp_els.push_back(Node.new(i, val))
    end
    
    result << imp_els.get_front
    
    return result
end
  
puts sliding_maximum(3, [1, 3, 5, 7, 9, 2])
# => [5, 7, 9, 9]
puts sliding_maximum(4, [9,6,11,8,10,5,4,13,93,14])
# => [11, 11, 11, 10, 13, 93, 93]