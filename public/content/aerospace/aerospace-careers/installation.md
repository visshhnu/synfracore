# Aerospace Careers & Exam Pathways — Installation

## What You're Setting Up

There's no CLI or engine to install for a careers/exam-strategy guide — this section instead sets up a small, genuinely reusable Python scoring calculator (generalizing Overview's ISRO written-test scoring example so you can plug in your own practice-test numbers), plus points to the real, current sources for exam notifications and past papers that this guide's own volatility tags keep pointing back to.

## Build a Reusable ISRO Written-Test Scoring Calculator

Overview's scoring example (Part A: +1 correct / -1/3 wrong, no penalty for unattempted; Part B: 15 questions worth 20 marks, no negative marking) is a fixed formula worth having as a real tool, not just a worked example to re-read.

```python
def isro_written_test_score(
    partA_correct, partA_wrong,
    partB_correct, partB_total=15, partB_marks=20
):
    partA_score = partA_correct * 1 + partA_wrong * (-1/3)
    partB_per_question = partB_marks / partB_total
    partB_score = partB_correct * partB_per_question
    total = partA_score + partB_score
    return {
        "part_a_score": round(partA_score, 2),
        "part_b_score": round(partB_score, 2),
        "total_score": round(total, 2),
    }
```

## Verify Your Setup — Recompute Overview's Worked Example and Try It

```python
# Overview's worked example: 55 correct, 15 wrong (Part A),
# 10 correct of 15 (Part B)
result1 = isro_written_test_score(partA_correct=55, partA_wrong=15, partB_correct=10)
print(result1)

# Overview's Try It: 60 correct, 20 wrong (Part A), 12 correct of 15 (Part B)
result2 = isro_written_test_score(partA_correct=60, partA_wrong=20, partB_correct=12)
print(result2)
```

```
Expected output:
{'part_a_score': 50.0, 'part_b_score': 13.33, 'total_score': 63.33}
{'part_a_score': 53.33, 'part_b_score': 16.0, 'total_score': 69.33}

These match Overview's hand-computed 63.33 and Try It's 69.33
exactly. This function is genuinely reusable — plug in your own
practice-test results (or a friend's, for comparison) to get a real,
immediate score under the actual marking scheme, rather than
re-deriving the arithmetic by hand every time.
```

## A Second Check — the Negative-Marking Break-Even Point

Overview noted that guessing on Part A is "mathematically favorable if you can eliminate enough options to push your odds of being correct above roughly 1-in-4." Verify this break-even claim directly:

```python
def guessing_expected_value(prob_correct, num_options_remaining=None):
    # +1 for correct, -1/3 for wrong, applied to expected value
    prob_wrong = 1 - prob_correct
    return prob_correct * 1 + prob_wrong * (-1/3)

for p in [0.20, 0.25, 0.30]:
    ev = guessing_expected_value(p)
    print(f"P(correct) = {p:.2f} -> expected value = {ev:.4f}")
```

```
Expected output:
P(correct) = 0.20 -> expected value = -0.0667
P(correct) = 0.25 -> expected value = 0.0000
P(correct) = 0.30 -> expected value = 0.0667

Confirms Overview's claim precisely: at exactly 25% (1-in-4) odds of
guessing correctly, the expected value of guessing is exactly ZERO —
below 25%, guessing is a losing bet on average (negative expected
value); above 25%, it's a winning bet. This is the exact break-even
point Overview described, now confirmed by direct calculation rather
than just stated.
```

## Where to Get Real, Current Exam Information

This guide's own volatility tags exist because exam formats, eligibility, and notification cycles genuinely change — the calculator above is stable (the scoring formula itself doesn't change often), but the inputs (which exam, which cycle, current eligibility) need to come from live sources, not this guide:

```
ISRO Centralised Recruitment Board (ISRO CRB) — official notifications,
  exact current exam format, eligibility, vacancy details
GATE official website (rotates organizing IIT each year) — current
  AE syllabus, exam pattern, exam dates
Skyroot Aerospace / Agnikul Cosmos career pages — current private-
  sector openings, which change far more frequently than government
  exam formats
```

## Verify Everything Works

```bash
# 1. Confirm the scoring calculator reproduces Overview's 63.33 and
#    69.33 results exactly

# 2. Confirm the break-even check shows exactly 0.0000 expected
#    value at P(correct) = 0.25

# 3. Bookmark or check the official sources listed above — confirm
#    you can actually find the current notification/syllabus page
#    for whichever pathway (ISRO, GATE, private) you're targeting
```

## Common Setup Issues

**Scoring calculator gives a different Part B score than expected**
Check the `partB_total` and `partB_marks` defaults (15 questions, 20 marks) actually match the current exam format you're scoring against — Overview flags this exact structure as needing verification against the current notification cycle; if the real current format differs, update these defaults rather than assuming they're permanently fixed.

**Break-even percentage doesn't match "1-in-4" intuition**
The break-even point depends entirely on the specific marking scheme (here, +1 correct / -1/3 wrong) — a different exam with a different negative-marking ratio (say, -1/4 instead of -1/3) would have a different break-even percentage; don't assume 25% is a universal constant across every negative-marking exam, it's specific to this exact +1/-1/3 scheme.

## What's Set Up

- **A reusable Python ISRO written-test scoring calculator** — genuinely useful for scoring your own practice tests, not just a one-time worked example
- **A verified understanding of the negative-marking break-even point**, confirmed by direct calculation

## Next Steps

Go to the **Fundamentals** section to see how GATE AE's five subject areas map directly onto this academy's six technologies.
