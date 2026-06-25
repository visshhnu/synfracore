# Placement Prep Cheatsheet

## DSA Patterns Quick Reference
| Pattern | When to Use | Example |
|---------|------------|---------|
| Sliding Window | Contiguous subarray | Max sum of size k |
| Two Pointers | Sorted array pairs | Two sum |
| Fast/Slow Pointer | Cycle detection | Linked list cycle |
| BFS | Shortest path, level order | Word ladder |
| DFS | Explore all paths | N-queens |
| Binary Search | Sorted search | Find in rotated array |
| Dynamic Programming | Overlapping subproblems | LCS, Knapsack |
| Greedy | Optimal local choices | Activity selection |

## Complexity Cheatsheet
| Algorithm | Time | Space |
|---------|------|-------|
| Binary Search | O(log n) | O(1) |
| Merge Sort | O(n log n) | O(n) |
| Quick Sort | O(n log n) avg | O(log n) |
| BFS/DFS | O(V+E) | O(V) |
| Dijkstra | O((V+E) log V) | O(V) |
| DP - LCS | O(mn) | O(mn) |

## OOP Principles
- **Single Responsibility**: Class does one thing
- **Open/Closed**: Open for extension, closed for modification
- **Liskov Substitution**: Subtypes substitutable for base types
- **Interface Segregation**: Many specific interfaces > one general
- **Dependency Inversion**: Depend on abstractions, not concretions

## SQL Quick Reference
```sql
SELECT name, COUNT(*) as cnt
FROM employees
WHERE dept_id = 10
GROUP BY name
HAVING cnt > 2
ORDER BY cnt DESC
LIMIT 5;

-- Window function
SELECT name, salary,
  RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) as rank
FROM employees;

-- Self join: find employees earning more than their manager
SELECT e.name FROM employees e
JOIN employees m ON e.manager_id = m.id
WHERE e.salary > m.salary;
```

## Common Interview Questions Checklist
- [ ] Reverse a linked list (iterative + recursive)
- [ ] Find middle of linked list
- [ ] Detect cycle in linked list
- [ ] Valid parentheses (stack)
- [ ] Binary search
- [ ] Level order traversal (BFS)
- [ ] Number of islands (DFS/BFS)
- [ ] LRU Cache (HashMap + DLL)
- [ ] Merge sorted arrays
- [ ] Two sum (HashMap)
