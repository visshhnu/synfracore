# HDL — Verilog & VHDL — Overview

**Before you start:** [Digital Logic & Design Fundamentals](/academies/vlsi/digital-logic-fundamentals/overview) is assumed.

Digital Logic & Design Fundamentals taught you to describe a circuit as Boolean algebra and truth tables — AND/OR/NOT, gates, K-maps. A real chip has millions to billions of gates; nobody draws that by hand or writes it out gate-by-gate. A Hardware Description Language (HDL) lets you describe *what a circuit should do*, in text, and a synthesis tool (covered later in RTL Design & Computer Architecture) turns that description into an actual gate-level netlist. This page introduces the two dominant HDLs — Verilog and VHDL — using the exact gates and truth tables from the previous technology, just expressed in code instead of tables.

**Analogy** — A truth table is a recipe written as an exhaustive list: "if you have these exact ingredients in this exact amount, you get this exact dish" — every combination spelled out. An HDL module is the same recipe rewritten as an actual instruction: "combine ingredient A and ingredient B this way." Both describe the identical dish (the identical circuit behavior) — the truth table lists every case, the HDL states the general rule that produces every case. A synthesis tool is what turns that written rule back into a physical dish (real gates), the same way a chef turns a recipe into food.

## Why This Technology Comes Right After Digital Logic Fundamentals

```
Everything you'll write in Verilog or VHDL in later technologies —
FSMs and datapaths in RTL Design, testbenches in Functional
Verification — is built from the exact same primitives Digital
Logic Fundamentals already covered:
  BOOLEAN ALGEBRA  →  becomes assign statements / logic operators
                       (&, |, ~ in Verilog; and, or, not in VHDL)
  TRUTH TABLES     →  become case statements or if/else logic
  COMBINATIONAL vs
  SEQUENTIAL LOGIC →  becomes the difference between assign/process
                       blocks (combinational) and always @(posedge
                       clk) blocks (sequential) — same distinction,
                       new syntax
This page does not introduce a single new digital concept — it's a
direct translation exercise from the vocabulary you already have.
```

## The 2:1 Multiplexer — Same Circuit, Two Languages

A 2:1 multiplexer (mux) selects between two inputs based on a select line — Y = I1 if S = 1, otherwise Y = I0. This is a combinational circuit (no memory — output depends only on current inputs), directly implementable with the AND/OR/NOT gates from Digital Logic Fundamentals: Y = (S · I1) + (S' · I0).

```verilog
// Verilog — dataflow style, using the ternary operator
module mux2to1 (
    input  wire S,    // select line
    input  wire I0,   // input when S = 0
    input  wire I1,   // input when S = 1
    output wire Y
);
    assign Y = S ? I1 : I0;   // exactly the Boolean expression above,
                              // expressed as a conditional instead
                              // of AND/OR/NOT explicitly
endmodule
```

```vhdl
-- VHDL — equivalent dataflow style
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1 is
    port (
        S, I0, I1 : in  STD_LOGIC;
        Y         : out STD_LOGIC
    );
end mux2to1;

architecture Dataflow of mux2to1 is
begin
    Y <= I1 when S = '1' else I0;  -- same conditional logic as the
                                    -- Verilog ternary above
end Dataflow;
```

### Annotated Example — Tracing the Mux Against Its Truth Table

Both descriptions above must produce the exact truth table Digital Logic Fundamentals would predict for Y = (S · I1) + (S' · I0). Tracing every input combination:

```
  S  I0  I1  |  Y (from the HDL logic S ? I1 : I0)
  0   0   0  |  0   (S=0, so Y=I0=0)
  0   0   1  |  0   (S=0, so Y=I0=0)
  0   1   0  |  1   (S=0, so Y=I0=1)
  0   1   1  |  1   (S=0, so Y=I0=1)
  1   0   0  |  0   (S=1, so Y=I1=0)
  1   0   1  |  1   (S=1, so Y=I1=1)
  1   1   0  |  0   (S=1, so Y=I1=0)
  1   1   1  |  1   (S=1, so Y=I1=1)
```

Verified programmatically by tracing the same `S ? I1 : I0` logic across all 8 input combinations — every row matches. This is exactly what a testbench does mechanically at simulation time (Functional Verification's entire subject), and it's the same truth-table-checking discipline used for every Boolean simplification in the previous technology — only now the circuit is described as code that a tool executes, not algebra worked by hand.

## Verilog vs. VHDL — Which One, and Why Both Exist

```
VERILOG                          VHDL
- C-like syntax, terser          - Ada-derived syntax, more verbose
- Dominant in industry (US       - Strongly typed (STD_LOGIC vs.
  commercial semiconductor         BOOLEAN vs. INTEGER are distinct
  companies, most job postings)    types, caught at compile time)
- Looser typing — easier to      - Dominant in European/defense/
  make silent mistakes             aerospace industry and academia
- IEEE 1364 standard              - IEEE 1076 standard

Neither is "better" in an absolute sense — both compile down to the
exact same kind of gate-level netlist through synthesis. The
practical reality: most Indian semiconductor-industry job postings
(Intel, Qualcomm, AMD, and the fabless design houses covered in VLSI
Careers & Exam Pathways) skew Verilog/SystemVerilog-heavy, so later
technologies in this academy (RTL Design, Functional Verification)
default to Verilog/SystemVerilog syntax, with VHDL shown alongside
where the comparison is instructive — not because VHDL doesn't
matter, but to match where this academy's stated career-outcome
focus is.
```

```conceptgrid
{
  "boxes": [
    { "title": "Verilog", "description": "C-like, terser, looser typing -- dominant in US commercial semiconductor industry", "color": "blue" },
    { "title": "VHDL", "description": "Ada-derived, strongly typed -- dominant in European/defense/academia", "color": "purple" }
  ]
}
```

## Try It (2 Minutes)

Using the same style as the mux above, describe a 2-input AND gate in both Verilog and VHDL (recall from Digital Logic Fundamentals: AND outputs 1 only if both inputs are 1).

1. Write the Verilog `assign` statement for `Y = A AND B`.
2. Write the equivalent VHDL signal assignment.
3. Trace both against the AND truth table from Digital Logic Fundamentals — do they match for all 4 input combinations?

You should land on: Verilog — `assign Y = A & B;` (the `&` operator is bitwise AND). VHDL — `Y <= A and B;` (VHDL's `and` is a keyword, not a symbol). Tracing both against the AND truth table (0,0→0; 0,1→0; 1,0→0; 1,1→1) confirms an exact match in every case — the same result you'd get by hand-checking the Boolean expression A·B directly, just expressed as executable code instead of algebra.

## Study Resources
- **Samir Palnitkar, *Verilog HDL*** — the standard industry-reference textbook for Verilog syntax and simulation semantics
- **Peter Ashenden, *The Designer's Guide to VHDL*** — the standard reference for VHDL, widely used alongside Palnitkar's Verilog text
- **ASIC World — Verilog Tutorial** (asic-world.com) — free, example-heavy walkthroughs of exactly this gate-to-HDL translation
