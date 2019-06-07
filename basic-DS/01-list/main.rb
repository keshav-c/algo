class Node
    attr_accessor :value, :next_node
    
    def initialize(value, next_node = nil)
        @value = value
        @next_node = next_node
    end
end
  
class LinkedList
    #setup head and tail
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
        if index == 0
            return @head.value
        else
            current_node = @head
            index.times do
                current_node = current_node.next_node
                if current_node == nil
                    return nil
                end
            end
            return current_node.value
        end
    end
end
  
list = LinkedList.new

list.add(3)
list.add(5)
puts list
puts list.get(1)
  