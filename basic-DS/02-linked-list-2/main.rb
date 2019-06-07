# Start with your code from last challenge.
class Node
    attr_accessor :value, :next_node
    
    def initialize(value, next_node = nil)
        @value = value
        @next_node = next_node
    end
end
  
class LinkedList
    attr_accessor :head, :tail
    
    def initialize()
        @head = nil
        @tail = nil
    end
    
    # add to end (tail)
    def add(number)
        node = Node.new(number)
        if tail == nil
            @head = node
            @tail = node
        else
            @tail.next_node = node
            @tail = node
        end
    end
  
    def get(index)
        result = self.get_node(index)
        result.nil? ? nil : result.value
    end
    
    def get_node(index)
        if index < 0
            puts "invalid index"
        elsif index == 0
            return @head
        elsif index > 0
            current_node = @head
            index.times do
                current_node = current_node.next_node
                if current_node == nil
                    puts "index out of bounds"
                    return nil
                end
            end
            return current_node
        end
    end
    
    def add_at(index, item)
        if index < 0
            puts "invalid index"
        elsif index == 0
            node = Node.new(item)
            node.next_node = @head
            @head = node
            if @tail == nil
                @tail = head
            end
        elsif index > 0
            new_node = Node.new(item)
            prev_node = self.get_node(index - 1)
            new_node.next_node = prev_node.next_node
            prev_node.next_node = new_node
            if tail == prev_node
                tail = new_node
            end
        end  
    end
    
    def remove(index)
        if @head == nil
            puts "Empty List!"
            return nil
        elsif index < 0
            puts "invalid index"
            return nil
        elsif index == 0
            @head = @head.next_node
            if @head == nil
                @tail = nil
            end
        elsif index > 0
            prev_node = self.get_node(index - 1)
            node = prev_node.next_node
            prev_node.next_node = node.next_node
            if node == @tail
                @tail = prev_node
            end
        end
        return 1
    end
    
    def to_s
        result = ""
        pointer = @head
        while pointer != nil
            result += "#{pointer.value} -> "
            pointer = pointer.next_node
        end
        result[0 ... -4]
    end
    
  end
  
  list = LinkedList.new
  puts "List init: #{list}"
  list.add(3)
  puts "List, add(3): #{list}"
  list.add(5)
  puts "List, add(5): #{list}"
  list.add_at(1, 11)
  puts "List, add_at(1, 11): #{list}"
  list.add_at(0, 13)
  puts "List, add_at(0, 13): #{list}"
  
  puts list.get(2)
  # => 11
  
  puts list.get(3)
  # => 5