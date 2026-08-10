# Functional Verification — Advanced

Fundamentals' covergroup tracked one dimension at a time — did `counter_4bit` reach each individual value. This page introduces **cross coverage**: tracking combinations of two or more coverage dimensions together, which catches an entire class of gap that single-dimension coverage misses completely. The running example is `seq_detector_101` — reusing Overview's exact traced stimulus one more time, now viewed through a cross-coverage lens instead of a pass/fail lens.

**Analogy** — Single-dimension coverage is checking a restaurant menu to confirm every individual ingredient has been used in at least one dish over the year — flour, yes; tomatoes, yes; cheese, yes. Cross coverage is checking every specific COMBINATION — has the kitchen ever actually made a dish with flour AND tomatoes AND cheese together, at the same time, not just each ingredient separately in different dishes. A kitchen can score 100% on individual-ingredient coverage while never once having made a specific popular combination — exactly the gap cross coverage exists to catch.

## Why Individual Coverage Bins Aren't Enough

```
seq_detector_101 has two natural coverage dimensions:
  STATE   -- S0, S1, S2 (3 values)
  BIT_IN  -- 0, 1 (2 values)

Individual (single-dimension) coverage could report 100% on BOTH
dimensions separately -- every state visited at least once, AND
both bit_in values applied at least once -- while still never having
tested certain STATE+BIT_IN COMBINATIONS at all. Cross coverage
tracks the full state x bit_in grid (3 x 2 = 6 possible cells)
explicitly, catching exactly this gap.
```

```systemverilog
// SystemVerilog cross coverage -- tracks every (state, bit_in)
// combination as its own bin, not just each dimension separately
covergroup fsm_cross_cg @(posedge clk);
    state_cp:  coverpoint state  { bins s[] = {S0, S1, S2}; }
    bitin_cp:  coverpoint bit_in { bins b[] = {0, 1}; }
    state_x_bitin: cross state_cp, bitin_cp;  // all 6 combinations
endgroup
```

## Annotated Example — Cross Coverage From Overview's Exact Stimulus

Overview's exact input stream `1011010` was traced through `seq_detector_101` starting from S0. Recording the (state, bit_in) pair present at EACH step of that exact trace:

```
bit=1: state=S0, bit_in=1  -> next S1
bit=0: state=S1, bit_in=0  -> next S2
bit=1: state=S2, bit_in=1  -> next S1  (detected)
bit=1: state=S1, bit_in=1  -> next S1
bit=0: state=S1, bit_in=0  -> next S2
bit=1: state=S2, bit_in=1  -> next S1  (detected)
bit=0: state=S1, bit_in=0  -> next S2

Pairs observed: (S0,1), (S1,0), (S2,1), (S1,1), (S1,0), (S2,1), (S1,0)
Distinct pairs: {(S0,1), (S1,0), (S2,1), (S1,1)}  -- 4 distinct

Full cross-coverage grid (6 total cells):
             bit_in=0        bit_in=1
  S0     |   NOT HIT     |   HIT (1x)   |
  S1     |   HIT (3x)    |   HIT (1x)   |
  S2     |   NOT HIT     |   HIT (2x)   |

Cross coverage = 4 / 6 = 66.67%
```

Verified computationally by simulating the exact FSM logic against Overview's exact stimulus: this single 7-bit directed test — which achieved 100% of its OWN job (correctly detecting both "101" occurrences) — only reaches 66.67% cross coverage, leaving (S0, bit_in=0) and (S2, bit_in=0) completely untested. Neither gap is a bug in the design or the testbench; it's a genuine, quantified statement about what this ONE directed stimulus sequence does and doesn't exercise — exactly the kind of gap functional coverage (Fundamentals) and cross coverage (this page) exist to make visible rather than left as an unstated assumption.

## Try It (2 Minutes)

Design a short additional stimulus sequence (starting fresh from S0 after a reset) specifically to hit the two missing cells, (S0, bit_in=0) and (S2, bit_in=0).

1. What single bit, applied while in state S0, hits the (S0, 0) cell?
2. What sequence of bits reaches state S2, followed by a 0, to hit the (S2, 0) cell?
3. After adding this sequence, what would the new cross-coverage percentage be?

You should land on: applying bit_in=0 while in S0 (the very first bit of a fresh sequence, e.g., starting with "0...") hits (S0,0) immediately, since S0 is the reset state. To hit (S2,0), the FSM must first reach S2 (requires seeing "10" from S0: S0→S1 on a 1, S1→S2 on a 0) and then apply a 0 while in S2 (S2→S0 on that 0) — so the sequence "100" reaches state S2 and then applies 0, hitting (S2,0). Adding a short sequence like "0100" (which passes through (S0,0), then S0→S1, S1→S2, and (S2,0)) would hit both missing cells, bringing cross coverage from 4/6 to a full 6/6 = 100%, closing the gap Overview's original directed test alone left open.

## Study Resources
- **Chris Spear & Greg Tumbush, *SystemVerilog for Verification*** — covers cross coverage and coverage-model design in exactly this style
- **Accellera — UVM and SystemVerilog Coverage Standards** (accellera.org) — the standards body defining SystemVerilog coverage constructs, including cross coverage
- **ASIC World — SystemVerilog Coverage** (asic-world.com) — free walkthroughs extended here from single-dimension coverpoints to cross coverage
