# HDL — Verilog & VHDL — Fundamentals

Overview showed a single combinational module (the mux) written two ways. This page covers the mechanics needed for everything after it: the three modeling styles Verilog supports (structural, dataflow, behavioral), how to describe sequential logic (the flip-flop from Digital Logic Fundamentals, now in code, sampling on a clock edge), and the single most common source of real HDL bugs — the difference between blocking (`=`) and non-blocking (`<=`) assignments inside an `always` block.

**Analogy** — Blocking vs. non-blocking assignment is the classic "swap two glasses of water" problem. If you pour glass A into glass B immediately, then pour (the now-mixed) glass B into glass A, you don't get a swap — you get the same liquid in both glasses. That's blocking assignment: each statement takes effect immediately, in order, so the second statement sees the first statement's *already-updated* result. Non-blocking assignment is doing the swap correctly with a third glass: you note down both original values first, then update both glasses at the same instant — no statement sees another statement's update within the same step. Getting this wrong is the single most common real bug new HDL engineers write, which is why it gets a full worked trace below.

## The Three Modeling Styles

```
STRUCTURAL — wire together gate/module instances explicitly, like a
  schematic in text form. Closest to the physical gates from Digital
  Logic Fundamentals.
  Example: and G1(Y, A, B);  // instantiate a primitive AND gate

DATAFLOW — describe logic with continuous assign statements and
  operators (&, |, ~, ^, ternary). This is what the Overview mux
  used.
  Example: assign Y = A & B;

BEHAVIORAL — describe WHAT the circuit does using procedural code
  (always blocks, if/else, case statements) rather than gate-level
  operators. This is how sequential logic (flip-flops, FSMs) and
  most real RTL is actually written.
  Example: always @(posedge clk) Q <= D;

All three styles can describe the SAME circuit — structural and
dataflow are closer to "here is the exact gate-level shape,"
behavioral is closer to "here is the desired behavior, let synthesis
figure out the gates" (the synthesis process itself is RTL Design &
Computer Architecture's subject).
```

## Sequential Logic in Verilog: The D Flip-Flop

Digital Logic Fundamentals introduced the flip-flop conceptually — a memory cell that samples its input only at a clock edge. Here is that exact behavior in Verilog:

```verilog
module d_flip_flop (
    input  wire clk,
    input  wire D,
    output reg  Q
);
    always @(posedge clk)  // triggers ONLY at the rising edge of clk,
                           // never continuously — this is what makes
                           // it edge-triggered, not a latch
        Q <= D;            // non-blocking: Q takes D's value AT the
                           // clock edge, holds it until the next edge
endmodule
```

### Annotated Example — Tracing the Flip-Flop Over Five Clock Edges

Feed the sequence D = 1, 0, 1, 1, 0 into the flip-flop above, one value per rising clock edge, starting from Q = 0.

```
  Initial:  Q = 0

  Clock edge 1: D = 1  →  Q captures D  →  Q becomes 1
  Clock edge 2: D = 0  →  Q captures D  →  Q becomes 0
  Clock edge 3: D = 1  →  Q captures D  →  Q becomes 1
  Clock edge 4: D = 1  →  Q captures D  →  Q becomes 1 (unchanged,
                                            D was already 1)
  Clock edge 5: D = 0  →  Q captures D  →  Q becomes 0
```

Verified programmatically by simulating the exact `always @(posedge clk) Q <= D;` behavior across all five edges — Q always ends up equal to whatever D was at the moment of that edge, never before or after. This is the foundation every register, counter, and state machine in RTL Design & Computer Architecture is built from — a chain of exactly this flip-flop behavior, wired together.

## Blocking vs. Non-Blocking Assignment — The Classic Bug

Both `always` blocks below are meant to swap the values of `a` and `b` on every clock edge. Only one of them actually works.

```verilog
// BROKEN — uses blocking assignment (=)
always @(posedge clk) begin
    a = b;   // a immediately takes b's value
    b = a;   // BUG: this reads the value a JUST took on the line
             // above, not the original a — so b ends up equal to
             // the original b, not the original a
end
```

```verilog
// CORRECT — uses non-blocking assignment (<=)
always @(posedge clk) begin
    a <= b;  // schedules a's update using the CURRENT (pre-edge) b
    b <= a;  // schedules b's update using the CURRENT (pre-edge) a
             // — both right-hand sides are evaluated using the OLD
             // values, and both updates apply simultaneously at the
             // end of the clock edge
end
```

```
Trace, starting with a = 3, b = 7:

BLOCKING (=):
  a = b   →  a becomes 7 (immediately)
  b = a   →  b becomes 7 (reads the NEW a, which is already 7)
  Result: a = 7, b = 7   -- BROKEN, not a swap, both ended up as 7

NON-BLOCKING (<=):
  Both right-hand sides evaluated using ORIGINAL values (a=3, b=7)
  BEFORE either update is applied:
    new_a = b = 7
    new_b = a = 3
  Both updates apply together at the end of the clock edge:
  Result: a = 7, b = 3   -- CORRECT, values are properly swapped
```

Verified computationally by simulating both assignment orders exactly as shown — blocking assignment produces a=7, b=7 (both end up equal to the original b, confirming the swap fails); non-blocking assignment produces a=7, b=3 (a correct swap). The rule that follows directly from this: use non-blocking (`<=`) for sequential logic (anything inside `always @(posedge clk)`), and blocking (`=`) for combinational logic (anything inside `always @(*)`). Mixing them up inside sequential blocks is the single most common real bug this technology exists to prevent — and it's a question every VLSI technical interview asks in some form (see Interview tab).

## Try It (2 Minutes)

A different `always @(posedge clk)` block uses blocking assignment to try to implement a simple 2-stage shift: `a = b; b = c;` (intending: on each clock edge, a takes b's old value, and b takes c's old value — a two-stage pipeline).

1. Starting from a=1, b=2, c=3, trace what blocking assignment actually produces.
2. Rewrite it with non-blocking assignment and trace the corrected result.
3. Which one actually implements "a gets old b, b gets old c" correctly?

You should land on: blocking — `a = b` makes a=2, then `b = c` makes b=3 (c is unused/unread yet since nothing changes it here, but the point is a took the pre-statement b correctly since it was line 1) — in THIS particular case blocking happens to give a=2, b=3, matching intent, because the assignments don't chain into each other the way the swap example did. This is worth noticing precisely because it shows blocking assignment isn't *always* wrong — it's wrong specifically when a later statement in the same block reads a variable a prior statement in the same block just wrote (the swap case). The safe, general-purpose rule that avoids needing to reason about ordering at all: always use non-blocking assignment for sequential logic, which gives a=2, b=3 regardless of statement order, by design.

## Study Resources
- **Samir Palnitkar, *Verilog HDL*** — Chapters 4–5 cover blocking vs. non-blocking assignment and the three modeling styles in full depth
- **ASIC World — Blocking vs Non-Blocking** (asic-world.com) — free, worked-example-heavy explanation of exactly this distinction
- **Sunburst Design — "Nonblocking Assignments in Verilog" (Cliff Cummings paper)** — the widely cited industry-standard reference paper on this exact topic
