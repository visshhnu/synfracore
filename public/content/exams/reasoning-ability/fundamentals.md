# Reasoning Ability — Fundamentals

## The puzzle-solving method, worked through on a real example

The Overview tab's 4-step method is the reference — seeing it applied concretely is what actually makes it usable:

```
Puzzle: "8 people sit around a circular table facing the center.
  A sits third to the right of B. C sits immediately left of D.
  E is not adjacent to A. F sits opposite B. ..."

Step 1 (read once, no writing): 8 people, circular arrangement,
  facing center — that's the puzzle's shape, before touching
  any specific clue

Step 2 (find the most definite clue): "A sits third to the right
  of B" is a fixed relative position — start here, not with
  "E is not adjacent to A" (a negative/exclusionary clue, which
  narrows possibilities but doesn't establish a fixed starting
  point on its own)

Step 3 (build incrementally): place B, count 3 to the right for
  A, then bring in "F sits opposite B" (another definite,
  positional clue) before working through the more relative or
  exclusionary clues

Step 4 (re-verify): once every person is placed, check EVERY
  clue again against the final arrangement — including the
  negative ones ("E is not adjacent to A") that were used to
  narrow options during solving but need final confirmation
```
The specific reason to start with definite/positional clues rather than negative/exclusionary ones: a definite clue ("third to the right of") immediately fixes real positions, while a negative clue ("not adjacent to") only eliminates possibilities from an already-narrowed set — attempting to start from a negative clue with no established positions yet to eliminate against wastes the clue's actual usefulness, since it has nothing concrete to narrow down yet.

## Syllogism: the fixed method that solves nearly every variant

```
Statement: "All cats are animals. Some animals are dogs."
Conclusion to check: "Some cats are dogs."

Venn diagram approach:
  Draw "All cats are animals" as circle Cats fully inside circle Animals
  Draw "Some animals are dogs" as circle Dogs overlapping circle Animals
    (partially — "some" means overlap, not full containment)
  Check: does Cats circle NECESSARILY overlap Dogs circle in
    EVERY possible valid diagram matching both statements?
  Answer: NO — Dogs could overlap Animals in a region that
    doesn't touch Cats at all, so "Some cats are dogs" is
    NOT a valid (guaranteed) conclusion
```
The critical discipline worth internalizing from the start: a conclusion is only valid if it holds in EVERY possible diagram consistent with the given statements, not just in one diagram you happen to draw first. This is the single most common source of syllogism errors — drawing one plausible-looking diagram, checking the conclusion against just that one, and missing that a different, equally valid diagram (also consistent with the same statements) would make the conclusion false. Practicing drawing 2-3 alternative valid diagrams for the same statement set, specifically to check whether a conclusion survives all of them, builds the habit that prevents this exact error.

## Blood relations: why "never solve mentally beyond 3 relations" is a real, not arbitrary, rule

```
"A is B's father. B is C's sister. D is C's son. E is D's wife."

Attempting to hold this chain mentally beyond a few steps is a
  genuine, common source of errors — not because the logic is
  hard, but because working memory has real limits under time
  pressure, and a single mid-chain error (misremembering who's
  whose sibling) invalidates every conclusion built on top of it

Drawing the tree:
  A (father) → B
  B — sister — C  (so A is also C's father, same generation logic)
  C → D (son)
  D — wife — E
```
Drawing the family tree isn't a beginner's crutch to eventually outgrow — it's the reliable method professionals and toppers alike use precisely because mental tracking beyond 3-4 relations has a measurably higher error rate, especially under real exam time pressure where a single misremembered relation cascades into every subsequent answer being wrong. The habit worth building from day one of practice, not something to add later once problems "get too hard to do mentally" — by the time a problem feels too hard to track mentally, an error has often already occurred without being noticed.

## Direction sense: sketch every problem, without exception

```
"A walks 5m north, turns right, walks 3m, turns right again,
  walks 5m. What direction is A facing, and how far from start?"

Mental tracking risk: "turns right" means something different
  depending on which direction you're CURRENTLY facing at each
  step — this is exactly where mental tracking breaks down,
  since each turn's actual resulting direction depends on state
  that has to be correctly carried forward from the previous step

Sketching: draw each segment on a simple grid, marking direction
  at each turn explicitly — the sketch carries the state so you
  don't have to hold it in working memory
```
The specific reason direction sense problems cause disproportionate errors relative to their apparent simplicity: "turn right" is state-dependent (its actual resulting direction depends on current facing), and mental tracking of state across multiple turns is exactly the kind of task human working memory handles unreliably under time pressure — a simple sketch externalizes that state tracking onto paper, removing the specific failure mode entirely, which is why this is treated as a non-negotiable practice, not an optional aid for harder problems only.

## Building genuine speed through daily volume, not occasional intensive sessions

The Overview tab's "solve at least one full puzzle daily under a 6-8 minute timer from day one" guidance reflects a real principle about how pattern recognition actually builds: reasoning ability speed comes from having seen and correctly solved many similar puzzle structures before, such that recognizing "this is a circular arrangement with a definite starting clue in position X" becomes near-automatic rather than requiring fresh analysis each time. This kind of pattern recognition builds more reliably through consistent daily exposure than through occasional longer sessions — a candidate solving one puzzle daily for 60 days builds more transferable pattern recognition than one solving 10 puzzles in a single cram session once a week, even at similar total practice volume, because spaced, repeated exposure is what actually consolidates pattern recognition into fast, reliable recall.
