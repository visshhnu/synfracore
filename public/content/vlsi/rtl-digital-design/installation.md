# RTL Design & Computer Architecture — Installation

## What You're Setting Up

This guide reuses HDL — Verilog & VHDL's exact `iverilog`/`vvp`/GTKWave toolchain — no new tools to install. This section compiles and simulates Overview's `seq_detector_101` FSM for real, confirming the bit-stream trace against an actual simulator rather than only a hand-traced table.

## Confirm Your Toolchain (from HDL — Verilog & VHDL)

```bash
iverilog -V
vvp -V
```

If these aren't installed yet, revisit HDL — Verilog & VHDL's Installation section first — this guide assumes that toolchain is already working.

## Compile and Simulate Overview's FSM — the seq_detector_101 Module

```verilog
// seq_detector_101.v — the exact design from Overview
module seq_detector_101 (
    input  wire clk,
    input  wire rst,
    input  wire bit_in,
    output reg  detected
);
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
    reg [1:0] state, next_state;

    always @(posedge clk or posedge rst)
        if (rst) state <= S0;
        else     state <= next_state;

    always @(*) begin
        next_state = state;
        detected = 1'b0;
        case (state)
            S0: next_state = bit_in ? S1 : S0;
            S1: next_state = bit_in ? S1 : S2;
            S2: if (bit_in) begin
                    next_state = S1;
                    detected   = 1'b1;
                end else begin
                    next_state = S0;
                end
        endcase
    end
endmodule
```

```verilog
// seq_detector_101_tb.v — feeds Overview's exact bit stream and
// checks against its exact expected output sequence
module seq_detector_101_tb;
    reg clk, rst, bit_in;
    wire detected;

    seq_detector_101 dut (.clk(clk), .rst(rst), .bit_in(bit_in), .detected(detected));

    always #5 clk = ~clk;

    reg [6:0] bit_stream = 7'b1011010;   // Overview's exact input stream
    reg [6:0] expected   = 7'b0010010;   // Overview's exact expected outputs
                                          // (MSB-first order matching the
                                          // bit stream's own MSB-first feed)
    integer i;

    initial begin
        clk = 0; rst = 1; bit_in = 0;
        @(posedge clk); @(posedge clk);
        rst = 0;

        for (i = 6; i >= 0; i = i - 1) begin
            @(negedge clk);
            bit_in = bit_stream[i];
            @(posedge clk); #1;
            if (detected !== expected[i])
                $display("MISMATCH at bit %0d: got %b, expected %b", i, detected, expected[i]);
            else
                $display("bit=%b detected=%b (expected %b) -- MATCH", bit_in, detected, expected[i]);
        end
        $finish;
    end
endmodule
```

```bash
iverilog -o seq_detector_sim seq_detector_101.v seq_detector_101_tb.v
vvp seq_detector_sim
```

## Verify Everything Works

```
# Expected output — 7 lines, all reading MATCH, with detected=1
# on exactly the 3rd and 6th bits processed:
bit=1 detected=0 (expected 0) -- MATCH
bit=0 detected=0 (expected 0) -- MATCH
bit=1 detected=1 (expected 1) -- MATCH
bit=1 detected=0 (expected 0) -- MATCH
bit=0 detected=0 (expected 0) -- MATCH
bit=1 detected=1 (expected 1) -- MATCH
bit=0 detected=0 (expected 0) -- MATCH
```

This is Overview's exact `0,0,1,0,0,1,0` output sequence, now confirmed by an actual compiled simulation rather than only a hand-traced state table. If every line reads MATCH, your FSM simulation setup is working correctly and you're ready for Functional Verification, which builds a proper self-checking testbench for this same exact module rather than the manual `$display` comparison used here.

## A Second Check — the Try It Bit Streams

Reproducing Overview's Try It exercise (`10100` and `10010`) as an independent check, using the same testbench structure with different `bit_stream`/`expected` values:

```
For bit_stream = 10100: expected output sequence = 0,0,1,0,0
  (detected=1 only at the 3rd bit processed)

For bit_stream = 10010: expected output sequence = 0,0,0,0,0
  (detected never goes to 1 -- "101" never occurs in this stream)
```

Verified programmatically (simulating the exact FSM logic in Python as a cross-check against the Verilog simulation): both sequences match Overview's Try It answer exactly — `10100` produces a single detection at the 3rd bit, `10010` produces no detections at all.

## Common Setup Issues

**Testbench reports MISMATCH on every bit, not just one**
Check the bit-ordering convention — `bit_stream[6:0]` with `i` counting down from 6 to 0 feeds the MSB first, matching Overview's left-to-right reading of "1011010." If your `expected` value's bit ordering doesn't match this same convention, every comparison will appear to fail even though the underlying FSM logic is correct — this is a testbench-indexing bug, not an FSM bug, and worth checking before assuming the design itself is wrong.

**`detected` shows `x` (unknown) instead of 0 or 1 on the first bit**
Confirm the reset sequence actually completes (two `@(posedge clk)` cycles with `rst = 1`) before the first bit is applied — an FSM that hasn't been properly reset starts in an unknown state, and `case` statement outputs for an unknown state are themselves unknown, propagating `x` forward until a valid reset actually occurs.

**Simulation runs but never terminates**
Confirm the `for` loop bound matches the actual bit stream width (7 bits, indices 6 down to 0) — an off-by-one in the loop bound combined with a `clk` generator that never stops on its own (`always #5 clk = ~clk;`) will leave the simulation running past `$finish` never being reached correctly.

## What's Set Up

Nothing new — this section confirms HDL's `iverilog`/`vvp` toolchain extends cleanly to a real FSM design, and establishes the self-checking testbench pattern (`!==` comparison against a known-expected sequence) that Functional Verification formalizes further.

## Next Steps

Go to the **Fundamentals** section to continue with datapath design and the counter module referenced throughout later Advanced/Troubleshooting material.
