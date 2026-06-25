# DSA Interview Questions

## Arrays & Strings
**Q: Find two numbers that sum to a target.**
Use a hash map: iterate the array, check if complement exists in map. O(n) time, O(n) space.

**Q: Maximum subarray sum (Kadane's Algorithm)?**
Track current_sum and max_sum. If current_sum < 0, reset to 0. O(n) time.

**Q: Reverse a string in-place?**
Two pointers from both ends, swap until they meet.

## Linked Lists
**Q: Detect a cycle in a linked list?**
Floyd's algorithm: slow pointer moves 1 step, fast moves 2. If they meet, cycle exists.

**Q: Merge two sorted linked lists?**
Recursively or iteratively compare heads and build merged list.

**Q: Find middle of linked list?**
Slow/fast pointers: when fast reaches end, slow is at middle.

## Trees
**Q: Level-order traversal of a binary tree?**
Use a queue (BFS). Enqueue root, process level by level.

**Q: Validate a Binary Search Tree?**
Pass min/max bounds recursively. Each node must satisfy min < node.val < max.

**Q: Lowest Common Ancestor of two nodes?**
If both nodes < root, go left. If both > root, go right. Otherwise root is LCA.

## Graphs
**Q: Detect cycle in an undirected graph?**
DFS with visited set. If neighbor is visited and not parent, cycle exists.

**Q: Shortest path in unweighted graph?**
BFS from source. First time a node is visited is its shortest path.

**Q: Number of islands problem?**
DFS/BFS to mark connected land cells. Count number of DFS initiations.

## Dynamic Programming
**Q: Longest Common Subsequence?**
dp[i][j] = LCS of s1[0..i] and s2[0..j]. If chars match, dp[i][j] = dp[i-1][j-1]+1.

**Q: 0/1 Knapsack problem?**
dp[i][w] = max value with i items and capacity w. Include or exclude each item.

**Q: Coin change minimum coins?**
dp[amount] = min coins needed. Iterate all coins for each amount.

## Sorting & Searching
**Q: QuickSort worst case and how to avoid it?**
O(n^2) with bad pivots (sorted input). Use random pivot or median-of-three.

**Q: Binary search on a rotated sorted array?**
Identify which half is sorted, check if target is in that half, recurse accordingly.

**Q: Find kth largest element?**
Use min-heap of size k (O(n log k)) or QuickSelect O(n) average.

## Advanced
**Q: Design an LRU Cache?**
Use HashMap + doubly linked list. O(1) get and put. HashMap for key->node lookup.

**Q: Trie for word search?**
TrieNode has children map and isEnd flag. Insert/search in O(L) where L = word length.

**Q: Serialize and deserialize a binary tree?**
BFS or DFS with null markers. Reconstruct from the serialized string.

## Complexity Cheat Sheet
- HashMap ops: O(1) average
- Binary Search: O(log n)
- DFS/BFS: O(V+E)
- Merge Sort: O(n log n)
- Heap insert/delete: O(log n)
