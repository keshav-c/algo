class Node
    attr_accessor :value, :next_node
    
    def initialize(value, next_node = nil)
        @value = value
        @next_node = next_node
    end
end
  
class Stack
    attr_accessor :top
    
    def initialize()
        @top = nil
    end
  
    def push(number)
        node = Node.new(number)
        if @top.nil?
            @top = node
        else
            node.next_node = @top
            @top = node
        end
    end
  
    def get_top()
        @top.nil? ? nil : @top.value
    end
  
    def pop_node()
        popped_node = @top
        if !popped_node.nil?
            @top = @top.next_node
        end
        popped_node
    end
    
    
    def pop()
        result = self.pop_node
        if !result.nil?
            return result.value
        else
            return nil
        end
    end
    
end
  
stack = Stack.new
stack.push(3)
stack.push(5)
puts stack.pop
# => 5

stack.push(2)
stack.push(7)
puts stack.pop
# => 7

puts stack.pop
# => 2

puts stack.pop
# => 3