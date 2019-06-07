class Node
    attr_accessor :value, :next
    
    def initialize(number, next_node = nil)
        @value = number
        @next = next_node
    end
    
end
  
class Stack
    attr_accessor :top, :max
    
    def initialize()
        @top = nil
    end
  
    def push(number)
      # Update max
        if top.nil?
            @max = number
        elsif number > @max
            prev_max = @max
            @max = number
            number = 2 * number - prev_max
        end
        # Add new node
        node = Node.new(number)
        if @top.nil?
            @top = node
        else
            node.next = @top
            @top = node
        end
    end
    
    def get_top
        @top.nil? ? nil : @top.value
    end
    
    def pop
        top_node = @top
        @top = @top.next unless @top.nil?
        if top_node.nil? 
            return nil
        elsif top_node.value <= @max 
            return top_node.value 
        else
            top_value = @max
            @max = 2 * @max - top_node.value
            return top_value
        end
    end
    
    def max
        @top.nil? ? nil : @max
    end
    
    def to_s
        rep = ""
        ptr = @top
        while !ptr.nil?
            rep += "#{ptr.value}->"
            ptr = ptr.next
        end
        rep = rep[0...-2]
    end
  
end
  
puts "New stack"
stack = Stack.new

# puts "push 3"
# stack.push(3)
# puts "Stack: #{stack}"

# puts "push 5"
# stack.push(5)
# puts "Stack: #{stack}"

# puts "Minimum: #{stack.min}"
# # => 3

# puts "pop: #{stack.pop}"
# puts "Stack: #{stack}"

# puts "push 7"
# stack.push(7)
# puts "Stack: #{stack}"

# puts "Minimum: #{stack.min}"
# # => 3

# puts "push 2"
# stack.push(2)
# puts "Stack: #{stack}"

# puts "Minimum: #{stack.min}"
# # => 2

# puts "pop: #{stack.pop}"
# puts "Stack: #{stack}"

# puts "Minimum: #{stack.min}"
# # => 3

stack = Stack.new
array = [3, 5, 2, 1, 1, -1]

array.each do |i|
    stack.push(i)
    puts "Push #{i}; Max: #{stack.max}; Stack: #{stack};"
end
  
array.length.times do
    puts "Popped: #{stack.pop}; Max: #{stack.max}; Stack: #{stack}"
end
  
stack.push(4)
puts "Push #{4}; Max: #{stack.max}; Stack: #{stack};"