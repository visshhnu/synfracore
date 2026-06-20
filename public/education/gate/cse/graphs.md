# Graphs

## Why This Chapter Matters
Graphs are one of the most important GATE CSE topics — 6-10 marks per paper. BFS, DFS, shortest paths (Dijkstra, Bellman-Ford, Floyd-Warshall), minimum spanning trees (Prim's, Kruskal's), and topological sort are all regularly tested.

## Prerequisites
- Arrays and Linked Lists (graph representations)
- Queues (for BFS) and Stacks (for DFS)
- Trees (special case of graphs)

---

## Core Concepts

### 1. Graph Terminology

**Graph G = (V, E)** where V = vertices (nodes), E = edges (connections)

**Types:**
- Directed (digraph) vs Undirected
- Weighted vs Unweighted
- Connected vs Disconnected
- Cyclic vs Acyclic (DAG = Directed Acyclic Graph)

**Degree:**
Undirected: degree(v) = number of edges at v
Directed: in-degree(v) = edges coming in; out-degree(v) = edges going out

**Handshaking Lemma:** Sum of all degrees = 2|E|

### 2. Graph Representations

**Adjacency Matrix:** V x V matrix, A[i][j] = 1 if edge (i,j) exists.
Space: O(V^2) | Edge check: O(1) | All neighbours: O(V)
Best for dense graphs.

**Adjacency List:** Array of linked lists.
Space: O(V + E) | Edge check: O(degree) | All neighbours: O(degree)
Best for sparse graphs.

### 3. BFS (Breadth-First Search)

```
BFS(G, s):
  visited[s] = True; queue.enqueue(s)
  while queue not empty:
    u = queue.dequeue()
    for each neighbour v of u:
      if not visited[v]:
        visited[v] = True
        queue.enqueue(v)
```

**Time complexity:** O(V + E)
**BFS tree:** Shortest path tree (in terms of number of edges) from source.
**Shortest path (unweighted graph):** BFS gives minimum hops from source to all vertices.

### 4. DFS (Depth-First Search)

```
DFS(G, u):
  visited[u] = True
  for each neighbour v of u:
    if not visited[v]:
      DFS(G, v)
```

**Time complexity:** O(V + E)
**DFS Applications:**
- Cycle detection (back edge = cycle)
- Topological sorting (for DAG)
- Finding strongly connected components (Kosaraju's/Tarjan's)
- Biconnected components

**DFS tree edge types:**
- Tree edge: edge in DFS tree
- Back edge: to ancestor (indicates cycle in directed graph)
- Forward edge: to descendant (directed graphs only)
- Cross edge: to different subtree (directed graphs only)

### 5. Topological Sort

**Definition:** Linear ordering of vertices of a DAG such that for every directed edge (u, v), u comes before v.

**Algorithm using DFS:**
Do DFS, push each vertex to stack when DFS returns from it. Pop all = topological order.

**Kahn's Algorithm (using in-degree):**
1. Find all vertices with in-degree 0, add to queue
2. While queue not empty: dequeue u, add to result, decrease in-degree of all neighbours, add neighbours with in-degree 0 to queue
3. If result has all vertices = valid topological sort; else = cycle exists

**GATE favourite:** If topological sort is unique -> only one path exists through the DAG.

### 6. Shortest Path Algorithms

**Dijkstra's Algorithm (non-negative weights):**
- Greedy approach, uses priority queue (min-heap)
- Time: O((V + E) log V) with binary heap
- Cannot handle negative weight edges

```
Initialize dist[] = infinity, dist[src] = 0
Priority queue with (dist, vertex)
While PQ not empty:
  Extract min dist vertex u
  For each neighbour v:
    if dist[u] + w(u,v) < dist[v]:
      dist[v] = dist[u] + w(u,v)
      Add v to PQ
```

**Bellman-Ford Algorithm (handles negative weights):**
- Dynamic programming approach
- Time: O(VE)
- Detects negative cycles
- Relax all edges V-1 times: if edge (u,v), dist[v] = min(dist[v], dist[u] + w(u,v))

**Floyd-Warshall (all pairs shortest path):**
- DP on intermediate vertices
- Time: O(V^3), Space: O(V^2)
- dp[i][j][k] = shortest path from i to j using only vertices 1..k as intermediates
- Key recurrence: dp[i][j][k] = min(dp[i][j][k-1], dp[i][k][k-1] + dp[k][j][k-1])

### 7. Minimum Spanning Tree (MST)

**MST:** Spanning tree of minimum total edge weight.
A spanning tree has exactly V-1 edges.

**Kruskal's Algorithm:**
1. Sort all edges by weight
2. For each edge (in order), add if it doesn't create a cycle (use Union-Find)
3. Stop when V-1 edges added
Time: O(E log E) = O(E log V)

**Prim's Algorithm:**
1. Start with any vertex
2. Greedily add the minimum weight edge connecting tree to non-tree vertex
3. Repeat until all vertices included
Time: O(E log V) with binary heap, O(V^2) without

**Cut Property:** For any cut of the graph, the minimum weight edge crossing the cut is in every MST.

---

## Solved Examples (GATE-style)

### Example 1 — BFS
**Q:** Graph: 1-2, 1-3, 2-4, 3-4, 4-5. BFS from 1. Order of vertices?
Queue: [1] -> dequeue 1, add 2,3: [2,3] -> dequeue 2, add 4: [3,4] -> dequeue 3 (4 already visited): [4] -> dequeue 4, add 5: [5] -> dequeue 5.
**BFS order: 1, 2, 3, 4, 5**

### Example 2 — Dijkstra
**Q:** Graph with edges A-B(4), A-C(2), B-D(3), C-D(1), C-B(1). Shortest path from A to D?
Path A->C->B->D: 2+1+3 = 6
Path A->C->D: 2+1 = **3** (shortest!)
Path A->B->D: 4+3 = 7

### Example 3 — MST (Kruskal's)
**Q:** Edges: (1,2,4), (1,3,1), (2,3,2), (2,4,5), (3,4,3). Find MST weight.
Sort: (1,3,1), (2,3,2), (3,4,3), (1,2,4), (2,4,5)
Add (1,3,1): no cycle | Add (2,3,2): no cycle | Add (3,4,3): no cycle | 3 edges for 4 vertices = done
MST weight = 1 + 2 + 3 = **6**

---

## PYQs (GATE CSE)

**GATE 2024:** Bellman-Ford algorithm detects negative cycles. How many iterations needed to find shortest paths if no negative cycle?
**V - 1 iterations** (where V = number of vertices)

**GATE 2023:** A directed graph G has n vertices and no cycles. Max edges in G?
In a DAG with n vertices, max edges = n(n-1)/2 (complete DAG with one topological ordering).

**GATE 2022:** What does a back edge in DFS of undirected graph indicate?
A back edge indicates a **cycle** in the graph.

**GATE 2021:** Floyd-Warshall time complexity?
O(V^3) — three nested loops over all vertices.

---

## MCQ Practice

**Q1.** BFS on an unweighted graph finds:
(A) Minimum spanning tree (B) Shortest path (in terms of edges) (C) Topological order (D) All of above
Answer: B

**Q2.** Kruskal's algorithm uses which data structure for cycle detection?
(A) Stack (B) Queue (C) Union-Find/Disjoint Set (D) Hash Table
Answer: C

**Q3 (Hard).** Number of distinct MSTs for graph with all equal weight edges (n vertices, all edges present):
Every spanning tree is an MST. Number of spanning trees of complete graph K_n = n^(n-2) (Cayley's formula).
For n=4: **4^2 = 16**

---

## Revision Notes

```
GRAPH REPRESENTATIONS:
Adjacency Matrix: O(V^2) space, O(1) edge check, dense graphs
Adjacency List: O(V+E) space, O(degree) edge check, sparse graphs

BFS: O(V+E), uses QUEUE, finds SHORTEST PATH (unweighted)
DFS: O(V+E), uses STACK (or recursion), finds cycles, topological sort

TOPOLOGICAL SORT: Only for DAG, DFS-based or Kahn's (in-degree based)
If topological order not unique -> multiple valid orderings -> graph has parallel paths

SHORTEST PATH:
Dijkstra: O((V+E)log V), non-negative weights only
Bellman-Ford: O(VE), handles negative weights, detects negative cycles
Floyd-Warshall: O(V^3), all-pairs shortest path

MST:
Kruskal: O(E log E), sort edges, Union-Find for cycle detection
Prim: O(E log V) with heap, grow from one vertex

IMPORTANT:
BFS level = shortest distance from source
V-1 edges in any spanning tree
n(n-1)/2 edges in complete undirected graph
```

## Related Topics
- Trees (special case of graphs, no cycles)
- Arrays (graph representations use arrays)
- GATE: Algorithms, complexity analysis, algorithm design
