# RTL Design & Computer Architecture — Overview

**Before you start:** [HDL — Verilog & VHDL](/academies/vlsi/hdl-verilog-vhdl/overview) is assumed.

HDL — Verilog & VHDL taught you to describe both combinational logic (the mux) and sequential logic (the D flip-flop) in code. RTL (Register-Transfer Level) design is the discipline of composing many flip-flops and combinational blocks into something with actual behavior over time — a circuit that remembers where it is in a sequence and reacts differently depending on that memory. The centerpiece of this page is a Finite State Machine (FSM): the standard way to design any circuit whose next output depends not just on current inputs, but on what's already happened.

**Analogy** — A vending machine is a finite state machine. It doesn't just react to the current coin — it remembers how much money has already been inserted (its "state"), and the same next coin produces a different outcome depending on that memory: 5 rupees when the machine has already counted 15 rupees toward a 20-rupee item behaves completely differently from the same 5 rupees inserted into an empty machine. An FSM formalizes exactly this: a fixed set of states, and rules for which state comes next given the current state and current input — precisely the "remembers where it is" idea that separates RTL design from the purely combinational logic of Digital Logic Fundamentals and the single-flip-flop examples of HDL — Verilog & VHDL.

## Why This Technology Comes Right After HDL

```
HDL — Verilog & VHDL gave you two isolated primitives:
  COMBINATIONAL LOGIC  →  assign / dataflow statements (the mux)
  ONE FLIP-FLOP         →  always @(posedge clk) Q <= D;  (memory
                            for exactly one bit)

RTL Design composes both primitives into something bigger, with a
name every real chip uses:
  STATE REGISTER   — a group of flip-flops (from HDL) holding which
                      state the FSM is currently in
  NEXT-STATE LOGIC  — combinational logic (from HDL, and ultimately
                      Digital Logic Fundamentals' Boolean algebra)
                      computing which state comes next
  OUTPUT LOGIC      — combinational logic computing the output,
                      either from state alone (Moore machine) or
                      from state AND current input together (Mealy
                      machine, used in the example below)

This is not a new circuit primitive — it's the same flip-flop and
combinational-logic vocabulary from the previous two technologies,
arranged into a specific, named, reusable pattern.
```

## Moore vs. Mealy — The Two FSM Types

```
MOORE MACHINE                      MEALY MACHINE
Output depends ONLY on the         Output depends on the CURRENT
current state.                     STATE and the CURRENT INPUT
                                    together.
Output changes only when the       Output can change as soon as the
state changes (after a clock       input changes, even before the
edge).                              next clock edge.
Generally needs one MORE state     Generally needs FEWER states for
than the equivalent Mealy design   the same behavior, but the output
(to give the output its own        is more sensitive to input timing
dedicated state).                  glitches, since it reacts
                                    immediately to input changes.

Neither is universally "better" — it's a real design tradeoff
between state count and output-timing behavior, and both types
appear regularly in real designs.
```

```conceptgrid
{
  "boxes": [
    { "title": "Moore Machine", "description": "Output depends ONLY on current state -- changes only on clock edge", "color": "blue" },
    { "title": "Mealy Machine", "description": "Output depends on state AND input -- fewer states, more input-sensitive", "color": "purple" }
  ]
}
```

## Annotated Example — A Mealy "101" Sequence Detector

Design goal: build an FSM that outputs 1 for exactly one clock cycle whenever the last three bits received were "1, 0, 1" — including overlapping occurrences (so "1011" contains "101" once, and "10101" contains it twice, at overlapping positions).

```verilog
module seq_detector_101 (
    input  wire clk,
    input  wire rst,
    input  wire bit_in,
    output reg  detected
);
    // Three states: S0 = no progress, S1 = saw '1', S2 = saw '10'
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
    reg [1:0] state, next_state;

    // STATE REGISTER — exactly the flip-flop pattern from HDL,
    // now holding 2 bits instead of 1
    always @(posedge clk or posedge rst)
        if (rst) state <= S0;
        else     state <= next_state;

    // NEXT-STATE AND OUTPUT LOGIC — combinational, Mealy-style:
    // 'detected' depends on state AND bit_in together
    always @(*) begin
        next_state = state;  // default: stay put
        detected = 1'b0;     // default: no detection this cycle
        case (state)
            S0: next_state = bit_in ? S1 : S0;
            S1: next_state = bit_in ? S1 : S2;
            S2: if (bit_in) begin
                    next_state = S1;
                    detected   = 1'b1;  // completes "101" this cycle
                end else begin
                    next_state = S0;
                end
        endcase
    end
endmodule
```

### Tracing the FSM Against a Real Bit Stream

Feed the bit stream `1011010` in, one bit per clock edge, starting from state S0:

```
  bit  state->next   detected
  1    S0 -> S1         0
  0    S1 -> S2         0
  1    S2 -> S1         1    <- completes "101" at positions 0-2
  1    S1 -> S1         0
  0    S1 -> S2         0
  1    S2 -> S1         1    <- completes "101" at positions 3-5
                              (overlap: bit at position 3 is reused
                              as the start of the second match)
  0    S1 -> S2         0

  Output sequence: 0,0,1,0,0,1,0
```

Verified computationally against a full FSM simulation of this exact state table and input stream — matches a manual scan of the bit stream for every occurrence of "101" (found at positions 0–2 and, overlapping, at positions 3–5). This trace — the exact state table, the exact input stream, and the exact expected output sequence — is reused directly in Functional Verification's testbench for this same module, rather than re-derived from scratch there.

## Try It (2 Minutes)

Using the same FSM (S0/S1/S2, Mealy-style "101" detection) traced above, work through the bit stream `10100` by hand.

1. What state does the FSM pass through after each bit?
2. At which bit position (if any) does `detected` go to 1?
3. Does the answer change if the bit stream were `10010` instead?

You should land on: for `10100` — S0→S1 (bit=1), S1→S2 (bit=0), S2→S1 with detected=1 (bit=1, completing "101" at positions 0–2), S1→S2 (bit=0), S2→S0 (bit=0) — detected is 1 only at position 2. For `10010` — S0→S1 (bit=1), S1→S2 (bit=0), S2→S0 (bit=0, no "1" arrives to complete "101"), S0→S1 (bit=1), S1→S2 (bit=0) — detected never goes to 1, because "101" never actually occurs in that bit stream (the pattern is "1,0,0,1,0", not "1,0,1" anywhere).

## Study Resources
- **David Harris & Sarah Harris, *Digital Design and Computer Architecture*** — the standard textbook covering FSM design, Moore/Mealy machines, and RTL composition in exactly this style
- **ASIC World — Finite State Machines** (asic-world.com) — free walkthroughs of Moore/Mealy FSM coding patterns in Verilog
- **Neso Academy — Mealy and Moore Machines** (YouTube) — free video walkthroughs of the state-table-to-hardware process
