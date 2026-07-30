# RTL Design & Computer Architecture — Fundamentals

Overview showed one FSM (the "101" detector) composed from the flip-flop and combinational-logic primitives HDL — Verilog & VHDL introduced. This page covers the two ideas that turn a single FSM into something resembling a real processor's datapath: pipelining (running multiple instructions through overlapping stages instead of one at a time) and timing closure (how fast the clock can actually run, given the physical delay of real gates) — plus a second, simpler worked RTL example, a 4-bit counter, to reinforce the state-register pattern with a design simpler than the sequence detector.

**Analogy** — Pipelining is a car wash with four separate stations (wash, rinse, wax, dry) instead of one station doing all four steps to one car before starting the next. One car alone still takes the same total time to fully finish. But once several cars are queued, a new car can enter the wash station the moment the previous car moves on to rinse — so cars finish at a steady, faster rate overall, even though no single car got through any faster. That's exactly the tradeoff pipelining makes in a processor: instruction *latency* (time for one instruction to fully complete) doesn't improve, but instruction *throughput* (how many instructions finish per unit time, once the pipeline is full) does.

## Pipelining: Latency vs. Throughput

```
Without pipelining, an instruction goes through 4 stages (Fetch,
Decode, Execute, Writeback) one at a time, and the NEXT instruction
can't start until the current one fully finishes all 4 stages.

  5 instructions x 4 cycles each = 20 cycles total (no overlap)

With pipelining, once instruction 1 moves from Fetch to Decode, a
NEW instruction can enter Fetch immediately — the 4 stages run on
different instructions simultaneously, like the car wash's 4
stations.

  Total cycles = (number of pipeline stages) + (number of
                  instructions - 1)
               = 4 + (5 - 1)
               = 8 cycles total

Verified: 20 cycles (non-pipelined) vs 8 cycles (pipelined) for the
same 5 instructions — a 20/8 = 2.5x speedup. Note this speedup grows
toward the stage count (4x, in this example) as MORE instructions
are added — the "+((n-1))" overhead of filling the pipeline the
first time matters less the longer the pipeline stays full.
```

## Timing Closure: How Fast Can the Clock Actually Run?

```
Every flip-flop in an RTL design (the state register from Overview,
for example) has two timing requirements from Digital Logic
Fundamentals and HDL's sequential-logic material, now made concrete:

  CLOCK-TO-Q DELAY  — after a clock edge, how long until the flip-
                       flop's output actually changes (not
                       instant — real hardware has delay)
  SETUP TIME         — how long BEFORE the next clock edge the
                       flip-flop's input must already be stable, or
                       the flip-flop may capture garbage

Between two flip-flops sits combinational logic (the next-state and
output logic from the FSM example) with its own propagation delay —
the same idea as gate delay from Digital Logic Fundamentals, just
now summed across a real logic chain.

Minimum clock period = clock-to-Q delay + combinational path delay
                        + setup time

This must hold for the SLOWEST (longest-delay) combinational path
in the whole design — the "critical path" — not the average or the
fastest one. One slow path anywhere in the chip limits the clock
speed for the entire chip.
```

### Annotated Example — Computing Maximum Clock Frequency

A design's critical path: a flip-flop with 1 ns clock-to-Q delay, feeding into a chain of an AND gate (2 ns delay), an OR gate (3 ns delay), and an XOR gate (2 ns delay), feeding into a second flip-flop requiring 1 ns of setup time.

```
Combinational path delay = AND + OR + XOR
                          = 2 + 3 + 2
                          = 7 ns

Minimum clock period = clock-to-Q + combinational delay + setup
                      = 1 + 7 + 1
                      = 9 ns

Maximum clock frequency = 1 / (minimum clock period)
                         = 1 / 9 ns
                         = 0.1111 GHz
                         = 111.1 MHz
```

Verified computationally: 1 + 7 + 1 = 9 ns minimum period, and 1/9ns = 111.1 MHz maximum frequency. This is the actual mechanism behind a very common real-world fact: a chip's rated clock speed isn't a marketing number, it's a direct consequence of the slowest logic chain between any two flip-flops on the entire chip — which is exactly why Physical Design & Fabrication's "timing closure" step (place-and-route, buffer insertion, path optimization) exists as a dedicated, often iterative, phase of chip design.

## A Simpler RTL Example — 4-Bit Up-Counter

The sequence detector's state register held 2 bits representing 3 named states. A counter's state register holds 4 bits representing its own count value directly — same underlying pattern, simpler mapping between "state" and its meaning.

```verilog
module counter_4bit (
    input  wire clk,
    input  wire rst,
    output reg [3:0] count
);
    always @(posedge clk or posedge rst)
        if (rst)
            count <= 4'b0000;
        else
            count <= count + 1;  // wraps automatically: 4-bit
                                  // arithmetic overflow at 1111+1
                                  // rolls back to 0000
endmodule
```

```
Trace over 18 clock edges, starting from count = 0:
  0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0, 1

Verified computationally: the counter reaches 15 (1111 binary) after
16 edges, and the 17th edge wraps back to 0 -- exactly the two's-
complement-style modular arithmetic from Digital Logic Fundamentals
(15 + 1 = 16, which doesn't fit in 4 bits, so the carry-out is
discarded and the result is 16 mod 16 = 0), just now happening
automatically on every clock edge instead of being computed once by
hand.
```

## Try It (2 Minutes)

A different design has a critical path with clock-to-Q delay 0.5 ns, a combinational chain of three gates with delays 1.5 ns, 1.0 ns, and 2.5 ns, and setup time 0.8 ns.

1. What is the total combinational path delay?
2. What is the minimum clock period?
3. What is the resulting maximum clock frequency, in MHz?

You should land on: combinational delay = 1.5 + 1.0 + 2.5 = 5.0 ns; minimum clock period = 0.5 + 5.0 + 0.8 = 6.3 ns; maximum frequency = 1/6.3ns ≈ 158.7 MHz. This is the exact same three-term formula (clock-to-Q + combinational delay + setup) used in the annotated example above, just with different numbers — worth confirming your arithmetic matches before moving on, since this formula reappears directly when Physical Design & Fabrication covers static timing analysis (STA) on real, much larger paths.

## Study Resources
- **David Harris & Sarah Harris, *Digital Design and Computer Architecture*** — covers pipelining, hazards, and timing analysis with worked examples in this same style
- **John Hennessy & David Patterson, *Computer Organization and Design*** — the standard reference for pipelining and computer-architecture fundamentals at a deeper level
- **ASIC World — Static Timing Analysis Basics** (asic-world.com) — free introduction to the setup/hold/critical-path concepts used in the timing example above
