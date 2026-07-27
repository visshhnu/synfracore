# Data Structures & Algorithms — Learning Roadmap

## Estimated Time to Placement-Ready
**10-14 weeks** of consistent practice (1-2 hours/day) — DSA is the area of CS education where passive reading provides the least value; genuine interview readiness comes almost entirely from repeated, deliberate problem-solving, so this timeline assumes daily practice, not just reading through pattern explanations.

## Phase 1: Core Structures (Week 1-3)

- Arrays, strings, linked lists, stacks, and queues — both using them and understanding their internal behavior
- Complete the Fundamentals section in this course
- Complete Project 1 (data structures from scratch) from this course's Projects section

**Checkpoint:** can you implement a singly linked list's insert and delete operations from scratch, correctly handling the empty-list and single-node edge cases, without referring to notes?

## Phase 2: Trees, Recursion, and Basic Patterns (Week 3-6)

- Recursion (and specifically, being able to trace through a recursive call stack by hand)
- Binary trees, binary search trees, and tree traversals (in-order, pre-order, post-order, level-order)
- Two-pointer and sliding-window patterns for array/string problems
- Complete the Intermediate section

**Checkpoint:** given an unfamiliar array problem, can you correctly identify whether it's a two-pointer, sliding-window, or neither pattern — before writing any code?

## Phase 3: Graphs, Dynamic Programming, and Applied Practice (Week 6-10)

- Graph representations and traversals (BFS, DFS), and when each is the right tool
- Dynamic programming — starting from recognizing overlapping subproblems, not memorizing specific DP problems
- Complete Project 2 (complexity-analysis problem log) from this course's Projects section
- Solve problems across all topics covered so far, mixed rather than one-topic-at-a-time, to build real pattern-recognition speed

**Checkpoint:** can you explain, in your own words, what makes a problem a dynamic-programming problem — not just recite "it has overlapping subproblems and optimal substructure" without being able to identify it in a new problem?

## Phase 4: Algorithm Depth and Interview Readiness (Week 10-14)

- Sorting and searching algorithms in depth — not just using them, but understanding their real-world performance characteristics
- Complete Project 3 (sorting/searching benchmark suite) and review this course's Interview Q&A section
- Do timed mock interviews — DSA interviews are as much about performing under time pressure as about knowing the material

## Skills You'll Build

| Skill Area | What You'll Learn |
|---|---|
| Core Structures | Arrays, linked lists, trees, graphs, and their real trade-offs |
| Pattern Recognition | Identifying which technique an unfamiliar problem calls for |
| Complexity Analysis | Stating and justifying time/space complexity confidently |
| Algorithmic Thinking | Recursion, dynamic programming, and greedy approaches |
| Interview Performance | Solving correctly under real time pressure, and explaining your reasoning out loud |

## Weekly Study Plan

```
Monday:    New pattern/concept — fundamentals/intermediate section + examples
Tuesday:   5-8 problems specifically on that pattern
Wednesday: Mixed-topic problems (review + reinforce earlier patterns)
Thursday:  Re-solve, without notes, any problem from the past 2 weeks
           that gave you trouble
Friday:    Review interview-style questions, explain your reasoning out loud
Weekend:   A longer timed practice session, or work on a portfolio project
```

## Red Flags to Avoid

- ❌ Memorizing specific solutions instead of recognizing the underlying pattern — the same pattern reappears in dozens of superficially different problems
- ❌ Jumping to a solution without first restating the problem and clarifying constraints — real interviews penalize skipping this step
- ❌ Never stating time/space complexity out loud while solving — build this habit from day one, not right before an interview
- ❌ Only practicing easy problems in your comfort zone — genuine progress requires regularly attempting problems that make you stuck
- ❌ Not tracking which patterns you're actually weak in — "I've solved 200 problems" means less than "I've solved 200 problems across every major pattern, with the weak ones identified and re-drilled"

## Resources

- **This course**: Overview → Fundamentals → Intermediate → Advanced → Labs → Projects
- **LeetCode/HackerRank**: for volume practice across patterns, with a large community explaining alternative approaches
- **Previous years' placement question sets**: many companies reuse or lightly modify recurring question patterns
- **A whiteboard or plain paper**: tracing through recursion and pointer manipulation by hand builds understanding that typing code alone doesn't

## Getting Placement-Ready

1. **Portfolio**: the 3 projects in this course's Projects section, particularly the from-scratch implementations — being able to explain how a hash map actually works internally is a genuine differentiator
2. **Problem volume with structure**: raw problem count matters less than coverage across patterns and honest tracking of weak areas
3. **Timed practice**: DSA interviews are timed — practicing without a clock doesn't build the specific skill of solving correctly under pressure
4. **Explain out loud, every time**: interviewers evaluate your reasoning process, not just your final code — practice narrating your thinking, including false starts and how you recovered from them
5. **Know your own complexity analysis cold**: being unable to state why your solution is O(n log n) rather than O(n²) is one of the most common ways strong coders lose points in DSA interviews
