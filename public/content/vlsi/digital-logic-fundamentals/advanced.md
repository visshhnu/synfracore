# Digital Logic & Design Fundamentals — Advanced

Every earlier page in this technology treated gates as instantaneous — a truth table row is either true or it isn't, with no notion of time. Real gates have delay, and that delay creates two distinct problems this page introduces: static hazards in combinational logic (a circuit that's logically correct but can glitch momentarily during a transition) and flip-flop timing parameters (setup, hold, clock-to-Q) — the vocabulary RTL Design & Computer Architecture assumes is already familiar when it covers critical-path timing closure.

**Analogy** — A static hazard is like two people racing to answer "is the light on?" by two different paths of information, where both paths eventually agree on the right answer, but one path is momentarily slower — producing a flicker of the wrong answer in between, even though both were ultimately correct. A hold-time violation is the opposite problem: a runner who finishes the race so fast that the finish-line camera hasn't even finished resetting from the previous runner yet.

## Static Hazards — When "Logically Correct" Isn't "Glitch-Free"

```
Overview simplified F = AB + AB' + A'B down to F = A + B, and its
Try It simplified F = AB + A'C + BC down to F = AB + A'C, calling
the BC term "redundant" -- true for LOGICAL equivalence (both forms
produce the same output for every input combination), but NOT true
once real gate delay is considered.
```

### Annotated Example — Why the "Redundant" BC Term Actually Matters

Consider F = AB + A'C with B = C = 1 held constant, while A transitions from 1 to 0.

```
At A=1 (B=1, C=1): AB = 1, A'C = 0  ->  F = 1
At A=0 (B=1, C=1): AB = 0, A'C = 1  ->  F = 1

Logically, F stays at 1 throughout -- correct in the truth table.
But physically, the AB term's path (through A directly) and the A'C
term's path (through an inverter on A, THEN through the AND gate)
have different gate delays. If the AB term's output falls to 0
BEFORE the A'C term's output has risen to 1 (because the inverter
adds extra delay to the A'C path), there is a brief window where
BOTH terms read 0 simultaneously -- and F glitches to 0 for a few
nanoseconds before settling back to 1.

Adding back the "redundant" BC term (F = AB + A'C + BC) fixes this:
since B=1 and C=1 are held constant through the whole transition,
BC = 1 for the entire window, regardless of what A is doing --
BC "covers" the gap between the other two terms losing and gaining
their contribution, and F never glitches.

This is exactly Overview's Consensus Theorem term, now shown to
serve a real physical purpose: logically redundant, but electrically
necessary to eliminate a static-1 hazard (named for the fact that F
should stay steadily at 1 throughout).
```

## Flip-Flop Timing Parameters

```
A flip-flop's DATA input can't change at just any moment relative to
the clock -- three parameters govern this, and RTL Design & Computer
Architecture's timing-closure material assumes fluency with all
three:

  CLOCK-TO-Q DELAY (tCQ)  -- after a clock edge, how long until the
                              flip-flop's OUTPUT actually changes.
                              Real hardware, not instant.
  SETUP TIME (tSU)         -- how long BEFORE the next clock edge the
                              DATA INPUT must already be stable, or
                              the flip-flop may capture the wrong
                              value (or an unstable, "metastable" one).
  HOLD TIME (tH)           -- how long AFTER the clock edge the DATA
                              INPUT must remain stable, for the SAME
                              reason.

Setup violations happen when logic feeding a flip-flop is too SLOW
(covered from the critical-path angle in RTL Design & Computer
Architecture's Fundamentals page). Hold violations happen when a
path is too FAST -- a new value races through before the receiving
flip-flop has finished capturing the previous one.
```

### Annotated Example — Checking a Hold-Time Requirement

Two flip-flops connected directly through a small amount of combinational logic. FF1 has a clock-to-Q delay of 0.3 ns. The combinational logic between FF1 and FF2 has a minimum (fastest-case) delay of 0.1 ns. FF2 requires a hold time of 0.25 ns.

```
Given:  tCQ = 0.3 ns, min combinational delay = 0.1 ns, tH = 0.25 ns

Check:  does the data stay stable at FF2's input for at least tH
        after the clock edge?

  Earliest the data can possibly change at FF2's input
    = tCQ + min combinational delay
    = 0.3 + 0.1 = 0.4 ns after the clock edge

  Required: data must stay stable for at least tH = 0.25 ns

  0.4 ns >= 0.25 ns  ->  HOLD TIME SATISFIED, with 0.15 ns of margin

Verified computationally: this design has enough minimum delay in
the path to safely clear FF2's hold-time requirement.
```

## Try It (2 Minutes)

A different design has FF1's clock-to-Q delay = 0.2 ns, and NO combinational logic at all between FF1 and FF2 (a direct wire, 0 ns delay). FF2 still requires a hold time of 0.25 ns.

1. What is the earliest the data can change at FF2's input?
2. Is the hold-time requirement satisfied?
3. Why is this failure mode "counterintuitive" compared to the setup violations discussed in RTL Design & Computer Architecture?

You should land on: earliest change = 0.2 + 0 = 0.2 ns after the clock edge — but the requirement is 0.25 ns, so this VIOLATES hold time by 0.05 ns. This is counterintuitive because a setup violation is fixed by making logic faster (or slowing the clock) — but a hold violation, caused by a path that is already too fast, is fixed by deliberately adding delay to that path (a buffer, for instance), which feels backwards the first time it's encountered: making a circuit "slower" to fix a timing problem. Unlike a setup violation, a hold violation can never be fixed by changing the clock speed at all — it's a same-cycle race condition, independent of how fast or slow the clock runs.

## Study Resources
- **Morris Mano, *Digital Design*** — covers static/dynamic hazards and flip-flop timing parameters in exactly this style
- **ASIC World — Static Timing Analysis Basics** (asic-world.com) — free introduction to setup/hold timing, reused and extended in RTL Design & Computer Architecture
- **All About Circuits — Logic Hazards** (allaboutcircuits.com) — free walkthrough of static and dynamic hazards in combinational logic
