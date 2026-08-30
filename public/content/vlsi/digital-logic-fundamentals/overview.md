# Digital Logic & Design Fundamentals — Overview

**Before you start:** basic algebra is assumed — no prior electronics or programming background is required, since this page introduces Boolean algebra and gate vocabulary from scratch.

This is the on-ramp for the whole VLSI academy. Every technology after this one — HDL/Verilog-VHDL, RTL Design, Functional Verification, Physical Design, Analog/Mixed-Signal — assumes you can already think in 1s and 0s: how a handful of AND/OR/NOT gates combine into circuits that add numbers, remember state, and eventually become the billions-of-transistors chips this whole field is about. This page doesn't teach a specific chip or tool — it teaches the logic vocabulary every later module reuses.

**Analogy** — A logic gate is a light switch with an opinion. A single switch just passes power through or blocks it. A logic gate looks at one or more incoming signals (each either "on" — 1 — or "off" — 0) and decides, by a fixed rule, whether to pass a 1 or a 0 onward. An AND gate is a strict switch: it only says yes if every input says yes. An OR gate is a lenient switch: it says yes if any input says yes. Wire enough of these opinionated switches together in the right pattern, and you get a calculator, a memory cell, or — at the scale of billions — a processor.

## Why This Academy Starts Here

```
VLSI (Very Large Scale Integration) engineering splits into two
connected halves, same shape as most hardware disciplines:
  DIGITAL SIDE  — circuits that only ever sit at two voltage levels,
                   0 or 1 (this technology, HDL, RTL, Verification,
                   most of Physical Design)
  ANALOG SIDE   — circuits that work with continuous, in-between
                   voltages (Analog/Mixed-Signal Design)

Nearly everything in this academy's digital track builds on three
ideas taught here:
  1. BOOLEAN ALGEBRA — the math of TRUE/FALSE (1/0) values, and the
                        rules (AND, OR, NOT, and combinations of them)
                        for combining them. This is the language every
                        digital circuit is described in before it's
                        ever built.
  2. NUMBER SYSTEMS   — binary, hexadecimal, and how real decimal
                         numbers get represented as bit patterns a
                         circuit can store and compute on.
  3. LOGIC GATES       — the physical (or simulated) building blocks —
                          AND, OR, NOT, NAND, NOR, XOR — that implement
                          Boolean algebra in silicon.
```

```conceptgrid
{
  "boxes": [
    { "title": "Boolean Algebra", "description": "The math of TRUE/FALSE values -- AND, OR, NOT combinations", "color": "blue" },
    { "title": "Number Systems", "description": "Binary, hexadecimal -- how decimal numbers become bit patterns", "color": "purple" },
    { "title": "Logic Gates", "description": "AND, OR, NOT, NAND, NOR, XOR -- Boolean algebra implemented in silicon", "color": "green" }
  ]
}
```

## The Basic Gates — A Worked Truth-Table Example

```
AND gate: output is 1 only if BOTH inputs are 1
  A  B  | AND
  0  0  |  0
  0  1  |  0
  1  0  |  0
  1  1  |  1

OR gate: output is 1 if EITHER input is 1
  A  B  | OR
  0  0  |  0
  0  1  |  1
  1  0  |  1
  1  1  |  1

NOT gate: flips a single input
  A  | NOT A
  0  |   1
  1  |   0

These three are the complete toolkit — every other gate (NAND, NOR,
XOR, XNOR) is either a combination of these or, in NAND/NOR's case,
"universal" building blocks that alone can construct any of the
others (why fabs standardize on NAND/NOR-heavy cell libraries, a
point Physical Design & Fabrication returns to).
```

### Annotated Example — Simplifying a Real Boolean Expression

A design gives you the function F = AB + AB' + A'B (read: "A AND B, OR A AND NOT-B, OR NOT-A AND B") and asks you to simplify it before implementing it in gates — fewer terms means fewer physical transistors.

```
Start:  F = AB + AB' + A'B

Group the first two terms — both have A as a common factor:
  AB + AB' = A(B + B')
  B + B' is always 1 (a variable OR'd with its own complement is
  always true — this is the Complement Law)
  So:  A(B + B') = A · 1 = A

F now reads:  F = A + A'B

Apply the Absorption Law (A + A'B = A + B — proved by checking both
sides give the same output for every input):
  F = A + B

Verified computationally against all 4 input combinations of A and
B — the original 3-term expression and the simplified A + B produce
identical outputs in every case. Same function, one gate (a single
OR gate) instead of three gates and an inverter.
```

## Try It (2 Minutes)

Simplify F = AB + A'C + BC using the same style of reasoning (hint: the third term, BC, is redundant once the first two are accounted for — this is a named result called the Consensus Theorem).

1. What does F simplify to?
2. Why is the BC term unnecessary — under what condition on A does BC ever matter, and is that condition already covered by AB or A'C?

You should land on: F = AB + A'C (the BC term drops out entirely). Reasoning: whenever A = 1, AB already covers any case where B = 1; whenever A = 0, A'C already covers any case where C = 1. BC can only matter when both B = 1 and C = 1 simultaneously — and in every such case, either A = 1 (so AB is already 1) or A = 0 (so A'C is already 1). BC never contributes a new 1 that AB + A'C didn't already produce — verified computationally against all 8 input combinations of A, B, and C. This exact "redundant term" pattern is what K-map grouping (Fundamentals page) is designed to catch visually instead of algebraically.

## Study Resources
- **Morris Mano, *Digital Design*** — the standard university-level textbook; Chapters 1–2 cover exactly this Boolean algebra and gate foundation
- **All About Circuits — Digital Logic Fundamentals** (allaboutcircuits.com) — free, beginner-oriented walkthroughs of gates and truth tables
- **Khan Academy — Boolean Logic** — free refresher if the algebra itself (not the circuit application) needs review first
