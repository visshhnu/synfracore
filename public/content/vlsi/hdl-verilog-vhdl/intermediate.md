# HDL — Verilog & VHDL — Intermediate

Fundamentals covered one fixed-width flip-flop and the blocking/non-blocking distinction. Real designs need width-flexible, reusable modules — you don't want to hand-write a separate 4-bit, 8-bit, and 32-bit adder as three unrelated files. This page covers Verilog's tools for that: `parameter` for making a module's width configurable, `generate` for replicating structure a variable number of times, and the synchronous-vs-asynchronous reset distinction that every real register needs to make deliberately, not by accident.

**Analogy** — A `parameter` is a cookie-cutter that can resize itself: instead of carving a new cutter for every cookie size, you carve one cutter with a size knob, and turn the knob before each use. `generate` is the assembly line that uses that resizable cutter automatically N times in a row, based on a width you set once — without the assembly line, you'd have to physically place each cookie-cutter stamp by hand, once per cookie, exactly the way a non-parameterized, non-generate module forces you to hand-write repeated structure explicitly.

## Parameterized Modules

```verilog
module reg_n #(
    parameter WIDTH = 8   // default width, overridable at instantiation
) (
    input  wire             clk,
    input  wire              rst,
    input  wire [WIDTH-1:0] D,
    output reg  [WIDTH-1:0] Q
);
    always @(posedge clk or posedge rst)
        if (rst) Q <= {WIDTH{1'b0}};   // reset to all zeros, any width
        else     Q <= D;
endmodule
```

```verilog
// Instantiating the SAME module at two different widths — no
// duplicated code, just a different parameter value at each site
reg_n #(.WIDTH(4))  reg4  (.clk(clk), .rst(rst), .D(d4),  .Q(q4));
reg_n #(.WIDTH(32)) reg32 (.clk(clk), .rst(rst), .D(d32), .Q(q32));
```

This is the exact same flip-flop pattern from Fundamentals' D flip-flop — `always @(posedge clk) Q <= D` — just widened from 1 bit to `WIDTH` bits, and made reusable at any width without rewriting the module.

## Synchronous vs. Asynchronous Reset

```
ASYNCHRONOUS RESET (posedge rst in the sensitivity list):
  always @(posedge clk or posedge rst)
      if (rst) Q <= 0; else Q <= D;
  -> Q resets IMMEDIATELY when rst goes high, regardless of the
     clock. Simpler timing reasoning, but a reset pulse shorter than
     one clock period, or one that arrives asynchronously from a
     different clock domain, can cause real timing-closure problems
     in synthesis (a topic Advanced returns to).

SYNCHRONOUS RESET (rst NOT in the sensitivity list, checked inside):
  always @(posedge clk)
      if (rst) Q <= 0; else Q <= D;
  -> Q only resets on the NEXT clock edge after rst goes high, never
     between edges. Cleaner for timing analysis and generally
     preferred in modern ASIC flows, but a reset pulse that's too
     short to be captured by an active clock edge can be missed
     entirely — the reset has to be held long enough to guarantee at
     least one clock edge occurs while it's active.

Neither is universally correct — this is a real, deliberate design
choice made per-project (often per-company convention), not a
default to leave unexamined.
```

## Generate Blocks — A Parameterized Ripple-Carry Adder

Building an N-bit adder by wiring together N full adders, without hand-writing each instance:

```verilog
module full_adder (
    input  wire a, b, cin,
    output wire sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module ripple_adder #(
    parameter WIDTH = 4
) (
    input  wire [WIDTH-1:0] A, B,
    input  wire              cin,
    output wire [WIDTH-1:0] sum,
    output wire              cout
);
    wire [WIDTH:0] carry;
    assign carry[0] = cin;
    assign cout      = carry[WIDTH];

    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : adder_stage
            full_adder fa (
                .a(A[i]), .b(B[i]), .cin(carry[i]),
                .sum(sum[i]), .cout(carry[i+1])
            );
        end
    endgenerate
endmodule
```

### Annotated Example — Tracing a 4-Bit Ripple-Carry Add

Compute A = 5 (`0101`) + B = 3 (`0011`), cin = 0, through the generated structure above.

```
Given:  A = 0101 (5), B = 0011 (3), cin = 0

Stage 0 (i=0): a=1, b=1, cin=0 -> sum=0, cout=1
Stage 1 (i=1): a=0, b=1, cin=1 -> sum=0, cout=1
Stage 2 (i=2): a=1, b=0, cin=1 -> sum=0, cout=1
Stage 3 (i=3): a=0, b=0, cin=1 -> sum=1, cout=0

Result: sum = 1000 (8), cout = 0
Check:  5 + 3 = 8 -- matches, and cout=0 confirms no overflow
        beyond 4 bits (8 fits in 4 bits; a result above 15 would
        set cout=1)
```

Verified computationally by simulating all four full-adder stages in sequence exactly as the `generate` loop wires them — `sum = 1000` (8) with `cout = 0` matches ordinary binary addition of 5 + 3 exactly. This is the practical value of `generate`: the module above works identically for `WIDTH = 4`, `WIDTH = 32`, or any other width, without a single line of the `full_adder` instantiation being rewritten — only the `parameter` value at instantiation changes.

## Try It (2 Minutes)

Using the same `ripple_adder` structure, trace A = 6 (`0110`), B = 7 (`0111`), cin = 0.

1. Work through each of the 4 full-adder stages by hand, the same way as the annotated example above.
2. What's the final `sum` and `cout`?
3. Does `cout = 1` make sense here, given 6 + 7 = 13, and 4 bits can only represent up to 15?

You should land on: Stage 0: a=0,b=1,cin=0 → sum=1,cout=0. Stage 1: a=1,b=1,cin=0 → sum=0,cout=1. Stage 2: a=1,b=1,cin=1 → sum=1,cout=1. Stage 3: a=0,b=0,cin=1 → sum=1,cout=0. Result: sum = `1101` (13), cout = 0 — and yes, this makes sense: 13 fits comfortably within 4 bits (max 15), so no overflow is expected, and `cout = 0` correctly reflects that. Overflow (cout=1) would only occur if the true sum exceeded 15 — for example, 9 + 8 = 17, which doesn't fit in 4 bits.

## Study Resources
- **Samir Palnitkar, *Verilog HDL*** — covers `parameter`, `generate`, and synchronous/asynchronous reset conventions in depth
- **ASIC World — Verilog Generate Statement** (asic-world.com) — free walkthrough of `generate`/`genvar` with worked examples
- **David Harris & Sarah Harris, *Digital Design and Computer Architecture*** — covers the synchronous-vs-asynchronous reset tradeoff from a synthesis/timing perspective, extended further in RTL Design & Computer Architecture
