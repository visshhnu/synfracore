# Reasoning Ability — Intermediate

## Multi-variable puzzles: seating + floor + profession combined

```
"8 people live on 4 floors (2 per floor) of a building, each
  with a different profession (Doctor, Engineer, Teacher,
  Lawyer, and 4 more)..."

This adds a genuine second (or third) dimension beyond simple
  seating — the same incremental, most-definite-clue-first
  method applies, but now tracked across multiple linked
  attributes simultaneously

Practical technique: use a GRID, not a single line/circle —
  rows for floors, columns for the 2 people per floor, with a
  separate row/column for profession once floor+person is fixed
```
The core method from the Fundamentals tab (most definite clue first, incremental building, final re-verification) doesn't change for multi-variable puzzles — what changes is the tracking structure needed to hold multiple linked attributes without losing track of which attribute is confirmed versus still uncertain for each person. A grid with clearly marked confirmed-vs-tentative cells is what scales the fundamentals-level method to genuinely more complex puzzles, rather than needing an entirely different approach.

## Input-Output: identifying the rule before proceeding is non-negotiable

```
Input:  25  train  47  house  12  window
Step 1: 12  25  train  47  house  window
Step 2: 12  47  25  train  house  window
Step 3: 12  47  25  house  train  window
...

The temptation: start guessing the pattern for step 4 without
  fully confirming the rule from steps 1→2 and 2→3 first

The discipline: identify the EXACT rule (e.g., "smallest number
  moves to the front, alternating with words sorted by length,
  each step") from the given steps BEFORE attempting to
  extrapolate to a step not shown — guessing the rule from
  partial pattern-matching, without full confirmation across
  every given step, is the primary source of input-output errors
```
The specific failure mode worth naming: a rule that appears to fit steps 1→2 might not actually hold for 2→3 — confirming the identified rule against every given transition, not just the first one, before extrapolating to an unshown step, is what prevents committing to a plausible-but-wrong rule based on insufficient confirmation. This is directly analogous to the syllogism discipline from the Fundamentals tab (checking a conclusion against every possible valid diagram, not just one) — in both cases, confirming against ALL available evidence, not just enough evidence to seem plausible, is what prevents a specific, common category of error.

## Inequality: combining statements and handling "either-or" cases correctly

```
Coded inequality example:
  A > B (given as "A @ B" where @ means >)
  B ≥ C
  C > D

Combined chain: A > B ≥ C > D
  Direct conclusions: A > D (valid, since A > B ≥ C > D implies A > D)
                       A > C (valid)
  NOT directly concludable: B vs D relationship precisely
    (B ≥ C > D only guarantees B > D, so this actually IS valid —
    but a common error is missing that ≥ combined with > still
    produces a valid > relationship transitively)

"Either-or" case: when neither of two conclusions is individually
  guaranteed, but one of the two MUST be true given the
  statements — a distinct conclusion type from either individually
  being definitely true
```
The genuinely tricky part of inequality chains isn't the basic combination logic — it's correctly handling mixed strict (>) and non-strict (≥) relationships in a chain, and specifically recognizing "either-or" as its own distinct conclusion category, separate from checking whether either individual conclusion holds on its own. Building fluency here requires deliberately practicing chains that mix > and ≥ together, since pure > or pure ≥ chains (without mixing) don't expose the specific combination rules that cause real errors in practice.

## Coding-decoding: practicing recent-year variety specifically

```
Older, now-uncommon pattern: simple alphabet shift
  (A→D, B→E, fixed +3 shift for every letter)

More recent, currently common patterns:
  - Variable shift per letter position (not a fixed shift)
  - Combined letter-and-number coding in one scheme
  - Reverse-alphabet-position coding (A=26, B=25, etc.)
```
The Overview tab's specific guidance to practice recent-year variety, not just older pattern types, reflects a real, observable trend — coding-decoding pattern styles genuinely shift across exam years as question-setters introduce new variations, and a candidate who's only practiced older, simpler shift patterns can be caught off guard by a currently-common pattern type they've never encountered, even with strong general reasoning ability. This is one of the few reasoning topics where staying current with recent exam patterns specifically (not just practicing reasoning ability generally) has real, direct value.

## Building an error log that actually changes future performance

```
Error log entry, done right — beyond just "got it wrong":
  Puzzle type: Circular seating, 8 people, 2 attributes
  Specific error: Misapplied "third to the right" — counted
    starting position as position 1 instead of position 0
    (an off-by-one counting error in a specific clue type)
  Pattern check: has this exact counting error appeared before?
    (checking across multiple error log entries specifically
    for this recurring pattern, not just logging each instance
    independently)
```
The Overview tab's guidance that "most mistakes repeat across similar puzzle types until consciously corrected" is the entire reason an error log needs to be reviewed as a set, looking for recurring patterns across entries, not just logged and forgotten entry by entry — a specific counting convention error (like the "third to the right" off-by-one example) that appears in 3 separate puzzle attempts, unnoticed because each was logged independently without cross-referencing, represents a single real, fixable habit that's costing marks repeatedly — spotting that requires actually reviewing the log as a collection, not just maintaining it as a list.
