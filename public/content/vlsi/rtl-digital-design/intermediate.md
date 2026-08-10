# RTL Design & Computer Architecture — Intermediate

Overview's FSM decided WHEN something happens (state transitions). Fundamentals' counter showed a simple datapath REMEMBERING a value across cycles. This page combines both ideas into the standard RTL architecture pattern every real digital design uses: a **datapath** (registers and arithmetic — the "what gets computed") controlled by a **control unit** (an FSM — the "when it happens"), built as two separate, cleanly-communicating pieces rather than one tangled block.

**Analogy** — A datapath is a factory's physical machinery: conveyor belts, robotic arms, an assembly station. A control unit is the factory's shift supervisor, who doesn't touch the machinery directly but sends signals ("start the belt," "arm: grab now") telling the machinery what to do and when. Separating these two roles — supervisor logic from physical machinery — is exactly why "control unit" and "datapath" are always designed and reasoned about as separate blocks in real RTL, even though they're wired together into a single chip.

## Control Unit + Datapath — The Standard Split

```
DATAPATH        -- registers, adders, muxes: the "physical machinery"
  Holds and transforms actual data values. Built from Digital Logic
  Fundamentals' adders/muxes and this technology's own register
  (flip-flop bank) pattern.

CONTROL UNIT     -- an FSM (exactly Overview's pattern): the
  "supervisor". Watches status signals coming FROM the datapath
  (e.g., "counter has reached its target") and sends control signals
  TO the datapath (e.g., "load this register now", "enable the
  adder").

The two communicate through a small, well-defined signal interface --
NOT through the control unit directly manipulating data values, and
NOT through the datapath making its own sequencing decisions. This
separation is what makes both halves independently understandable:
the datapath's registers and adder are just plain combinational/
sequential logic from Digital Logic Fundamentals, and the control
unit is just another FSM from Overview -- nothing new, only the
pattern of connecting them is new.
```

## Annotated Example — A Multiply-by-Repeated-Addition Datapath

Design goal: compute 3 × 4 by adding 3 to an accumulator register, four times, using an FSM to control exactly when the addition happens and when the result is ready.

```verilog
module mult_by_add (
    input  wire       clk,
    input  wire        rst,
    input  wire        start,
    input  wire [3:0]  addend,      // the value to add each time (3)
    input  wire [3:0]  count_target, // how many times to add (4)
    output reg  [7:0]  result,
    output reg          done
);
    // DATAPATH registers
    reg [7:0] accumulator;
    reg [3:0] iter_count;

    // CONTROL UNIT states
    parameter IDLE = 2'b00, ADD = 2'b01, DONE = 2'b10;
    reg [1:0] state, next_state;

    always @(posedge clk or posedge rst)
        if (rst) state <= IDLE;
        else     state <= next_state;

    always @(*) begin
        next_state = state;
        case (state)
            IDLE: next_state = start ? ADD : IDLE;
            ADD:  next_state = (iter_count == count_target) ? DONE : ADD;
            DONE: next_state = IDLE;
        endcase
    end

    // DATAPATH actions, driven by the control unit's current state
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            accumulator <= 8'd0;
            iter_count  <= 4'd0;
            done        <= 1'b0;
        end else begin
            case (state)
                IDLE: if (start) begin
                    accumulator <= 8'd0;
                    iter_count  <= 4'd0;
                    done        <= 1'b0;
                end
                ADD: if (iter_count < count_target) begin
                    accumulator <= accumulator + addend;
                    iter_count  <= iter_count + 1;
                end
                DONE: begin
                    result <= accumulator;
                    done   <= 1'b1;
                end
            endcase
        end
    end
endmodule
```

### Tracing the Datapath — 3 × 4

```
addend = 3, count_target = 4, starting accumulator = 0

iter 1: accumulator = 0 + 3 = 3
iter 2: accumulator = 3 + 3 = 6
iter 3: accumulator = 6 + 3 = 9
iter 4: accumulator = 9 + 3 = 12

iter_count reaches count_target (4) -> control unit moves to DONE
result = 12

Verified computationally: 3 x 4 = 12, reached by 4 repeated additions
of 3, exactly matching a hand trace of the FSM/datapath interaction
above. Notice the control unit (state, next_state) never touches the
value 3 or 12 directly -- it only watches iter_count against
count_target and decides WHEN to stop, while the datapath's
accumulator register does all the actual arithmetic. This is the
control/datapath separation working exactly as designed.
```

## Try It (2 Minutes)

Using the same `mult_by_add` structure, trace what happens with `addend = 5` and `count_target = 3` (computing 5 × 3 by repeated addition).

1. What is the accumulator's value after each of the 3 iterations?
2. What is the final `result`?
3. If `count_target` were mistakenly set to 0 instead of 3, what would `result` be, and does the FSM ever get stuck?

You should land on: iter 1 → 5, iter 2 → 10, iter 3 → 15, final result = 15 (matching 5×3=15 exactly). If `count_target = 0`, the ADD state's exit condition (`iter_count == count_target`, i.e., 0 == 0) is already true on entry, so the FSM moves to DONE immediately without ever adding anything — result = 0, correctly representing "multiply by zero iterations," and the FSM does NOT get stuck, since the transition condition is checked freshly every cycle rather than assuming at least one iteration always happens.

## Study Resources
- **David Harris & Sarah Harris, *Digital Design and Computer Architecture*** — covers the control-unit/datapath split as the standard RTL architecture pattern, in exactly this style
- **ASIC World — Finite State Machines** (asic-world.com) — free reference reused from Overview, directly applicable to control-unit design
- **John Hennessy & David Patterson, *Computer Organization and Design*** — the standard deeper reference for control-unit/datapath architecture at CPU scale
