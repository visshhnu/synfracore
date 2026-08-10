# HDL — Verilog & VHDL — Installation

## What You're Installing

Icarus Verilog (`iverilog`) — a free, open-source Verilog compiler and simulator — plus GTKWave, a waveform viewer, so you can actually compile, run, and watch the exact examples from Overview and Fundamentals rather than only reading them. Both are IEEE-1364-compliant and entirely local — nothing here requires a licensed EDA tool, an FPGA, or cloud access.

## Install Icarus Verilog and GTKWave

```bash
# Linux (Debian/Ubuntu)
sudo apt update
sudo apt install iverilog gtkwave

# macOS (Homebrew)
brew install icarus-verilog gtkwave

# Windows — use the combined installer maintained at bleyer.org
# (bundles Icarus Verilog, GTKWave, and the GCC toolchain iverilog
# needs internally): https://bleyer.org/icarus/
```

```bash
# Verify both installed correctly
iverilog -V
gtkwave --version
```

`(needs verification — recheck against current source: exact version numbers change with each release; confirm you have a reasonably recent version via the commands above rather than relying on a specific version number here.)`

## No-Install Alternative: EDA Playground

If you want to try a snippet immediately without installing anything, EDA Playground (edaplayground.com) runs Verilog/VHDL/SystemVerilog in the browser against several real simulators, including Icarus Verilog — useful for quick experiments, though a local install is worth having for anything beyond single-file snippets, since Installation's own workflow (separate design and testbench files, waveform dumps) is easier with real files on disk.

## Compile and Simulate Your First Module — the Overview Mux

This is the exact `mux2to1` module from Overview, now compiled and actually run rather than just traced by hand.

```verilog
// mux2to1.v — the design
module mux2to1 (
    input  wire S,
    input  wire I0,
    input  wire I1,
    output wire Y
);
    assign Y = S ? I1 : I0;
endmodule
```

```verilog
// mux2to1_tb.v — a minimal self-checking testbench
module mux2to1_tb;
    reg S, I0, I1;
    wire Y;

    mux2to1 dut (.S(S), .I0(I0), .I1(I1), .Y(Y));

    integer i;
    reg [2:0] vec;   // {S, I0, I1} packed into 3 bits
    reg expected;

    initial begin
        $display("S I0 I1 | Y expected | PASS/FAIL");
        for (i = 0; i < 8; i = i + 1) begin
            vec = i[2:0];
            {S, I0, I1} = vec;
            expected = S ? I1 : I0;
            #1;  // let the assign statement settle
            if (Y === expected)
                $display("%b  %b  %b |  %b   %b    | PASS", S, I0, I1, Y, expected);
            else
                $display("%b  %b  %b |  %b   %b    | FAIL", S, I0, I1, Y, expected);
        end
        $finish;
    end
endmodule
```

```bash
iverilog -o mux2to1_sim mux2to1.v mux2to1_tb.v
vvp mux2to1_sim
```

## Verify Everything Works

```
# Expected output — all 8 lines should read PASS, matching Overview's
# hand-traced truth table exactly:
S I0 I1 | Y expected | PASS/FAIL
0  0  0 |  0   0    | PASS
0  0  1 |  0   0    | PASS
0  1  0 |  1   1    | PASS
0  1  1 |  1   1    | PASS
1  0  0 |  0   0    | PASS
1  0  1 |  1   1    | PASS
1  1  0 |  0   0    | PASS
1  1  1 |  1   1    | PASS
```

This is the same 8-row table from Overview's annotated example — now confirmed by an actual compiler and simulator, not just hand-tracing. If every line reads PASS, your toolchain is working correctly and you're ready for Fundamentals' sequential-logic examples, which follow the identical compile → simulate → check pattern.

## Common Setup Issues

**`iverilog: command not found` after installing**
On Linux, confirm the package actually installed (`dpkg -l | grep iverilog`) rather than assuming `apt install` succeeded silently — a failed install due to a network issue during `apt update` is the most common cause. On Windows, confirm the bleyer.org installer's directory was added to your PATH; the installer offers to do this automatically but it's worth confirming with `iverilog -V` in a fresh terminal.

**Testbench compiles but produces no output at all**
Check that the testbench has a `$finish` (or `$stop`) call — without one, `vvp` can appear to hang or exit with nothing printed, since simulation time never formally ends. This is a common first-testbench mistake, not a tool malfunction.

**`Y === expected` comparison behaves unexpectedly with X or Z values**
`===` (case equality) treats `X`/`Z` (unknown/high-impedance) as literal comparable values, unlike `==` which returns `X` (neither true nor false) if either side contains an `X`. Testbenches should generally use `===` for pass/fail checks specifically because it gives a definite true/false answer even when debugging an unexpectedly uninitialized signal, rather than silently producing an ambiguous result.

## What's Installed

- **Icarus Verilog (`iverilog`, `vvp`)** — compiles Verilog into an internal format and simulates it
- **GTKWave** — waveform viewer, for visually inspecting signal transitions when a simple `$display` trace isn't enough (used more heavily once Fundamentals' sequential examples and RTL Design's FSMs are running)
- **(Optional) EDA Playground account** — no local install, useful for quick browser-based experiments

## Next Steps

Go to the **Fundamentals** section to compile and simulate the D flip-flop and the blocking-vs-non-blocking swap example using the exact same `iverilog`/`vvp` workflow established here.
