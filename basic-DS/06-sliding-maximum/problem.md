# Sliding Maximum

For every k continuous numbers in an array, print the  largest number. This challenge is easy to "brute-force", but see if you  can find the optimal solution.

- Simple Solution: O(nk)
- Better Solution: O(n log k)
- Optimal Solution: O(n)

## Example

This is an example of a test case:

    sliding_maximum(3, [1, 3, 5, 7, 9, 2])
    # => [5, 7, 9, 9]

The first argument is `k`, which is `3` in this case. The output is the largest number for each group of 3 numbers in the list:

| 3 numbers | Largest |
| --------- | ------- |
| 1 3 5     | 5       |
| 3 5 7     | 7       | 
| 5 7 9     | 9       | 
| 7 9 2     | 9       |