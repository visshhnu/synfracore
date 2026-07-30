# Functional Verification — Overview

RTL Design & Computer Architecture built two real modules — the `seq_detector_101` Mealy FSM and the `counter_4bit` counter — and verified their behavior by hand-tracing the state tables. In a real design flow, you don't verify a chip's actual RTL by hand — you write a separate piece of code, a testbench, whose entire job is to stimulate the design and automatically check whether its outputs are correct. This page builds a self-checking testbench for the exact `seq_detector_101` module from RTL Design & Computer Architecture — same input stream, same expected output sequence — rather than inventing a new example, so the connection between "design" and "verification" is concrete, not asserted.

**Analogy** — If RTL design is writing the recipe and cooking the dish, verification is a food inspector who never trusts the chef's word that the dish came out right — they taste it against a known-correct reference every single time, and they specifically try feeding the kitchen unusual or edge-case ingredients to see if it still holds up. A testbench is exactly that inspector, automated: it applies inputs to a design and checks outputs against an independently-computed expected result, rather than assuming the design worked just because it compiled or ran without crashing.

## Why This Technology Comes Right After RTL Design

```
RTL Design & Computer Architecture produced two artifacts this
technology reuses directly, not conceptually:

  seq_detector_101 module  — the exact Verilog module from that
                              page's Overview, unchanged
  Input stream "1011010"   — the exact bit stream traced there
  Expected outputs          — the exact sequence 0,0,1,0,0,1,0,
                              already verified against a manual scan
                              of the bit stream for "101" occurrences

This page's testbench does not re-derive a new FSM or invent a new
input sequence — it takes the EXACT design and EXACT expected
behavior RTL Design already established, and automates the checking
process that page did by hand-tracing a table.
```

## Testbench Structure

```
Every testbench has three core jobs, regardless of language or
methodology:

  1. STIMULUS GENERATION — apply inputs to the Design Under Test
     (DUT). Here: feed the bits of "1011010" into seq_detector_101,
     one per clock edge.
  2. DUT INSTANTIATION — the actual design being tested, wired up
     exactly as it would be in the real chip.
  3. CHECKING — compare the DUT's actual output against an
     independently-known-correct expected result, and report
     pass/fail — NOT just observe the output and assume it's right.

A testbench that only generates stimulus and watches waveforms
without automated checking is not self-checking, and doesn't scale —
a human would have to inspect every waveform by eye. The example
below automates step 3 explicitly.
```

## Annotated Example — A Self-Checking Testbench for `seq_detector_101`

```verilog
module tb_seq_detector_101;
    reg clk = 0, rst = 1, bit_in;
    wire detected;

    // DUT instantiation -- the EXACT module from RTL Design &
    // Computer Architecture, unmodified
    seq_detector_101 dut (
        .clk(clk), .rst(rst), .bit_in(bit_in), .detected(detected)
    );

    always #5 clk = ~clk;  // 10ns clock period (simulation-only construct)

    // The exact input stream and expected output sequence from
    // RTL Design & Computer Architecture's Overview trace
    reg [6:0] stimulus = 7'b1011010;   // bits: 1,0,1,1,0,1,0
    reg [6:0] expected = 7'b0010010;   // outputs: 0,0,1,0,0,1,0

    integer i;
    integer errors = 0;

    initial begin
        rst = 1; @(negedge clk); rst = 0;
        for (i = 6; i >= 0; i = i - 1) begin
            bit_in = stimulus[i];
            @(negedge clk);  // sample after the rising edge has settled
            if (detected !== expected[i]) begin
                $display("MISMATCH at bit index %0d: got %b, expected %b",
                          6 - i, detected, expected[i]);
                errors = errors + 1;
            end
        end
        if (errors == 0)
            $display("PASS: all 7 outputs matched expected sequence");
        else
            $display("FAIL: %0d mismatch(es) found", errors);
        $finish;
    end
endmodule
```

### Verifying the Testbench Itself Catches Real Bugs

A testbench is only trustworthy if it actually fails when the design is wrong — not just when it's right. To confirm this, the same comparison logic above was run against two DUT versions:

```
CORRECT DUT (seq_detector_101 exactly as written in RTL Design):
  Outputs: 0,0,1,0,0,1,0
  Compared to expected: 0,0,1,0,0,1,0
  Result: PASS, 0 mismatches

DELIBERATELY BUGGY DUT (detected line changed to never assert 1):
  Outputs: 0,0,0,0,0,0,0
  Compared to expected: 0,0,1,0,0,1,0
  Result: FAIL, 2 mismatches
    - bit index 2: got 0, expected 1
    - bit index 5: got 0, expected 1
```

Verified computationally by running the exact comparison logic above against both a correct and a deliberately broken version of the FSM — the testbench correctly passes the real design and correctly flags the exact two bit positions (2 and 5) where the buggy version fails to detect "101," matching precisely where RTL Design's Overview trace showed detection should occur. This is what "self-checking" actually means in practice: a testbench that would catch a real bug, not just one that runs without erroring.

## Try It (2 Minutes)

Using the same testbench structure above, suppose the buggy DUT instead asserted `detected` one cycle LATE (a one-cycle timing bug) — so its actual output sequence came out as `0,0,0,1,0,0,1` instead of the expected `0,0,1,0,0,1,0`.

1. At which bit indices would the testbench report a mismatch?
2. Would a testbench that only checked "does detected ever go high at least twice" (without checking WHEN) catch this bug?

You should land on: comparing `0,0,0,1,0,0,1` against expected `0,0,1,0,0,1,0` position-by-position finds mismatches at indices 2 (expected 1, got 0), 3 (expected 0, got 1), 5 (expected 1, got 0), and 6 (expected 0, got 1) — four mismatches. A looser check that only counted "how many times did detected go high" would see 2 highs in both the correct and buggy versions and incorrectly report a pass — missing the timing bug entirely. This is precisely why exact, position-by-position (or cycle-by-cycle) checking matters more than a loose summary check, and it's the reasoning behind why real verification environments use precise expected-value comparison rather than approximate pass criteria.

## Study Resources
- **Chris Spear & Greg Tumbush, *SystemVerilog for Verification*** — the standard reference for testbench structure and self-checking verification methodology
- **ASIC World — Verilog Testbenches** (asic-world.com) — free, worked examples of exactly this stimulus/DUT/checker testbench pattern
- **Janick Bergeron, *Writing Testbenches*** — the widely cited reference on systematic, self-checking testbench design principles
