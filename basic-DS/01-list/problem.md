# Lists  

Create your own LinkedList  class for storing integers which should include two methods:  
1. `add(number)` - Add a new Node to the end of the list with a value of number. Nothing needs to be returned. 
2. `get(index)` - Return the value of the Node at position `index` in the List.   

## Example  

This is an example of a test case:  

    list = LinkedList.new

    list.add(3)
    list.add(5)
    puts list.get(1)
    # => 5


The 2 add operations create the list: `[3, 5]`. 
The get operation, gets the number located at position `1`. 