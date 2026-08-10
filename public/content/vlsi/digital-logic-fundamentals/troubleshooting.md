# Digital Logic & Design Fundamentals — Troubleshooting

## "My K-map simplification doesn't match a truth-table check"

Confirm the K-map's row/column ordering is Gray code (00, 01, 11, 10), not binary counting order (00, 01, 10, 11) — Fundamentals' K-map layout deliberately uses Gray-code ordering so adjacent cells differ by exactly one bit. Using binary counting order instead breaks the "adjacent cells are combinable" property the entire technique depends on, producing groupings (and therefore simplifications) that don't actually correspond to valid Boolean identities.

## "My full-adder truth table doesn't match the Cout formula"

Recheck Cout = AB + Cin(A XOR B) term by term against each of the 8 rows in Intermediate's full-adder truth table individually, rather than trusting the formula by inspection — this exact formula is also equivalent to "Cout is 1 whenever at least two of A, B, Cin are 1" (a majority function), which is often a faster way to sanity-check a specific row without re-deriving the full expression.

## "My ripple-carry adder gives the right final sum, but I don't trust the intermediate carries"

Trace each stage's Cout individually, left-to-right through the chain (stage 0 first, matching Intermediate's worked example), rather than only checking the final Sum bits — a ripple-carry adder can occasionally produce a correct final sum through two intermediate carry errors that cancel out, which won't be caught by checking only the final result.

## "My mux-based logic implementation doesn't match the original truth table for one specific AB combination"

Re-derive that one AB row's data-input value directly from the two truth-table rows it covers (C=0 and C=1) rather than re-deriving the whole table — a single wrong data-input assignment (using C instead of C', for instance) will only break the rows under that specific AB combination, leaving the rest of the truth table matching correctly, which is a strong hint about exactly which mux input to check first.

## "I'm seeing a brief glitch on my simulated combinational output that doesn't match any row of my truth table"

Before assuming a simulator bug, check whether the function was simplified using a K-map or Boolean algebra step that dropped a term for being "logically redundant" (like Overview's Consensus Theorem BC term) — Advanced explains why exactly this kind of simplification can introduce a real static hazard, a genuine electrical glitch that a purely logical (delay-free) truth table can never predict or catch.

## "My hold-time check says a violation exists, but slowing down my clock didn't fix it"

This is expected, not a mistake — Advanced explicitly notes hold violations are a same-cycle race condition, entirely independent of clock frequency. Only adding delay to the offending (too-fast) path fixes a hold violation; changing the clock period only ever affects setup-time margins, never hold-time margins.
