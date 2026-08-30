# Placement Preparation — Intermediate

## Quantitative Aptitude — worked examples

```
Time, Speed, Distance — a genuinely common pattern:
  Two trains, 120km apart, moving toward each other at 40km/h
  and 60km/h. When do they meet?
  Relative speed (approaching) = 40+60 = 100 km/h
  Time = Distance / Relative speed = 120/100 = 1.2 hours

  Same-direction chase — a different relative-speed rule:
  Train A leaves at 8:00 at 60km/h. Train B leaves the same
  station at 9:00 at 90km/h, same direction. When does B catch A?
  By 9:00, A has a 60km head start.
  Relative speed (same direction) = 90-60 = 30 km/h
  Time for B to close the gap = 60/30 = 2 hours → B catches A at 11:00

  The rule that actually matters: approaching → add speeds,
  same-direction chase → subtract speeds. Most errors on this
  topic come from applying the wrong one under time pressure,
  not from the arithmetic itself.

Permutations vs Combinations — the actual distinguishing question:
  "Does order matter?" — arranging 3 books on a shelf out of 5
  (order matters, book positions are distinct) = permutation:
  P(5,3) = 5!/(5-3)! = 60
  Choosing 3 books out of 5 to take on a trip (order doesn't
  matter, just which 3) = combination:
  C(5,3) = 5!/(3!×2!) = 10
```

## DSA Pattern Recognition — Two Pointers, worked

```python
# Problem: given a sorted array, find two numbers that sum to a target
# Naive approach: check every pair — O(n^2)
# Two-pointer approach — O(n), the pattern worth recognizing:

def two_sum_sorted(arr, target):
    left, right = 0, len(arr) - 1
    while left < right:
        current_sum = arr[left] + arr[right]
        if current_sum == target:
            return [left, right]
        elif current_sum < target:
            left += 1   # need a bigger sum, move left pointer up
        else:
            right -= 1  # need a smaller sum, move right pointer down
    return None
```

The pattern-recognition skill this is actually testing: **the
array being sorted is what makes two-pointer valid at all** —
moving `left` up always increases the sum, moving `right` down
always decreases it, because the array is ordered. On an
unsorted array, this exact technique doesn't work (a hash-set
approach is the right pattern there instead) — recognizing which
signal in the problem statement ("sorted array," "find a pair
summing to X") points to which pattern is the actual interview
skill, more than memorizing this one solution.

## Resume — a real before/after

```
Before (common, weak, task-focused):
  "Worked on the backend team, responsible for API development
  and bug fixes"

After (impact-focused, quantified, specific):
  "Redesigned a REST API's pagination logic, reducing average
  response time from 800ms to 120ms for the top 3 highest-traffic
  endpoints; fixed 12 production bugs over one quarter, reducing
  the team's open bug backlog by 30%"

What changed, specifically: the "after" version replaces a job
description ("responsible for X") with a measurable outcome
(numbers: 800ms→120ms, 12 bugs, 30%) — a resume screener or
interviewer can't evaluate "responsible for API development," but
can immediately evaluate a specific, quantified claim, and it
gives the interviewer a concrete, comfortable thread to ask
follow-up questions about, which "responsible for" does not.
```

## Behavioral Questions — the STAR method, worked

```
Question: "Tell me about a time you disagreed with a teammate."

Situation: "During a sprint, a teammate wanted to skip writing
  tests for a new feature to hit a deadline."
Task: "I needed to make the case for keeping test coverage
  without blowing the deadline or creating team friction."
Action: "I proposed we write tests only for the feature's core
  logic (not exhaustive edge cases) to save time, and offered to
  pair-program the tests with them so it wouldn't slow them down
  alone."
Result: "We shipped on time with meaningful test coverage, and
  that partial-coverage compromise became the team's informal
  standard for tight-deadline features afterward."

Why this structure works in an interview specifically: each
letter forces a concrete detail (not a vague generality), and
the Result section is what most weak answers skip entirely —
ending on "we disagreed and eventually agreed" without a
measurable or concrete outcome leaves the interviewer unable to
judge whether the resolution actually worked.
```

## Transition to Advanced

You're ready for advanced placement prep when you can:
- Solve a two-pointer or sliding-window problem within 10-15 minutes without seeing the pattern name given to you first
- Rewrite any resume bullet from a task description into a quantified outcome on the first try
- Deliver a STAR answer in under 2 minutes without rambling in the Situation/Task setup
