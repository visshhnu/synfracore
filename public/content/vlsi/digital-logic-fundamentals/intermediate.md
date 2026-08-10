# Digital Logic & Design Fundamentals — Intermediate

Overview and Fundamentals built gates, truth tables, K-maps, and number representation from scratch. This page covers the two building blocks nearly every real digital circuit reuses directly: the adder (how a chip actually does arithmetic in hardware, not just represents numbers) and the multiplexer used as a general-purpose logic-implementation tool (not just a signal selector).

**Analogy** — A half adder is one person adding two single digits with no help from anyone else — fine until the sum needs to carry into the next column. A full adder is that same person, but now also listening for a "carry" shout from the person to their right before writing down their own digit — exactly how a multi-digit addition on paper actually works, one column at a time, each column aware of what the previous column produced.

## The Half Adder and Full Adder

```
HALF ADDER — adds two single bits, no carry IN (only carry out)
  A  B  | Sum  Carry
  0  0  |  0     0
  0  1  |  1     0
  1  0  |  1     0
  1  1  |  0     1
  Sum   = A XOR B
  Carry = A AND B

FULL ADDER — adds two bits PLUS a carry-in from the previous column
  A  B  Cin | Sum  Cout
  0  0   0  |  0     0
  0  0   1  |  1     0
  0  1   0  |  1     0
  0  1   1  |  0     1
  1  0   0  |  1     0
  1  0   1  |  0     1
  1  1   0  |  0     1
  1  1   1  |  1     1
  Sum  = A XOR B XOR Cin
  Cout = AB + Cin(A XOR B)   -- (equivalently: majority of A, B, Cin)

A full adder is built from exactly two half adders plus an OR gate --
the same "combine simpler gates into a named, reusable block" pattern
Overview used for AND/OR/NOT combining into more complex functions.
```

## Ripple-Carry Adder — Chaining Full Adders

```
Chaining N full adders, each stage's Cout feeding the next stage's
Cin, adds two N-bit numbers. The carry "ripples" from the least
significant bit to the most significant bit, one stage at a time --
which is also this design's main weakness (Advanced returns to why
this ripple delay matters for real chip speed).
```

### Annotated Example — 4-Bit Ripple-Carry Addition

Adding 0111 (7) + 0001 (1) using four chained full adders, bit 0 (rightmost) first:

```
Stage 0 (bit 0): A=1, B=1, Cin=0  ->  Sum=0, Cout=1
Stage 1 (bit 1): A=1, B=0, Cin=1  ->  Sum=0, Cout=1
Stage 2 (bit 2): A=1, B=0, Cin=1  ->  Sum=0, Cout=1
Stage 3 (bit 3): A=0, B=0, Cin=1  ->  Sum=1, Cout=0

Result (MSB to LSB): 1000 = 8

Verified computationally: 7 + 1 = 8 (binary 1000). This example
was chosen deliberately because the carry ripples through EVERY
stage (Cout=1 at every stage until the last) -- the worst case for
ripple-carry delay, and exactly the scenario Advanced's propagation-
delay discussion returns to.
```

## Multiplexers as General-Purpose Logic Implementers

```
A multiplexer (mux) is usually introduced as a "signal selector" --
N data inputs, select lines choosing which one reaches the output.
But a mux can also implement ANY Boolean function of its select-line
variables directly, by wiring each data input to a constant (0 or 1)
or to a function of the REMAINING variable not used as a select line
-- turning truth-table lookup into physical hardware with no gates
at all beyond the mux itself.
```

### Annotated Example — Implementing F(A,B,C) = Σ(1,3,5,6) With a 4:1 Mux

Use A and B as the mux's two select lines (4 possible combinations, matching a 4:1 mux), and derive what each data input (indexed by AB) must be, as a function of C alone.

```
Truth table, grouped by AB:
  AB=00: C=0 -> F=0 (m0), C=1 -> F=1 (m1)   =>  data input = C
  AB=01: C=0 -> F=0 (m2), C=1 -> F=1 (m3)   =>  data input = C
  AB=10: C=0 -> F=0 (m4), C=1 -> F=1 (m5)   =>  data input = C
  AB=11: C=0 -> F=1 (m6), C=1 -> F=0 (m7)   =>  data input = C' (NOT C)

Mux wiring:  I0=C, I1=C, I2=C, I3=C'   (select = AB)

Verified computationally against all 8 input combinations of A, B,
and C -- the mux implementation produces identical output to the
original Σ(1,3,5,6) truth table in every case. Notice this needed
zero AND/OR gates for the F itself -- just one mux and a single
inverter for the I3 input -- which is why mux-based implementation
is a real, commonly-used alternative to K-map-derived gate networks,
not just a textbook curiosity.
```

## Try It (2 Minutes)

Two 4-bit unsigned numbers, 1001 (9) and 1000 (8), are added with a 4-bit ripple-carry adder (only 4 bits of output storage available).

1. What is the mathematical sum, in decimal and binary?
2. Does the 4-bit result register alone correctly represent that sum? What does the carry-out bit indicate?
3. How does this connect to the two's-complement wraparound behavior from Fundamentals' number-systems section?

You should land on: 9 + 8 = 17 (binary 10001, a 5-bit result). The 4-bit output register can only hold 0001 (1 in decimal) — the true sum doesn't fit, and the discarded 5th bit becomes the adder's carry-out signal (=1), which a real circuit must check explicitly to detect this overflow. Verified computationally: 17 mod 16 = 1, matching the exact "2^n mod" wraparound identity Fundamentals used for two's complement — unsigned overflow and two's-complement wraparound are the same underlying hardware behavior (a fixed-width adder simply discarding a carry-out that doesn't fit), just interpreted differently depending on whether the numbers involved are being treated as signed or unsigned.

## Study Resources
- **Morris Mano, *Digital Design*** — Chapter 4 covers adder circuits and multiplexer-based logic implementation in exactly this style
- **All About Circuits — Binary Adders** (allaboutcircuits.com) — free walkthroughs of half/full adder and ripple-carry adder circuits
- **GeeksforGeeks — Implementation of Boolean Function using Multiplexer** — free reference for the mux-as-logic-implementer technique used above
