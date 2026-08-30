# Placement Preparation — Advanced

## Dynamic Programming — a worked walkthrough, not just the definition

```python
# Problem: given coin denominations [1, 3, 4], find the minimum
# number of coins to make amount 6.
#
# The DP insight: minCoins(6) depends on minCoins(6-1), minCoins(6-3),
# minCoins(6-4) -- the answer to a smaller version of the same problem.
# This overlapping-subproblem structure is the actual signal that
# says "this is a DP problem," not a vague sense that it's "hard."

def min_coins(coins, amount):
    dp = [float('inf')] * (amount + 1)
    dp[0] = 0  # 0 coins needed to make amount 0

    for a in range(1, amount + 1):
        for c in coins:
            if c <= a:
                dp[a] = min(dp[a], dp[a - c] + 1)

    return dp[amount] if dp[amount] != float('inf') else -1

# Trace for amount=6, coins=[1,3,4]:
# dp[0]=0
# dp[1]=1 (1 coin of 1)
# dp[2]=2 (1+1)
# dp[3]=1 (one coin of 3)
# dp[4]=1 (one coin of 4)
# dp[5]=2 (4+1, better than 3+1+1=3 or 1×5=5)
# dp[6]=2 (3+3, better than 4+1+1=3)
```

The actual interview-level skill being tested here: identifying
that `dp[a]` should be built from `dp[a - c]` for every coin `c`
BEFORE writing any code — most candidates who "know DP" can
recite the concept but freeze when asked to derive this
recurrence relation live for a problem they haven't seen before.
Practicing the derivation step (writing the recurrence in words
first: "the answer for amount A is 1 plus the best answer for
some smaller amount") matters more than memorizing solved
problems, since interview problems are rarely identical to ones
already practiced.

## Graph Traversal — BFS for shortest path, worked

```python
from collections import deque

# Problem: shortest path (fewest edges) from start to target in
# an unweighted graph represented as an adjacency list.
def shortest_path(graph, start, target):
    if start == target:
        return 0
    visited = {start}
    queue = deque([(start, 0)])  # (node, distance)

    while queue:
        node, dist = queue.popleft()
        for neighbor in graph[node]:
            if neighbor == target:
                return dist + 1
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append((neighbor, dist + 1))
    return -1  # target unreachable
```

Why BFS specifically (not DFS) for shortest path on an unweighted
graph: BFS explores level by level (all nodes at distance 1
before any at distance 2), so the *first* time it reaches the
target is guaranteed to be via the shortest path — DFS explores
one path fully before backtracking, and can easily find a longer
path to the target before ever finding the shortest one. This
"BFS = shortest path on unweighted graphs" association is a
high-value, frequently-tested fact — Dijkstra's algorithm
(covered in the Computer Networks academy's routing content) is
the analogous tool once edges have different weights.

## Comparing and Negotiating Multiple Offers

```
Before negotiating, build a real comparison, not just base salary:
  Total Compensation = Base + Bonus (annualized) + Equity
    (annualized, and risk-adjusted for a startup's actual
    likelihood of a liquidity event, not the offer letter's
    face value) + Benefits (health, retirement match) - realistic
    Cost of Living for that specific location

A concrete negotiation opening, not vague pushback:
  "I'm excited about this role. I have another offer at
  [comparable total comp, or a specific number if you're
  comfortable sharing it] — is there flexibility on
  [base/signing bonus/start date]?"

Why anchoring on a specific number (when you have one) works
better than a vague "can you do better": it gives the recruiter
something concrete to actually respond to internally, rather
than requiring them to guess how much movement would satisfy you
— vague pushback often gets a vague, minimal response back.

What's usually negotiable: signing bonus, start date, sometimes
base salary within a band. What's usually rigid: the equity
grant's total size (though vesting schedule specifics sometimes
aren't) and standardized level-based pay bands at larger
companies, which HR frequently cannot move even if they wanted to
— knowing which category a specific ask falls into avoids wasting
negotiation capital on something structurally fixed.
```

## Company-Specific Interview Process — what's actually tested at each round

```
Typical structure at most tech companies (rounds vary, this is
the common shape, not a universal rule):

  Online Assessment (OA): 2-3 DSA problems, autograded, usually
    easy-to-medium difficulty — filters on "can code correctly
    under time pressure," not depth of algorithmic knowledge.

  Phone/Video Screen: 1 DSA problem + light behavioral — tests
    communication while coding (thinking out loud) as much as the
    solution itself; silently coding a correct answer without
    narrating your reasoning is a common way candidates
    underperform here despite solving the problem correctly.

  Onsite/Virtual Onsite (multiple rounds):
    - 2-4 DSA/coding rounds — harder problems, sometimes with
      follow-ups extending the original problem
    - 1 System Design round (mid-level and above) — see the
      System Design academy's Advanced tab for the depth expected
    - 1 Behavioral/culture-fit round — STAR-method answers
      (covered on Intermediate) are specifically what this round
      is evaluating
    - Sometimes 1 "bar raiser"/hiring-manager round, which can
      combine any of the above

Preparation implication: DSA volume matters most for OA/phone
screen survival, but system design and behavioral rounds are
frequently where an otherwise-strong candidate is actually
rejected — allocating prep time only to DSA because "that's what
gets tested most often" mismatches effort against where offers
are actually won or lost in later rounds.
```

## High-Yield Advanced Topics

Based on real placement-cycle patterns, prioritize in this order:
1. DP and graph-traversal pattern recognition — the highest-leverage DSA skill, since most "hard" interview problems are a known pattern in disguise, not a genuinely novel algorithm
2. System-design-round readiness (see the System Design academy) — the most common reason a strong coder still doesn't get an offer at mid-level and above
3. Negotiation — the highest dollar-value-per-hour-of-prep topic on this entire list, and the most commonly skipped

## Practice Resources

- **Labs section**: Advanced MCQ sets and coding-pattern drills with detailed explanations
- **Interview Q&A**: Real behavioral and system-design follow-up questions, not just DSA
- LeetCode's pattern-tagged problem sets (not random practice) — deliberately practicing one pattern (e.g. all "two pointer" problems together) builds recognition faster than solving problems in random order
