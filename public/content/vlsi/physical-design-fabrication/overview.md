# Physical Design & Fabrication — Overview

RTL Design & Computer Architecture ended with synthesis: turning RTL code into a gate-level netlist, and computing a single critical path's minimum clock period by hand (clock-to-Q + combinational delay + setup). Physical design is what happens between that netlist and an actual manufactured chip — placing every gate at a real physical location on silicon, wiring them together, and confirming the *entire* chip (not just one hand-picked path) meets timing. This page walks the physical design flow end to end and extends RTL Design's single-path timing formula to a real multi-path scenario, the way an actual timing-closure report works.

**Analogy** — Synthesis is like getting an architect's floor plan approved — you know every room exists and roughly how big it is, but nothing has been physically built. Physical design is construction: deciding exactly where each room sits in the building (floorplanning), running every pipe and wire to its actual destination (routing), and a final inspector checking that water pressure and electrical load meet code *everywhere in the building*, not just in the room you happened to check first (timing closure across every path, not just one).

## Why This Technology Comes Right After RTL Design

```
RTL Design & Computer Architecture gave you:
  A GATE-LEVEL NETLIST (conceptually, from synthesizing the FSM and
  counter modules)
  ONE timing formula, checked on ONE hand-picked critical path:
    min clock period = clock-to-Q + combinational delay + setup

Physical Design extends this directly:
  FLOORPLANNING   — decide where blocks of logic physically sit on
                     the chip
  PLACEMENT        — decide where each individual gate sits within
                     its block
  ROUTING          — connect every gate with real physical wires,
                      which have their own resistance and
                      capacitance (and therefore their own delay —
                      not free, not instant)
  STATIC TIMING
  ANALYSIS (STA)   — apply RTL Design's exact clock-to-Q + comb +
                      setup formula to EVERY path in the design, and
                      report the worst (critical) one — not just the
                      one path a human happened to check by hand
  DFT (Design for
  Test)             — add extra circuitry (scan chains) so a
                       manufactured chip can be electrically tested
                       for defects after fabrication
```

## The Physical Design Flow

```
Netlist (from RTL Design's synthesis)
   |
   v
FLOORPLANNING  -- place major blocks (ALU, register file, memory,
                  I/O pads) on the chip die, sized and positioned to
                  minimize wire length between blocks that talk to
                  each other frequently
   |
   v
PLACEMENT      -- place every individual standard cell (each gate
                  instance) within its assigned floorplan region
   |
   v
ROUTING        -- connect every placed cell with real metal wires
                  across multiple metal layers; this is where a
                  "combinational delay" stops being an abstract
                  number and becomes a real, physical wire with
                  resistance (R) and capacitance (C)
   |
   v
STATIC TIMING ANALYSIS (STA) -- check EVERY path in the design
                  against the clock-to-Q + comb + setup formula;
                  report the worst (critical) path; iterate
                  floorplanning/placement/routing until every path
                  meets timing ("timing closure")
   |
   v
DFT insertion + tape-out -- add scan chains for post-fabrication
                  testing, then send the final design to the fab
```

## Annotated Example — Finding the Critical Path Across Multiple Real Paths

RTL Design's timing example checked exactly one path. A real design has thousands to millions of paths between flip-flops; STA checks all of them and reports the worst one. A simplified 3-path example:

```
Path A (ALU output -> register):
  clock-to-Q = 1.0 ns, combinational = 7.0 ns, setup = 1.0 ns
  Total = 1.0 + 7.0 + 1.0 = 9.0 ns

Path B (memory read -> register):
  clock-to-Q = 1.0 ns, combinational = 9.5 ns, setup = 1.2 ns
  Total = 1.0 + 9.5 + 1.2 = 11.7 ns

Path C (control logic -> register):
  clock-to-Q = 0.8 ns, combinational = 4.0 ns, setup = 0.9 ns
  Total = 0.8 + 4.0 + 0.9 = 5.7 ns

Critical path = Path B, at 11.7 ns (the WORST of the three, not
the average or the first one checked)

Maximum clock frequency = 1 / 11.7 ns = 85.5 MHz
```

Verified computationally: applying RTL Design's exact three-term formula to each path independently and selecting the maximum (worst-case) total correctly identifies Path B as critical, giving a chip-wide maximum frequency of 85.5 MHz — meaning the other two paths (A and C) have timing margin to spare, but the WHOLE chip is still limited to 85.5 MHz because of Path B alone. This is the actual mechanism behind timing closure: physical designers specifically target the reported critical path (moving cells closer together, widening a wire, or restructuring logic to shorten Path B) rather than optimizing paths that already meet timing, since improving an already-fast path does nothing for the chip's overall maximum frequency.

## Fab Process Nodes — Current Landscape (needs verification — recheck against current source)

```
A "process node" (e.g., "3nm", "2nm", "18A") is the fab's
manufacturing generation -- historically tied to transistor feature
size, though modern node names are now largely marketing labels
rather than a literal physical dimension.

As of mid-2026 (verified via live search, not training-data recall):
  TSMC 2nm (N2)  — entered volume production in Q4 2025; TSMC is
                    scaling toward ~100,000 wafers/month in 2026;
                    Apple, Qualcomm, MediaTek, AMD, and NVIDIA are
                    named 2nm customers
  TSMC 3nm       — remains in high-volume, near-capacity production
                    through 2026 (~175,000 wafers/month), described
                    as its "golden period" rather than being phased
                    out
  Intel 18A      — reached high-volume manufacturing status in
                    January 2026 (Panther Lake client chips,
                    Clearwater Forest Xeon server chips); a
                    performance-optimized derivative, 18A-P, entered
                    risk production mid-2026

These are the CURRENT leading-edge nodes as of this research — this
entire section is Volatile Core content per this platform's content
standards and should be re-checked against a live source before
being treated as current, not just at the time of a future edit.
```

## India Semiconductor Mission — Current Status (needs verification — recheck against current source)

```
As of mid-2026 (verified via live search):
  Micron Sanand ATMP facility (Gujarat) — inaugurated February 28,
    2026; the first OPERATIONAL facility of the current India
    Semiconductor Mission cycle; assembly/test/packaging for DRAM
    and NAND flash, not a wafer fab
  Tata Electronics-PSMC Dholera fab (Gujarat) — India's flagship
    wafer fab project; original target was first silicon by mid-
    2026, but as of June 2026 industry sources report the clean
    room is not yet complete, with first silicon now expected in
    H1 2027 — a real, acknowledged schedule slip, not a minor detail
  Total approved ISM facilities: 12, across 6 states, ~Rs 1.64 lakh
    crore cumulative investment, as of the most recent Cabinet
    approval round (May 2026)

Distinguishing ATMP (assembly/test/packaging — Micron's Sanand
facility) from a wafer FAB (Tata-PSMC Dholera) matters: Micron's
Sanand plant is real and operational, but it does not itself
fabricate transistors on silicon — that's still pending at Dholera.
This distinction is exactly the kind of detail worth getting right
rather than glossing over when this content is next revisited.
```

## Try It (2 Minutes)

Using the same three-path STA method above, a fourth path is added: Path D (I/O buffer -> register), with clock-to-Q = 1.2 ns, combinational = 10.0 ns, setup = 1.5 ns.

1. What is Path D's total delay?
2. Does Path D become the new critical path, replacing Path B?
3. What is the new chip-wide maximum clock frequency?

You should land on: Path D total = 1.2 + 10.0 + 1.5 = 12.7 ns, which is greater than Path B's 11.7 ns — so yes, Path D becomes the new critical path. New maximum frequency = 1 / 12.7 ns ≈ 78.7 MHz, lower than before, because adding even one new slow path anywhere in the design can only hurt (or leave unchanged) the chip's overall maximum frequency — it can never improve it, since STA always reports the single worst path across the entire design.

## Study Resources
- **TSMC 2nm Technology page** (tsmc.com) — primary source for current TSMC node status, referenced above
- **Intel Foundry — Intel 18A page** (intel.com) — primary source for current Intel node status, referenced above
- **Weste & Harris, *CMOS VLSI Design*** — the standard textbook for floorplanning, placement, routing, and STA fundamentals
- **India Semiconductor Mission — official updates** (ism.meity.gov.in) — primary source for current ISM fab status; cross-check before treating any fab-status claim above as still current
