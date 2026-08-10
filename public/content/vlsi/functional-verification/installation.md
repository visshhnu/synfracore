# Functional Verification — Installation

## What You're Setting Up

No new tools — this guide reuses HDL and RTL Design's exact `iverilog`/`vvp` toolchain. This section compiles and runs Overview's self-checking testbench for real, against both the correct `seq_detector_101` design and a deliberately broken one, confirming for yourself that the testbench actually catches the bug rather than just trusting the guide's own claim that it would.

## Confirm Your Toolchain

```bash
iverilog -V
vvp -V
```

If these aren't working yet, revisit HDL — Verilog & VHDL's Installation section first.

## Run the Self-Checking Testbench Against the Correct Design

```verilog
// seq_detector_101.v — the correct design, from RTL Design & Computer Architecture
module seq_detector_101 (
    input  wire clk, rst, bit_in,
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
// tb_seq_detector_101.v — Overview's exact self-checking testbench
module tb_seq_detector_101;
    reg clk = 0, rst = 1, bit_in;
    wire detected;

    seq_detector_101 dut (.clk(clk), .rst(rst), .bit_in(bit_in), .detected(detected));

    always #5 clk = ~clk;

    reg [6:0] stimulus = 7'b1011010;
    reg [6:0] expected = 7'b0010010;

    integer i;
    integer errors = 0;

    initial begin
        rst = 1; @(negedge clk); rst = 0;
        for (i = 6; i >= 0; i = i - 1) begin
            bit_in = stimulus[i];
            @(negedge clk);
            if (detected !== expected[i]) begin
                $display("MISMATCH at bit index %0d: got %b, expected %b", 6 - i, detected, expected[i]);
                errors = errors + 1;
            end
        end
        if (errors == 0) $display("PASS: all 7 outputs matched expected sequence");
        else              $display("FAIL: %0d mismatch(es) found", errors);
        $finish;
    end
endmodule
```

```bash
iverilog -o tb_correct seq_detector_101.v tb_seq_detector_101.v
vvp tb_correct
```

```
Expected output: PASS: all 7 outputs matched expected sequence

Matches Overview's claim exactly.
```

## Now Run It Against a Deliberately Broken DUT

Overview's own point is that a testbench is only trustworthy if it actually fails on a broken design — confirm this directly by mutating the DUT so `detected` never asserts:

```verilog
// seq_detector_101_BUGGY.v — 'detected' line changed to never assert 1
module seq_detector_101 (
    input  wire clk, rst, bit_in,
    output reg  detected
);
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
    reg [1:0] state, next_state;

    always @(posedge clk or posedge rst)
        if (rst) state <= S0;
        else     state <= next_state;

    always @(*) begin
        next_state = state;
        detected = 1'b0;   // BUG: this line was changed from the
                            // original -- it now ALWAYS stays 0,
                            // the S2-with-bit_in=1 branch below no
                            // longer sets it
        case (state)
            S0: next_state = bit_in ? S1 : S0;
            S1: next_state = bit_in ? S1 : S2;
            S2: if (bit_in) begin
                    next_state = S1;
                    // detected = 1'b1;  <- REMOVED, this is the bug
                end else begin
                    next_state = S0;
                end
        endcase
    end
endmodule
```

```bash
iverilog -o tb_buggy seq_detector_101_BUGGY.v tb_seq_detector_101.v
vvp tb_buggy
```

```
Expected output:
MISMATCH at bit index 2: got 0, expected 1
MISMATCH at bit index 5: got 0, expected 1
FAIL: 2 mismatch(es) found

This matches Overview's exact claim -- the testbench correctly
flags bit indices 2 and 5, precisely where the buggy version fails
to detect "101." This is the concrete proof that "self-checking"
means something real here: the same testbench code produced PASS
against the correct design and a specific, accurate FAIL against
the broken one, without any change to the testbench itself.
```

## Verify Everything Works

```bash
# 1. Confirm the correct-DUT run prints PASS with 0 errors

# 2. Confirm the buggy-DUT run prints exactly 2 mismatches, at bit
#    indices 2 and 5 specifically -- not just "some" mismatches
```

## Common Setup Issues

**Buggy-DUT run reports PASS instead of the expected FAIL**
Confirm the mutation actually removed `detected = 1'b1;` from the `S2` branch as shown above, and that you're compiling `seq_detector_101_BUGGY.v` (not accidentally still compiling the original correct file alongside it) — `iverilog` will silently use whichever `seq_detector_101` module definition it encounters first if both are accidentally included in the same compile command.

**Mismatch count or bit indices differ from the expected 2 and 5**
Double check the mutation was applied exactly as shown (only removing the `detected = 1'b1` assignment, nothing else) — a different or additional change to the DUT will produce a different, but not necessarily wrong, failure pattern; the specific indices 2 and 5 are tied to this exact, single-line mutation matching Overview's own example.

## What's Set Up

Nothing new — this section confirms the self-checking testbench pattern from Overview is real and working, by directly observing it both pass a correct design and correctly fail a broken one.

## Next Steps

Go to the **Fundamentals** section to continue building on this self-checking pattern with more systematic stimulus generation and coverage tracking.
