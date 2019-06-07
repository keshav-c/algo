# Queue

Create a Queue with the two methods add and remove. Use your LinkedList class to keep track of the elements internally.

## Example

This is an example of a test case:

    queue = Queue.new
    queue.add(3)
    queue.add(5)
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

The numbers come out in the order they went in, and the final remove returns nothing since the queue is empty.