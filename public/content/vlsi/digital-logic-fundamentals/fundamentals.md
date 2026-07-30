# Digital Logic & Design Fundamentals — Fundamentals

Overview showed *why* Boolean algebra and gates matter and how to simplify a small expression by hand. This page teaches the actual mechanics you'll use in every later technology: how to convert numbers between decimal, binary, and hexadecimal (the representations HDL code and datasheets constantly switch between), how sequential logic differs from combinational logic (the difference between a calculator and a memory), and how to read a Karnaugh map (K-map) — the standard visual tool for simplifying Boolean expressions that's faster and less error-prone than algebra once you have more than 2–3 variables.

**Analogy** — Combinational logic is a vending machine: press the same buttons, get the same result, every time, with no memory of what you bought last time. Sequential logic is a bank account: the balance after a deposit depends not just on the deposit itself but on what the balance already was. Every digital chip is built from exactly these two kinds of building blocks — combinational logic that computes from current inputs only, and sequential logic (flip-flops, registers) that remembers state from one clock cycle to the next.

## Number Systems: Binary, Hexadecimal, and Conversions

```
Digital circuits only ever store 1s and 0s (binary). Humans read
decimal. Engineers write hexadecimal as shorthand for binary because
it's 4x shorter and each hex digit maps to exactly 4 bits — no
rounding, no ambiguity.

DECIMAL → BINARY (repeated division by 2, read remainders bottom-up)
  Example: 37 (decimal)
    37 / 2 = 18 remainder 1
    18 / 2 =  9 remainder 0
     9 / 2 =  4 remainder 1
     4 / 2 =  2 remainder 0
     2 / 2 =  1 remainder 0
     1 / 2 =  0 remainder 1
  Read remainders bottom-to-top: 100101
  37 (decimal) = 00100101 (8-bit binary)   -- verified programmatically

BINARY → HEXADECIMAL (group bits in 4s from the right, convert each
group)
  00100101  →  0010 | 0101  →  2 | 5  →  0x25
  37 (decimal) = 0x25 (hex)   -- verified programmatically, matches
  the binary conversion above exactly (4 bits = 1 hex digit, always)
```

### Annotated Example — Two's Complement (How Negative Numbers Are Stored)

Digital circuits have no minus sign — negative numbers are represented using two's complement, which lets addition hardware handle both positive and negative numbers with the exact same adder circuit.

```
To represent -37 in 8-bit two's complement:

Step 1: Write +37 in 8-bit binary
  37 = 00100101

Step 2: Invert every bit (one's complement)
  00100101  →  11011010

Step 3: Add 1
  11011010 + 1 = 11011011

-37 in 8-bit two's complement = 11011011   -- verified computationally
(11011011 binary = 219 decimal; 256 - 37 = 219, confirming the
two's-complement identity: negative N, in n bits, equals 2^n - N)

Why this matters: an 8-bit adder circuit adding 00100101 (37) and
11011011 (-37) produces 100000000 — a 9-bit result that, truncated
back to 8 bits (the carry-out is simply discarded), is 00000000 —
zero. The SAME adder hardware that adds two positive numbers
correctly handles this negative case with no special circuitry,
which is the entire reason two's complement is the universal choice
in real chips (covered again from the physical-adder-circuit side in
RTL Design & Computer Architecture).
```

## Combinational vs. Sequential Logic

```
COMBINATIONAL LOGIC
  Output depends ONLY on current inputs.
  Examples: adders, multiplexers, decoders, the AND/OR/NOT gate
  networks from the Overview page.
  No memory, no clock — change an input, the output changes
  (almost) immediately, limited only by gate delay.

SEQUENTIAL LOGIC
  Output depends on current inputs AND stored state (what happened
  before).
  Building block: the flip-flop — a 1-bit memory cell that updates
  only on a clock edge (a "tick"), not continuously.
  Examples: registers (arrays of flip-flops), counters, finite state
  machines (FSMs) — the topic RTL Design & Computer Architecture
  builds directly on top of this.

This is the same combinational/sequential split every real chip
uses: combinational logic computes; sequential logic remembers what
was computed. A CPU is, at the largest scale, just an enormous
arrangement of both kinds working together on a shared clock.
```

## Karnaugh Maps (K-Maps): Visual Boolean Simplification

```
A K-map arranges every possible input combination (every "minterm")
into a grid where adjacent cells differ by exactly one bit — so
groups of adjacent 1s can be circled and read off directly as a
simplified term, without doing the algebra by hand.

4-variable K-map layout for F(A,B,C,D), rows = AB, columns = CD,
each row/column ordered 00,01,11,10 (NOT 00,01,10,11 — this "Gray
code" ordering is what makes adjacent cells differ by only one bit):

           CD=00  CD=01  CD=11  CD=10
  AB=00  |   m0  |  m1  |  m3  |  m2  |
  AB=01  |   m4  |  m5  |  m7  |  m6  |
  AB=11  |  m12  | m13  | m15  | m14  |
  AB=10  |   m8  |  m9  | m11  | m10  |
```

### Annotated Example — Reducing F(A,B,C,D) = Σ(0,4,8,12)

```
Mark a 1 in cells m0, m4, m8, m12 (the given minterms), 0 elsewhere:

           CD=00  CD=01  CD=11  CD=10
  AB=00  |    1  |   0  |   0  |   0  |
  AB=01  |    1  |   0  |   0  |   0  |
  AB=11  |    1  |   0  |   0  |   0  |
  AB=10  |    1  |   0  |   0  |   0  |

All four 1s sit in the CD=00 column, spanning every row of AB. A
group spanning an entire column/row means the variables that DON'T
change across that group drop out of the answer, and the variables
that stay constant across it (here: C=0 and D=0 in every marked
cell, regardless of A or B) are what's left.

F(A,B,C,D) = C'D'

Verified computationally against all 16 input combinations of A,
B, C, and D — C'D' produces exactly the same output as the original
4-minterm sum-of-products in every case. Four minterms (which would
need 4 separate 4-input AND gates plus an OR gate, written out
algebraically) collapse to two literals and a single 2-input AND
gate once you see the column pattern.
```

## Try It (2 Minutes)

Given F(A,B,C,D) = Σ(1,3,5,7,9,11,13,15) — plot it on the same 4-variable K-map layout above.

1. Which minterms get marked with a 1?
2. What single condition is true in every one of those minterms (check the D column value in each)?
3. What does F simplify to?

You should land on: minterms 1,3,5,7,9,11,13,15 are exactly every minterm where D=1 (odd-numbered minterms in this encoding always have D=1), and every minterm where D=0 is excluded. The entire 1-column pattern collapses to a single literal: F = D. Verified computationally against all 16 input combinations — this is the simplest possible K-map result (a function that reduces to one input variable, needing no gates at all, just a wire), and it's included specifically because real designs occasionally do reduce this far, and it's worth recognizing rather than assuming a mistake was made.

## Study Resources
- **Morris Mano, *Digital Design*** — Chapters 2–3 cover number systems, sequential logic, and K-maps with the same worked-example style used above
- **All About Circuits — Karnaugh Mapping** (allaboutcircuits.com) — free, step-by-step K-map tutorials with additional worked examples
- **GeeksforGeeks — Number System Conversions** — free reference for binary/hex/two's-complement conversion practice problems
