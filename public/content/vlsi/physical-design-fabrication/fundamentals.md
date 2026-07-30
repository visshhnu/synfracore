# Physical Design & Fabrication — Fundamentals

Overview walked the physical design flow end to end and extended RTL Design's timing formula across multiple paths. This page goes one level deeper into two specific steps: routing (where a wire's physical resistance and capacitance become a real, calculable delay — not the abstract "combinational delay" number used so far) and DFT/scan chains (how a chip, once manufactured, actually gets electrically tested for defects before it ships).

**Analogy** — Every wire on a chip is a tiny hosepipe, not an idealized instant connection. A longer, thinner hosepipe takes measurably longer for water pressure to reach the far end than a short, wide one — that lag is exactly what resistance (R, how much the pipe restricts flow) and capacitance (C, how much the pipe itself has to "fill up" before pressure propagates) do to an electrical signal on a real wire. This is why Overview's routing step matters physically, not just as a diagram step: the RC delay of an actual routed wire is a real, computable number that feeds directly into the STA critical-path calculations from Overview.

## Wire Delay: From Abstract "Combinational Delay" to a Real RC Number

```
RTL Design and Overview both treated "combinational delay" as a
given number (e.g., 7 ns) without explaining where it comes from
physically. Part of that number is gate delay (how long a
transistor takes to switch) -- but a significant part, especially
for longer wires, is the wire's own RC delay.

The standard first-order estimate is the Elmore delay:
  delay = 0.7 x R x C
  where R = total wire resistance (ohms), C = total wire
  capacitance (farads), and 0.7 is an empirically derived constant
  for a simple RC line (not exact for every topology, but the
  standard first-pass estimate used throughout the industry)
```

### Annotated Example — Computing RC Delay for a Routed Wire

A routed wire connecting two cells is 2 mm long, with resistance 50 ohm/mm and capacitance 0.2 pF/mm (illustrative interconnect values, not tied to any specific fab node — actual R/C values are technology-specific and extracted from the fab's process design kit, not universal constants).

```
Total resistance = 50 ohm/mm x 2 mm = 100 ohm
Total capacitance = 0.2 pF/mm x 2 mm = 0.4 pF

Elmore delay = 0.7 x R x C
             = 0.7 x 100 ohm x 0.4 pF
             = 28 picoseconds (ps)
```

Verified computationally: 0.7 × 100 × 0.4 = 28 ps exactly. This number is small compared to the nanosecond-scale gate delays used in Overview's STA example, which is realistic for a short, well-routed wire — but the same formula scales directly with wire length (a 10x longer wire has 10x the R and 10x the C, so 100x the delay, since delay is proportional to R×C, not R or C alone). This is exactly why floorplanning (Overview) tries to keep frequently-communicating blocks physically close together: a poorly floorplanned design can force long wires between blocks, and that added RC delay eats directly into a path's timing margin — potentially turning a path that looked fine at the gate-delay level into the new critical path once real routing delay is added.

## Standard Cell Libraries

```
Physical design doesn't place individual transistors freely -- it
places pre-designed, pre-characterized "standard cells": fixed-
height blocks implementing common gates (AND2, OR2, NAND2, a D
flip-flop, etc.), each with known area, delay, and power
characteristics already measured by the fab/library vendor.

This connects directly back to Digital Logic Fundamentals' point
about NAND/NOR being "universal gates" -- standard cell libraries
are built almost entirely around NAND/NOR-derived cells specifically
because it's cheaper to characterize, verify, and manufacture a
smaller set of well-understood cell shapes repeated billions of
times than a large variety of custom gate types.

Placement (Overview) is, mechanically, choosing WHERE on the chip
each standard cell instance from the synthesized netlist goes --
not designing new transistor-level circuits from scratch.
```

## DFT: Scan Chains and Post-Fabrication Testing

```
Once a chip is physically manufactured, defects happen -- a
manufacturing flaw might leave one gate permanently stuck at 0 or 1,
or a wire might be shorted or broken. Design for Test (DFT) adds
extra circuitry specifically so these defects can be detected
electrically, without needing to functionally exercise the whole
chip through its normal I/O pins.

The standard technique is a SCAN CHAIN: every flip-flop in the
design (the same flip-flops RTL Design's state registers and
counter used) is given an extra "test mode" input, and in test mode
they're all chained together into one giant shift register spanning
the whole chip. A tester can then:
  1. SHIFT IN a specific test pattern through the chain (bit by bit)
  2. Switch to normal mode for exactly ONE clock cycle (a "capture"
     cycle), letting the combinational logic between flip-flops
     compute real results from the test pattern
  3. SHIFT OUT the captured results and compare them against
     expected values (generated separately by ATPG -- Automatic
     Test Pattern Generation software)

This gives test access to EVERY flip-flop's value, not just the
chip's external pins -- which is essential, since a real chip may
have millions of internal flip-flops and only a few hundred pins.
```

### Annotated Example — Computing Scan Test Time

A chip's scan chain has 500 flip-flops, and the manufacturing test applies 200 test patterns at a 2 ns clock period.

```
Per pattern:
  Shift in:  500 cycles (one bit per flip-flop, serially)
  Capture:     1 cycle (switch to functional mode briefly)
  Shift out: 500 cycles (read the captured results back out)
  Total per pattern = 500 + 1 + 500 = 1,001 cycles

For 200 patterns:
  Total cycles = 1,001 x 200 = 200,200 cycles

At a 2 ns clock period:
  Total test time = 200,200 x 2 ns = 400,400 ns = 400.4 microseconds
```

Verified computationally: 1,001 cycles per pattern × 200 patterns = 200,200 total cycles, and 200,200 × 2 ns = 400,400 ns (400.4 µs). This is a simplified, non-overlapped model (real ATPG/ATE flows often overlap the shift-out of one pattern with the shift-in of the next, reducing total time) — but the core relationship holds directly: longer scan chains and more test patterns both increase test time linearly, which is exactly why real chips split one enormous scan chain into multiple shorter parallel chains — reducing shift time roughly in proportion to the number of parallel chains, at the cost of extra test I/O pins.

## Try It (2 Minutes)

A different chip has a scan chain of 800 flip-flops, tested with 150 patterns at a 1.5 ns clock period.

1. How many cycles does shifting in and out take, per pattern?
2. What is the total test time, in microseconds?
3. If the same 800 flip-flops were instead split into 4 parallel scan chains of 200 flip-flops each, what would the new per-pattern shift cost be (shift-in + capture + shift-out), and roughly how much total test time would that save?

You should land on: per pattern = 800 + 1 + 800 = 1,601 cycles; total = 1,601 × 150 = 240,150 cycles × 1.5 ns = 360,225 ns ≈ 360.2 µs. With 4 parallel chains of 200 flip-flops each, per-pattern cost drops to 200 + 1 + 200 = 401 cycles (all 4 chains shift simultaneously), giving a new total of 401 × 150 × 1.5 ns = 90,225 ns ≈ 90.2 µs — roughly a 4x reduction, directly tracking the 4x reduction in per-chain flip-flop count, which is exactly the motivation for splitting long scan chains in real designs.

## Study Resources
- **Weste & Harris, *CMOS VLSI Design*** — covers wire RC delay, standard cell libraries, and physical design fundamentals in this same style
- **Bushnell & Agrawal, *Essentials of Electronic Testing*** — the standard reference for DFT, scan chains, and ATPG
- **VLSI Universe / ChipEdge — DFT and Scan Chain tutorials** — free, practically oriented walkthroughs of scan insertion and test time calculation
