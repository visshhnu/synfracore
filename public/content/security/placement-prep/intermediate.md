# Placement Preparation Intermediate

## Advanced DSA

### Sliding Window Pattern
```python
# Maximum sum subarray of size k
def max_sum_subarray(arr, k):
    window_sum = sum(arr[:k])
    max_sum = window_sum
    for i in range(k, len(arr)):
        window_sum += arr[i] - arr[i-k]
        max_sum = max(max_sum, window_sum)
    return max_sum
```

### Two Pointer Pattern
```python
# Check if array has pair summing to target
def has_pair_with_sum(arr, target):
    arr.sort()
    left, right = 0, len(arr) - 1
    while left < right:
        s = arr[left] + arr[right]
        if s == target: return True
        elif s < target: left += 1
        else: right -= 1
    return False
```

### Common DP Patterns
- 0/1 Knapsack: include or exclude each item
- Unbounded Knapsack: items can be reused
- LCS (Longest Common Subsequence)
- LIS (Longest Increasing Subsequence)
- Matrix chain multiplication
- Coin change (minimum coins)

## System Design for Interviews

### Common Questions
- Design URL shortener
- Design chat application
- Design rate limiter
- Design notification system
- Design ride-hailing app (Uber)

### Framework for System Design
1. Requirements: functional + non-functional
2. Capacity estimation: users, QPS, storage
3. API design
4. High-level architecture
5. Deep dive on components
6. Handle bottlenecks

## Technical Interview Tips

### Problem Solving Process
1. Clarify requirements and constraints
2. Work through examples (including edge cases)
3. Brute force first, then optimize
4. Write clean, readable code
5. Test with examples, edge cases
6. Analyze time and space complexity

### Communication
- Think out loud; interviewers want to see your reasoning
- Ask clarifying questions; don't make assumptions
- Explain trade-offs when making decisions
- If stuck, say so and ask for a hint

## Company-Specific Preparation

### Product Companies (Google, Amazon, Microsoft, Meta)
- Heavy DSA focus (LeetCode medium-hard)
- System design for senior roles
- Behavioral interviews (STAR method)

### Service Companies (TCS, Infosys, Wipro, Cognizant)
- Aptitude tests: quant, reasoning, verbal
- Basic coding (easy problems)
- Communication skills matter

### Startups
- Full-stack knowledge
- Problem-solving attitude
- Cultural fit and enthusiasm
