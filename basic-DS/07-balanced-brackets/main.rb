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
  
    def push(bracket)
        node = Node.new(bracket)
        if @top.nil?
            @top = node
        else
            node.next_node = @top
            @top = node
        end
    end
    
    def pop()
        popped_node, result = @top, nil
        if !popped_node.nil?
            @top = @top.next_node
            result = popped_node.value
        end
        result
    end

    def get_top()
        @top.nil? ? nil : @top.value
    end
  
    def empty?
        @top.nil?
    end
    
end
  
def balanced_brackets?(string)
    opening_bracket = {
        ")" => "(",
        "}" => "{",
        "]" => "["
    }
    bracket_stack = Stack.new
    string.each_char do |c|
        if "{([".include?(c)
            bracket_stack.push(c)
        elsif "})]".include?(c)
            unless bracket_stack.pop == opening_bracket[c]
                return false
            end
        end
    end
    return bracket_stack.empty?
end

puts balanced_brackets?('(hello)[world]')
# => true

puts balanced_brackets?('([)]')
# => false

puts balanced_brackets?('[({a}{}{df})(2[32])]')
# => true

puts balanced_brackets?("(hello")
# => false

puts balanced_brackets?("([)]")
# => false

puts balanced_brackets?("as)")
# => false

puts balanced_brackets?("{wari}")
# => true
