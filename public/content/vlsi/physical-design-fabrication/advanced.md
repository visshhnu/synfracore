# Physical Design & Fabrication — Advanced

This page covers two topics. Interview Q&A's own PPA framing already named Power and Area without quantifying either — the first half closes that gap for Power: the actual formula physical designers use to estimate dynamic power consumption, and why voltage has an outsized effect on it compared to every other variable in the formula. The second half returns to timing, completing the setup/hold picture Intermediate's clock-skew material only partially covered — including the "useful skew" technique Intermediate named but didn't quantify.

**Analogy** — A car's fuel consumption scales roughly linearly with how far you drive and how heavy the car is — double the distance, roughly double the fuel. But speed has a DISPROPORTIONATE effect: pushing through more air resistance at higher speed costs fuel efficiency at something closer to a squared relationship, not a linear one. Voltage in a chip's power equation behaves exactly like that speed term — a modest voltage change produces a much larger power change than a similarly modest change to any other single variable in the formula.

## The Dynamic Power Formula

```
Dynamic power (power consumed by transistors actually SWITCHING, as
opposed to static/leakage power consumed even when idle) is
estimated as:

  P_dynamic = alpha x C x V^2 x f

  where:
    alpha = activity factor -- the fraction of the total switched
            capacitance that ACTUALLY toggles per clock cycle
            (real logic doesn't switch every gate every cycle;
            alpha is typically well under 1, often around 0.1-0.3
            for general logic)
    C     = total switched capacitance (farads) -- how much
            capacitance is being charged/discharged, related to
            Fundamentals' wire-RC material and standard-cell load
    V     = supply voltage (volts)
    f     = clock frequency (Hz) -- directly connects to every
            timing-closure calculation from Overview and this page's
            own Intermediate section

Notice V is SQUARED, while alpha, C, and f are each only LINEAR
terms -- this is the mathematical reason voltage scaling is such an
effective (and heavily used) power-reduction technique in real chip
design.
```

### Annotated Example — Computing Dynamic Power for a Logic Block

A logic block has 2 nF of total switched capacitance, operates at 1 GHz, runs at 0.8 V supply voltage, with a realistic activity factor of 0.2 (20% of the switched capacitance toggles per cycle, on average).

```
Given:  alpha = 0.2, C = 2 nF = 2 x 10^-9 F, V = 0.8 V, f = 1 GHz = 1 x 10^9 Hz

P = alpha x C x V^2 x f
  = 0.2 x (2 x 10^-9) x (0.8)^2 x (1 x 10^9)
  = 0.2 x (2 x 10^-9) x 0.64 x (1 x 10^9)
  = 0.256 W
  = 256 mW

Verified computationally: this logic block consumes approximately
256 mW of dynamic power at 0.8V/1GHz -- a real, budgetable number a
physical designer would check against the chip's overall power
budget (a battery-powered device's total power envelope, or a
data-center chip's thermal design power) before committing to this
configuration.
```

## Voltage Scaling — Quantifying the Squared Relationship

```
Reducing supply voltage is one of the most effective single power-
reduction levers precisely because of the V^2 term -- but it isn't
free: lower voltage also increases gate delay (transistors switch
more slowly at lower voltage), directly hurting the timing-closure
margins from Overview and Intermediate. This is the real PPA
tradeoff (Interview Q&A) playing out concretely: a voltage reduction
that saves meaningful power may force a corresponding reduction in
maximum clock frequency to keep timing closure intact.
```

### Annotated Example — Power Savings From a Modest Voltage Reduction

Using the same block (alpha=0.2, C=2nF, f=1GHz), but reducing supply voltage from 0.8V to 0.7V (a 12.5% voltage reduction).

```
P_new = 0.2 x (2 x 10^-9) x (0.7)^2 x (1 x 10^9)
      = 0.2 x (2 x 10^-9) x 0.49 x (1 x 10^9)
      = 0.196 W
      = 196 mW

Power reduction = (256 - 196) / 256 x 100 = 23.44%

Verified computationally: a 12.5% voltage reduction (0.8V -> 0.7V)
produced a 23.44% power reduction -- nearly DOUBLE the percentage
change, in the power's favor, directly because of the V^2 term.
This is the real, quantified reason voltage scaling is prioritized
over comparable percentage changes to activity factor or
capacitance, both of which would only produce a proportional
(not amplified) power change.
```

## Try It (2 Minutes)

Using the same block at the original 0.8V, compute the dynamic power if activity factor alone were reduced from 0.2 to 0.15 (a 25% reduction in alpha, larger in percentage terms than the 12.5% voltage reduction above), with C, V, and f unchanged.

1. What is the new dynamic power?
2. What is the percentage power reduction from the original 256 mW?
3. Compare this percentage reduction to the 23.44% achieved by only a 12.5% voltage reduction — does this confirm or contradict the claim that voltage has a disproportionate effect on power?

You should land on: P_new = 0.15 × 2×10⁻⁹ × 0.64 × 1×10⁹ = 0.192 W = 192 mW. Percentage reduction = (256−192)/256×100 = 25% — which exactly matches alpha's own 25% reduction, confirming activity factor scales power LINEARLY (a 25% cut in alpha gives exactly a 25% cut in power). This confirms the claim: the earlier 12.5% voltage reduction produced a 23.44% power reduction (nearly double its own percentage), while this 25% activity-factor reduction produced exactly a 25% power reduction (a 1-to-1 match) — voltage's squared relationship genuinely amplifies its effect on power in a way linear terms like alpha, C, and f simply do not.

## Setup & Hold Violations — Completing the Timing-Closure Picture

Intermediate's skew-aware formula (`min clock period = clock-to-Q + combinational delay + setup + skew`) covers the setup side of timing closure. This section states both constraints formally — setup AND hold — and shows why they behave asymmetrically: one is fixable by slowing the clock, the other genuinely is not.

```
SETUP constraint (max-delay check, evaluated at the SLOW process
corner, since it asks "is there ENOUGH time"):

  T_cq(max) + T_logic(max) + T_su  <=  T_clk + T_skew

  Setup slack = (T_clk + T_skew) - (T_cq + T_logic(max) + T_su)
  Negative slack = the path cannot run at this clock frequency.

HOLD constraint (min-delay check, evaluated at the FAST process
corner, since it asks "did the value change TOO SOON"):

  T_cq(min) + T_logic(min)  >=  T_h + T_skew

  Hold slack = (T_cq(min) + T_logic(min)) - (T_h + T_skew)
  Negative slack = a same-edge race that a launch/capture flip-flop
  pair cannot outrun.
```

**Why this asymmetry matters more than it looks.** `T_clk` (the clock period) appears ONLY in the setup inequality. A setup violation is frequency-fixable — slow the clock down and the inequality is satisfied. A hold violation is a same-edge race between two flip-flops that both fire off the SAME clock edge; the clock period never enters the calculation at all, so slowing the clock changes nothing. A chip that fails hold in silicon is dead at every frequency, which is exactly why hold sign-off gets treated as a harder, later-stage gate than setup sign-off in real flows.

### Annotated Example — Computing Setup Slack

A path launches from a flop with clock-to-Q delay 0.15 ns, through logic with worst-case delay 1.45 ns, into a capture flop with a 0.10 ns setup requirement. The clock period is 2.0 ns, and (using Intermediate's skew convention) the capture clock arrives 0.05 ns later than the launch clock — favorable skew for this path.

```
Setup slack = (T_clk + T_skew) - (T_cq + T_logic(max) + T_su)
            = (2.00 + 0.05) - (0.15 + 1.45 + 0.10)
            = 2.05 - 1.70
            = +0.35 ns

Verified computationally: +0.35 ns of positive slack means this path
comfortably meets setup at 2.0 ns -- but see the OCV example below for
why a nominal +0.35 ns is not the same thing as a signed-off +0.35 ns.
```

### Corner-Based Sign-off: Where Each Check Actually Runs

| Check | Sign-off corner | Why |
| --- | --- | --- |
| Setup (max-delay) | Slow process, low voltage, high temperature | All delays are at their maximum here — the least possible time to make the capture edge |
| Hold (min-delay) | Fast process, high voltage, low temperature | Minimum delays collapse fastest here — the same-edge race is tightest |

This is why "hold escapes cluster at the fast corner and low temperature" is a real, recurring production failure mode: a design signed off only at the slow corner (where setup lives) can ship silicon that fails hold at the fast corner nobody checked there.

### Annotated Example — The RTL/SDC Pair Behind Every Setup/Hold Check

The launch-capture structure above isn't abstract — it's the same two-flop pattern from RTL Design's own state-register material, and every STA setup/hold check reduces to exactly this:

```verilog
// pipeline_stage.v -- a launch/capture pair with a deliberately long
// combinational cloud, the canonical structure every setup/hold check
// in STA reduces to.
module pipeline_stage #(
    parameter WIDTH = 16
)(
    input  wire             clk,
    input  wire             rst_n,
    input  wire [WIDTH-1:0] din,
    output reg  [WIDTH-1:0] dout
);
    reg [WIDTH-1:0] stage_a;   // launch register (FF1) -- its T_cq
                               // starts the timing arc below.

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) stage_a <= {WIDTH{1'b0}};
        else        stage_a <= din;
    end

    // Combinational cloud: the multiply-accumulate path is the
    // max-delay (setup-critical) arc; the XOR pass-through is a
    // min-delay (hold-critical) arc -- the SAME RTL block generates
    // both risk classes.
    wire [WIDTH-1:0] mac_path  = (stage_a * 16'd3) + {8'd0, stage_a[15:8]};
    wire [WIDTH-1:0] fast_path = stage_a ^ {WIDTH{1'b1}};
    wire [WIDTH-1:0] next_dout = stage_a[0] ? mac_path : fast_path;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) dout <= {WIDTH{1'b0}};
        else        dout <= next_dout;  // capture register (FF2)
    end
endmodule
```

```tcl
# constraints.sdc -- the STA-side view of the same structure.
create_clock -name core_clk -period 2.000 [get_ports clk]   ;# 500 MHz

# Skew/jitter modeled as uncertainty: subtracts from setup margin,
# adds to hold requirement -- the pessimistic direction for each check.
set_clock_uncertainty -setup 0.080 [get_clocks core_clk]
set_clock_uncertainty -hold  0.050 [get_clocks core_clk]

# Hold fixing is done by the tool inserting min-delay buffers on fast
# arcs (like fast_path above), never by touching the period.
set_fix_hold [get_clocks core_clk]
```

Verified against the module: `mac_path` is exactly the kind of deep combinational logic the setup check above worries about (large `T_logic(max)`); `fast_path` is a single XOR gate deep, exactly the kind of short arc a hold violation comes from (tiny `T_logic(min)`) — one RTL block, two independent timing risks, checked at two different corners.

### Annotated Example — OCV Derating: Why Nominal Slack Isn't Sign-off Slack

Take the +0.35 ns nominal slack computed above and apply a typical advanced-node On-Chip Variation (OCV) recipe: launch-path delays derated ×1.08 (pessimistically later), capture clock derated ×0.95 (pessimistically earlier), plus 80 ps of clock jitter.

```
Data arrival (derated)   = (0.15 + 1.45) x 1.08 + 0.10 = 1.828 ns
Available time (derated) = (2.0 - 0.08 jitter) + (0.05 x 0.95 skew) = 1.968 ns

New setup slack = 1.968 - 1.828 = +0.140 ns

Verified computationally: slack collapsed from +350 ps (nominal) to
+140 ps (derated) -- roughly 60% of the nominal margin was never real.
This is exactly why "meets timing at nominal" is not a sign-off
statement in production flows; OCV/AOCV derating tables exist
precisely to expose margin like this before tape-out, not after.
```

### Useful Skew — Quantifying the Margin Transfer

Intermediate named "useful skew" as an advanced technique used selectively, without quantifying it. The mechanism: `T_skew` appears with OPPOSITE effect in the two inequalities above — added to available time in the setup check, added to the requirement in the hold check. Delaying a capture clock by a fixed amount therefore transfers exactly that much margin from hold to setup on the SAME path.

```
If CTS intentionally delays a setup-critical path's capture clock by
60 ps ("useful skew"):
  Setup margin on that path improves by exactly 60 ps
  Hold margin on that SAME path degrades by exactly 60 ps

This is a transfer, not a creation of margin -- which is why useful
skew is applied selectively (only where the hold margin can afford
to give up 60 ps) rather than as a blanket clock-tree strategy.
```

## Try It (2 Minutes)

At the fast corner, a path has `T_cq(min) = 0.12 ns` and `T_logic(min) = 0.03 ns` into a capture flop with `T_h = 0.08 ns`, and the capture clock arrives 0.10 ns after the launch clock (`T_skew = 0.10 ns`).

1. Compute the hold slack using the hold inequality above.
2. Is this a violation?
3. Which of these fixes it: increasing the clock period, or inserting delay buffers into the data path — and why?

You should land on: hold slack = `(T_cq(min) + T_logic(min)) - (T_h + T_skew)` = `(0.12 + 0.03) - (0.08 + 0.10)` = `0.15 - 0.18` = **-0.03 ns**, a real hold violation. Increasing the clock period does nothing — `T_clk` never appears in the hold inequality, so this is the classic trap. The only fix is inserting delay buffers into the data path, directly increasing `T_logic(min)` until the left-hand side clears 0.18 ns — exactly the "hold fixing means adding delay" mechanic Interview Q&A already named as counterintuitive.

## Study Resources
- **Weste & Harris, *CMOS VLSI Design*** — the standard reference for dynamic and static power estimation, and for setup/hold timing analysis, both covered in this same style
- **Rabaey, Chandrakasan & Nikolic, *Digital Integrated Circuits*** — a standard deeper reference for power-aware design, voltage scaling, and static timing analysis
- **VLSI Universe / ChipEdge — Low Power Design and STA tutorials** — free, practically oriented walkthroughs of power estimation, voltage/frequency scaling, and setup/hold timing closure
