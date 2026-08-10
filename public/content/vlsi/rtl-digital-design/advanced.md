# RTL Design & Computer Architecture — Advanced

Fundamentals showed pipelining's throughput benefit assuming every instruction flows through cleanly, with no dependency between them. Real instruction sequences aren't that clean — this page quantifies what happens when they aren't: data hazards, and the concrete stall-cycle cost of resolving them with and without forwarding hardware.

**Analogy** — Fundamentals' car wash assumed every car is independent. A data hazard is like the wax station needing to know the EXACT color the wash station just applied to THIS SPECIFIC car, before it can proceed — if that information isn't available yet, the wax station must either wait (stall) or get the information routed to it directly and immediately (forwarding) rather than waiting for the car to fully exit the pipeline and be inspected first.

## RAW Hazards and the Forwarding Fix

```
A Read-After-Write (RAW) hazard: an instruction needs a register
value that an immediately preceding, still-in-flight instruction
hasn't finished computing yet.

  I1: ADD R1, R2, R3      (computes R1 = R2 + R3)
  I2: SUB R4, R1, R5      (needs R1 -- but I1 hasn't finished!)

WITHOUT FORWARDING: I2 must wait until I1's result is actually
written back to the register file (WB stage) and then re-read (ID
stage) before I2 can safely enter EX -- in a classic 5-stage
pipeline (IF, ID, EX, MEM, WB), this costs 2 stall cycles for a
back-to-back ALU-to-ALU dependency like this one.

WITH FORWARDING: a dedicated hardware path routes I1's result
directly from its EX/MEM pipeline latch straight to I2's EX-stage
input, the moment it's computed -- no stall needed at all for this
specific hazard pattern, since the result is available exactly when
I2 needs it.
```

`(needs verification — recheck against current source: exact stall-cycle counts depend on the specific pipeline's stage count and forwarding-path implementation; the classic 5-stage MIPS-style figures used here are the standard illustrative case, not a universal constant across all real processors.)`

## Annotated Example — Quantifying the Stall Cost Across 4 Instructions

Four instructions: I1 and I2 have a RAW hazard (I2 depends on I1), I2 and I3 have a RAW hazard (I3 depends on I2), and I4 has no dependency on anything before it.

```
Base case (Fundamentals' formula, no hazards at all):
  total cycles = stages + (n - 1) = 5 + (4 - 1) = 8 cycles

WITHOUT forwarding -- 2 hazards, 2 stall cycles each:
  total stalls = 2 hazards x 2 stalls = 4
  total cycles = 8 + 4 = 12 cycles
  cycles per instruction (this specific run) = 12 / 4 = 3.0

WITH full EX/MEM forwarding -- both hazards resolved, 0 stalls:
  total cycles = 8 + 0 = 8 cycles
  cycles per instruction (this specific run) = 8 / 4 = 2.0

Verified computationally: forwarding cuts this 4-instruction run
from 12 cycles down to 8 -- a real, quantified benefit, not just a
qualitative "forwarding helps." Note "cycles per instruction" here
is specific to this short 4-instruction run, not the same as the
idealized steady-state CPI-approaches-1 concept from Fundamentals --
a short run like this is dominated by pipeline fill/drain overhead
in a way a much longer instruction stream would not be.
```

## The Case Forwarding Can't Fully Fix — the Load-Use Hazard

```
A LOAD-USE hazard is a specific RAW hazard where the producing
instruction is a memory load, not an ALU operation:

  I1: LW  R1, 0(R2)       (loads R1 from memory -- result only
                            available at the END of the MEM stage)
  I2: ADD R4, R1, R5      (needs R1 -- but I2's EX stage happens
                            ONE CYCLE BEFORE I1's MEM stage finishes)

Even with full forwarding hardware in place, I1's loaded value
physically doesn't exist yet at the moment I2's EX stage needs it --
forwarding can route the value the INSTANT it becomes available
(right after MEM), but it cannot route a value that hasn't been
computed yet. This specific hazard pattern still requires exactly
1 stall cycle, even in a fully-forwarded pipeline -- a well-known,
textbook-standard limitation of the classic 5-stage design, not a
sign that the forwarding hardware is somehow incomplete.
```

## Try It (2 Minutes)

Using the same 4-instruction structure, but replace the I1→I2 hazard with a load-use hazard (I1 is now `LW R1, 0(R2)`, I2 is `ADD R4, R1, R5`), while I2→I3 remains a normal, fully-forwardable ALU-to-ALU hazard, and I4 remains independent.

1. With full forwarding, how many stall cycles does the load-use hazard require?
2. How many stall cycles does the I2→I3 hazard require (with forwarding)?
3. What is the new total cycle count and cycles-per-instruction for this 4-instruction run?

You should land on: the load-use hazard requires 1 stall cycle even with forwarding (as explained above); the I2→I3 ALU-to-ALU hazard requires 0 stall cycles with forwarding (same as the annotated example). Total stalls = 1 + 0 = 1. Total cycles = 8 (base) + 1 = 9 cycles. Cycles per instruction for this run = 9 / 4 = 2.25 — worse than the fully-forwardable 2.0 case, but still meaningfully better than the no-forwarding 3.0 case, showing forwarding hardware helps significantly even in a case (load-use) where it can't eliminate every stall.

## Study Resources
- **John Hennessy & David Patterson, *Computer Organization and Design*** — the standard reference for hazard classification, forwarding, and the load-use stall, covered in exactly this depth
- **David Harris & Sarah Harris, *Digital Design and Computer Architecture*** — covers pipeline hazards with a hardware-implementation-level view of the forwarding paths themselves
- **ASIC World — Static Timing Analysis Basics** (asic-world.com) — background on the timing constraints (setup/hold) that pipeline stage boundaries must also satisfy, alongside the hazard logic covered here
