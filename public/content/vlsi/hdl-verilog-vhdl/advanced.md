# HDL — Verilog & VHDL — Advanced

Intermediate covered reusable, parameterized structure. This page covers three things that separate code that merely simulates correctly from code that's actually safe to synthesize into real silicon: sensitivity-list mistakes that cause simulation and synthesis to disagree, the real cost tradeoff of how you encode an FSM's state, and the single most common way real chips get corrupted data — a signal crossing between two different clock domains without proper synchronization.

**Analogy** — A simulation-synthesis mismatch is like a movie script that reads perfectly on paper but is physically impossible to film exactly as written — the simulator ("reading the script") accepts something a real synthesis tool ("actually filming it") either can't build at all or builds differently than the script implied. Clock domain crossing is like passing a note between two people who are each only allowed to read notes at their own randomly-timed glance — if you hand over the note at the exact instant they're mid-glance, they might read a note that's half old, half new, garbled by bad timing rather than corrupted content.

## Sensitivity List Mistakes — Why Simulation and Synthesis Can Disagree

```verilog
// WRONG (or at least dangerous) — incomplete, manually-listed
// sensitivity list
always @(a or b)          // c is used inside but NOT listed here
    y = a & b & c;

// In SIMULATION: this always block only re-evaluates when a or b
// changes — if ONLY c changes, y does NOT update in simulation,
// even though the logic clearly depends on c.
// In SYNTHESIS: a synthesis tool builds real combinational hardware
// for "y = a & b & c" regardless of the sensitivity list — in real
// silicon, y DOES respond to c changing.
// RESULT: simulation and the real synthesized chip behave
// differently for the exact same source code — a mismatch that can
// hide a real bug until it shows up in actual hardware.
```

```verilog
// CORRECT — always @(*) automatically includes every signal read
// inside the block, so simulation behavior always matches what
// synthesis actually builds
always @(*)
    y = a & b & c;
```

`always @(*)` exists specifically to eliminate this entire category of bug — every modern Verilog style guide (and every synthesis tool's own lint warnings) treats a manually-listed, incomplete sensitivity list on a combinational block as a defect to fix, not a style preference.

## FSM State Encoding — Binary vs. One-Hot

RTL Design & Computer Architecture built FSMs using ordinary binary state values (`parameter S0 = 2'b00, S1 = 2'b01, ...`). At the HDL/synthesis level, *how* those states are encoded is itself a real design choice with a genuine cost tradeoff:

```
BINARY ENCODING                      ONE-HOT ENCODING
Uses ceil(log2(N)) bits for N        Uses exactly N bits for N states
states                               — one bit per state, exactly one
                                      bit set at a time
Fewer flip-flops needed              More flip-flops needed
Next-state logic is often more       Next-state logic is often
complex (more decoding required      SIMPLER per bit (each bit's next
to figure out "which state am        value depends on fewer other
I in")                                bits), which can mean a FASTER
                                      critical path despite using
                                      more flip-flops

Bit cost for N states (verified):
  4  states -> binary = 2 bits,  one-hot = 4 bits
  8  states -> binary = 3 bits,  one-hot = 8 bits
  16 states -> binary = 4 bits,  one-hot = 16 bits
```

```verilog
// Binary encoding (what RTL Design used) — compact
parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

// One-hot encoding — same 3-state FSM, different bit representation
parameter S0 = 3'b001, S1 = 3'b010, S2 = 3'b100;
```

Neither is universally better: binary is the natural default for a small number of states or when flip-flop count is genuinely scarce; one-hot is common in FPGAs specifically (where flip-flops are relatively cheap and abundant, but combinational logic delay matters more) and in designs with a large number of states, where binary's decoding logic would otherwise become the critical path. Which encoding a synthesis tool actually uses can also be influenced by a synthesis directive/attribute rather than left entirely to the coding style — worth knowing this is a real, adjustable knob, not a fixed property of "how Verilog works."

## Clock Domain Crossing (CDC) — The Double-Flop Synchronizer

Every module so far has used a single clock. Real chips commonly have multiple clock domains (a fast core clock, a slower peripheral clock) — and passing a signal directly from one clock domain to another without synchronization is one of the most common sources of real, hard-to-debug silicon bugs.

```verilog
// DANGEROUS — signal_a (from clock domain A) read directly inside
// a block clocked by clk_b (clock domain B)
always @(posedge clk_b)
    signal_b <= signal_a;   // signal_a can change at any moment
                             // relative to clk_b's edges — if it
                             // changes too close to the edge,
                             // signal_b can go METASTABLE (settle to
                             // an unpredictable 0 or 1, or take too
                             // long to settle at all)
```

```verilog
// SAFE — two-flip-flop ("double-flop") synchronizer
reg sync_stage1, sync_stage2;
always @(posedge clk_b) begin
    sync_stage1 <= signal_a;     // may go metastable, but only this
                                  // stage is exposed to that risk
    sync_stage2 <= sync_stage1;  // by the time THIS stage samples
                                  // it, sync_stage1 has almost
                                  // always had a full clock period
                                  // to resolve to a stable 0 or 1
end
```

The double-flop pattern doesn't eliminate metastability's *possibility* — it makes the *probability* of metastability propagating into the rest of the design astronomically small, by giving the potentially-metastable signal a full clock period to settle before anything else depends on it. This exact pattern — not a workaround, but the standard, expected way to cross clock domains — is why real designs with multiple clocks are full of double-flop (or deeper) synchronizers at every domain boundary, and why directly reading a signal from one clock domain inside logic clocked by a different domain, without one, is treated as a real defect by any experienced RTL reviewer.

## Try It (2 Minutes)

A 6-state FSM needs to be encoded. Using the bit-cost table above:

1. How many bits does binary encoding need for 6 states? (Hint: `2^2 = 4` isn't enough, `2^3 = 8` is.)
2. How many bits does one-hot encoding need for 6 states?
3. If this FSM is targeting an FPGA (where flip-flops are relatively abundant) and the next-state logic was found to be the timing bottleneck, which encoding would you consider switching to, and why?

You should land on: binary needs 3 bits (since `2^2 = 4 < 6`, but `2^3 = 8 ≥ 6`); one-hot needs exactly 6 bits (one per state). Given an FPGA target and next-state logic as the bottleneck, one-hot is the reasonable direction to try — it trades 3 extra flip-flops (cheap on an FPGA) for simpler per-bit next-state logic, which is exactly the kind of tradeoff that can shorten the critical path when combinational delay, not flip-flop count, is the actual constraint.

## Study Resources
- **Cliff Cummings, "Nonblocking Assignments in Verilog" and related synthesis-coding papers** (Sunburst Design) — the widely cited source for sensitivity-list and synthesis-simulation-mismatch guidance
- **David Harris & Sarah Harris, *Digital Design and Computer Architecture*** — covers FSM state encoding tradeoffs and metastability/synchronizer design in more depth
- **ASIC World — Clock Domain Crossing** (asic-world.com) — free walkthrough of the double-flop synchronizer pattern and why it's needed
