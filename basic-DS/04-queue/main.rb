# Start with your code from LinkedList challenge.
class Node
    attr_accessor :value, :next_node
    
    def initialize(value, next_node = nil)
        @value = value
        @next_node = next_node
    end
end
  
class Queue
    attr_accessor :head, :tail
    
    def initialize()
        @head = nil
        @tail = nil
    end
  
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
    
    def remove
        result = self.remove_node
        if !result.nil?
            result = result.value
        end
        result
    end
    
    def remove_node
        removed_node = nil
        if @head == nil
            return nil
        else
            removed_node = @head
            @head = @head.next_node
            if @head == nil
                @tail = nil
            end
            return removed_node
        end
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
  
queue = Queue.new
puts queue
queue.add(3)
queue.add(5)
puts queue
puts queue.remove
# => 3

queue.add(2)
queue.add(7)
puts queue.remove
# => 5

puts queue.remove
# => 2

puts queue.remove
# => 7

puts queue.remove
# => 