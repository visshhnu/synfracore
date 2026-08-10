# Physical Design & Fabrication — Troubleshooting

## "My skew-adjusted timing calculation gives a WORSE result than expected, even though skew should sometimes help"

Double-check the sign convention for the specific path direction — Intermediate's formula adds skew when it's unfavorable (capture clock arrives later than launch) and subtracts it when favorable (capture clock arrives earlier). Applying the sign backwards for a given path is a common source of a skew calculation that looks plausible but is inverted from the actual physical effect.

## "My CTS output shows non-zero skew everywhere, even between physically nearby flip-flops"

Some non-zero skew is expected and unavoidable in any real clock tree — perfectly zero skew everywhere is a theoretical ideal, not a practically achievable target, because even a perfectly balanced H-tree has some residual mismatch from real manufacturing variation. Check the magnitude against the design's actual timing margin (how much slack Overview's STA reports on the tightest paths) rather than expecting exactly zero — a small residual skew that's well within the existing timing margin is not a problem worth chasing further.

## "My dynamic power calculation gives a number that seems too high compared to a real chip's known power budget"

Check whether the activity factor (alpha) used is realistic for the block being modeled — using alpha=1 (every gate switching every cycle, the theoretical maximum) instead of a realistic 0.1-0.3 range will overestimate power by 3-10x for typical logic. Also confirm total switched capacitance C reflects only the block actually being estimated, not the entire chip's capacitance being mistakenly applied to a single sub-block's power calculation.

## "Reducing voltage in my power estimate broke my timing closure numbers from Overview/Intermediate"

This is expected, not a calculation error — Advanced explicitly notes that lower voltage increases gate delay, directly working against the timing formulas from Overview and Intermediate. A voltage reduction must be evaluated against BOTH the power savings AND the resulting timing impact together; treating them as independent, separately-optimizable numbers misses the real PPA tradeoff (Interview Q&A) this technology is built around.

## "My scan-chain test-time calculation (Fundamentals) doesn't account for the power numbers from Advanced — should it?"

Not directly, but be aware DFT test patterns can themselves cause unusually HIGH switching activity (many flip-flops toggling simultaneously during a capture cycle in ways normal functional operation wouldn't) — real physical design flows sometimes need to account for this "test power" separately from normal functional dynamic power, since it can spike well above the alpha assumptions used for functional-mode power estimates like Advanced's worked example.

## "I'm not sure whether a specific timing/power problem should be fixed by physical design (this technology) or fixed further upstream in RTL"

As a general rule: if the fix is "restructure the logic to do less work or use fewer gates," that's an RTL Design & Computer Architecture concern (synthesis will produce a different, smaller netlist from better RTL). If the fix is "the same logic, placed/routed/clocked differently" (shorter wires, better floorplanning, adjusted clock tree, voltage/frequency scaling), that's squarely this technology's domain. A problem that keeps resisting every physical-design-level fix is often a sign the underlying RTL itself needs to change, not that physical design techniques have been exhausted.
