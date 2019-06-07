# Min Stack

Create a Stack that contains the standard push and pop methods. It should also contain another method min that returns the minimum number in the Stack.

## Extra Credit

All operations should take `O(1)` time.

## Example

This is an example of a test case:

    stack = Stack.new

    stack.push(3)
    stack.push(5)
    puts stack.min
    # => 3

    stack.pop
    stack.push(7)
    puts stack.min
    # => 3

    stack.push(2)
    puts stack.min
    # => 2

    stack.pop
    puts stack.min
    # => 3

Also create a stack that keeps track of the maximum number in it as well. All operations should be of `O(1)` complexity