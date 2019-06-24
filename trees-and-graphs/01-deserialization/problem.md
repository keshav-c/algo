# A Tree in an Array

To store a Binary Tree in an Array, we just need to determine the order that we store the Nodes in. A good order is "**breadth-first**" where we  store the items in order top-down and left-to-right of the tree.

Here's a tree represented as an array:

![Tree as Array](./ar2tree.png)

And this is the tree _unfolded_:

![Tree](./tree.png)

Notice that `5` only has one child Node, so the other child is represented as `0` in the above array. This is OK as long as we don't need to store  actual `0` values.

## Challenge

The input for this challenge will provide an array of numbers in the above **breadth-first** format, and use `0`'s for non-nodes. Can you print out the sum of the Leftmost side of the Tree?

Tip: A number located at position i in an array will have it's left child located at the position 2i+1 in the array. 

**Solution**: I am using a queue instead to populate the tree in a breadth first manner. In the breadthwise serialization, 2<sup>n - 1</sup> values are stored in the array for each level `n` of the tree. The `nil` nodes are all represented by `0`s in the array.

**Note**: Here the `nil` nodes are also completely represented, in that their `left` and `right` children are recorded as `0`s in the serialized array.

### Test case example:

    leftmost_nodes_sum([2, 7, 5, 2, 6, 0, 9])
    # => 11

Go down the left-hand side of the tree to get the sum: `2+7+2 = 11`. You can take a look at the image of the tree above.