# DSA — Interview Questions

**What is the time complexity of sorting algorithms?**

| Algorithm | Best | Average | Worst | Space | Stable |
|---|---|---|---|---|---|
| Bubble Sort | O(n) | O(n²) | O(n²) | O(1) | Yes |
| Selection Sort | O(n²) | O(n²) | O(n²) | O(1) | No |
| Insertion Sort | O(n) | O(n²) | O(n²) | O(1) | Yes |
| Merge Sort | O(n log n) | O(n log n) | O(n log n) | O(n) | Yes |
| Quick Sort | O(n log n) | O(n log n) | O(n²) | O(log n) | No |
| Heap Sort | O(n log n) | O(n log n) | O(n log n) | O(1) | No |
| Counting Sort | O(n+k) | O(n+k) | O(n+k) | O(k) | Yes |

**Explain BFS vs DFS and when to use each.**
BFS uses a queue, explores level by level. Use for: shortest path in unweighted graphs, finding nodes at distance k, detecting cycles in undirected graphs, minimum steps problems. DFS uses a stack (recursion), explores depth first. Use for: detecting cycles in directed graphs, topological sort, finding all paths, maze solving, tree traversals. BFS guarantees shortest path; DFS is more memory efficient for deep graphs.

**What is dynamic programming?**
DP solves problems by breaking them into overlapping subproblems and storing results to avoid recomputation. Two approaches: top-down (memoization — recursion + cache) and bottom-up (tabulation — fill a table iteratively). Identify DP problems by: optimal substructure (optimal solution contains optimal sub-solutions) and overlapping subproblems (same subproblems solved multiple times). Common patterns: 1D array, 2D grid, string DP, knapsack, interval DP.

**Explain the sliding window technique.**
Sliding window maintains a window of elements and slides it across the array. Avoids nested loops, reducing O(n²) to O(n). Fixed window: maintain sum/count of k elements. Variable window: expand right pointer until valid, shrink left until invalid. Use when: "find max/min subarray of size k", "longest substring without repeating characters", "minimum window substring".

**What is the difference between a tree and a graph?**
A tree is a connected acyclic graph with N nodes and N-1 edges. Every tree is a graph, but not vice versa. Trees have a root, parent-child relationships, and exactly one path between any two nodes. Graphs can have cycles, multiple paths between nodes, disconnected components, and directed or undirected edges. Tree traversal (BFS/DFS) visits all nodes exactly once. Graph traversal needs a `visited` set to avoid revisiting.
