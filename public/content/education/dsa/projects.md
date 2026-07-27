# Data Structures & Algorithms — Portfolio Projects

Build these to actually internalize how data structures behave, not just recognize them on a whiteboard — and to have something concrete to walk through in a placement interview.

## Project 1: Data Structures From Scratch, With a Test Suite (Beginner)

**Time:** 3-4 days

Implement 3-4 core data structures yourself — a dynamic array, a singly linked list, a stack, and a queue — without using your language's built-in equivalents, then write tests proving each operation works correctly.

### Steps

1. Implement each structure's core operations (insert, delete, search, and any structure-specific operations like push/pop for a stack)
2. Write test cases for the normal path AND the edge cases — empty structure, single element, operating past capacity
3. For the dynamic array specifically, implement and test the resizing logic (what happens when it's full and you insert one more element?)
4. Document each operation's time complexity in comments or a README table

### Skills Demonstrated
- Implementing data structures at the mechanism level, not just using them
- Edge-case-driven testing
- Complexity analysis in practice, not just theory

### Repository Name
`dsa-structures-from-scratch`

---

## Project 2: A Complexity-Analysis Problem Log (Intermediate)

**Time:** 1-2 weeks (ongoing)

Solve 25-30 problems spanning arrays, strings, trees, and graphs, but the actual deliverable is the analysis, not just accepted solutions — for each problem, document your approach, why you chose it, and its real time/space complexity.

### Steps

1. Select problems spanning at least 4 distinct topic areas (e.g., two-pointer/sliding-window, tree traversal, graph BFS/DFS, dynamic programming)
2. For each, write your solution AND a short note: what's the brute-force approach, why is it suboptimal, and what insight gets you to a better solution
3. State the exact time/space complexity — not "it's fast," but "O(n log n) because of the sort, O(1) extra space because it's in-place"
4. Revisit any problem you struggled with a week later and re-solve it independently, without looking at your notes first
5. Group problems by pattern (not just by data structure) — recognizing "this is a sliding-window problem" is the actual interview skill being tested

### Skills Demonstrated
- Pattern recognition across problems, not memorized solutions
- Rigorous complexity analysis
- Structured, reviewable practice — not just a pile of solved problems

---

## Project 3: Implement and Compare — Sorting/Searching Algorithm Suite (Advanced)

**Time:** 1-2 weeks

Implement multiple sorting algorithms (bubble, merge, quick, heap) and searching algorithms (linear, binary) from scratch, then empirically benchmark them against each other on real input data to see whether the theoretical complexity actually matches observed behavior.

### Steps

1. Implement each algorithm correctly, from scratch — not adapted from a tutorial you don't fully understand
2. Generate test inputs of varying size and characteristics (random, already-sorted, reverse-sorted, mostly-sorted) — some algorithms perform very differently depending on input shape
3. Benchmark actual runtime across these inputs and plot or tabulate the results
4. Write an analysis: does merge sort's O(n log n) actually outperform quicksort's worst-case O(n²) on the reverse-sorted input, as theory predicts? Where does the crossover happen for smaller inputs?
5. Explain, in writing, why quicksort is often faster in practice despite having a worse worst-case complexity than merge sort

### Skills Demonstrated
- Implementing classic algorithms correctly and confidently
- Connecting theoretical complexity to observed, empirical behavior
- Critical analysis, not just "I implemented the algorithms"

### Repository Name
`dsa-sorting-search-benchmarks`

---

## Tips for Great Projects

**Implement it yourself before using the library version.** Using `Collections.sort()` or a built-in `HashMap` is fine in real code — but if you've never implemented the underlying structure yourself, you don't actually understand its performance characteristics, and that gap shows up in interviews.

**Always attach a complexity analysis.** A working solution without stated time/space complexity is an incomplete answer in almost every DSA interview context — get in the habit of stating it every time, even in practice.

**Revisit problems you got wrong.** Recognizing a solution when you see it again is not the same skill as producing it independently — the re-solve-without-notes step is where the actual learning happens.

**For placement interviews specifically:** be ready to explain trade-offs, not just implementations — when would you choose a hash map over a balanced BST for a given problem, and why? This kind of comparative reasoning is tested constantly.

## Project Checklist
- [ ] At least one data structure implemented fully from scratch, with tests
- [ ] A problem log covering at least 4 distinct topic areas with stated complexity for each
- [ ] At least one project comparing theoretical complexity against empirical/benchmarked behavior
- [ ] Comfortable explaining any implementation's time/space complexity without hesitation
- [ ] Problems organized by pattern, not just by which data structure they used
