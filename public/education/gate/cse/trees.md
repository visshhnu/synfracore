# Trees

## Why This Chapter Matters
Trees are a major GATE topic — 8-12 marks. BST operations, AVL trees, heaps, and tree traversals with their complexities are all tested. Properties and height calculations are favourite questions.

## Core Concepts

### 1. Binary Tree Properties
- Max nodes at level k: 2^k
- Max nodes in binary tree of height h: 2^(h+1) - 1
- Min height for n nodes: floor(log2 n)
- Relationship: n = i + l (internal + leaf nodes); for full binary tree: l = i + 1

**Full binary tree:** Every node has 0 or 2 children.
**Complete binary tree:** All levels full except possibly last, last level left-filled.
**Perfect binary tree:** All leaves at same level, all internal nodes have 2 children.

### 2. Tree Traversals

**Inorder (LNR):** Left, Node, Right — gives sorted order for BST
**Preorder (NLR):** Node, Left, Right — used to create copy of tree
**Postorder (LRN):** Left, Right, Node — used to delete tree

**Level order:** BFS using queue.

All traversals: O(n) time, O(h) space (h = height, due to recursion stack or queue).

### 3. Binary Search Tree (BST)

**Property:** For every node: all left subtree values < node < all right subtree values.

**Operations:**
- Search: O(h) — follow BST property
- Insert: O(h) — search for position, insert
- Delete: 3 cases: leaf (remove), one child (replace), two children (replace with inorder successor)

**BST height:** O(log n) balanced, O(n) worst case (sorted input = skewed BST)

**Number of BSTs with n keys:** C(n) = Catalan number = C(2n,n)/(n+1)

### 4. AVL Trees (Self-Balancing BST)

**Balance factor = height(left) - height(right)** for every node.
AVL property: balance factor must be -1, 0, or +1.

**Rotations (rebalancing):**
- LL case: Right rotation
- RR case: Left rotation
- LR case: Left rotation then Right rotation
- RL case: Right rotation then Left rotation

**Height of AVL tree:** O(log n) always.
**Search, Insert, Delete:** O(log n) always.

### 5. Heaps

**Max-heap:** Parent >= both children. **Min-heap:** Parent <= both children.
**Stored as complete binary tree** (in array: parent of i is (i-1)/2; children are 2i+1 and 2i+2)

**Operations:**
- Insert: add at end, heapify up — O(log n)
- Delete max/min: remove root, put last element at root, heapify down — O(log n)
- Build heap from array: O(n) (start from last internal node, heapify down)

**Heap sort:** Build heap O(n) + n deletions O(n log n) = O(n log n) total, O(1) space.

### 6. B-Trees (for databases)
- Self-balancing, all leaves at same level
- Used in databases and file systems for disk I/O optimization
- Order m B-tree: each node has between ceil(m/2)-1 and m-1 keys.

## PYQs
**GATE 2024:** A BST has n nodes. What is the time complexity of finding the kth smallest element using inorder traversal?
O(n) — must traverse up to k nodes in inorder traversal.

**GATE 2023:** Min and max number of nodes in AVL tree of height 5?
Min nodes: N(h) = N(h-1) + N(h-2) + 1. N(0)=1, N(1)=2, N(2)=4, N(3)=7, N(4)=12, N(5)=20.
Max nodes = 2^6 - 1 = 63.

**GATE 2022:** A complete binary tree with 15 nodes. How many leaf nodes?
For complete binary tree with 2^h - 1 nodes (perfect), leaves = 2^(h-1). 15 = 2^4-1, so h=4, leaves = 8.

## Revision Notes
```
BST: left < node < right. O(h) for all operations.
   h = O(log n) avg, O(n) worst (skewed).

AVL: BST + balance factor (-1,0,1). O(log n) guaranteed.
   Rotations: LL->R, RR->L, LR->LR, RL->RL

HEAP: Complete binary tree + heap property. O(log n) insert/delete.
   Build heap: O(n). Heap sort: O(n log n).

TRAVERSALS: Inorder=sorted(BST), Preorder=copy, Postorder=delete.
   All O(n) time, O(h) space.

CATALAN: Number of BSTs with n keys = C(2n,n)/(n+1)
```
