# Physical Design & Fabrication — Interview Q&A

## Common Questions and Answers

**Q: What's the difference between a fabless company, a foundry, and an IDM (Integrated Device Manufacturer)?**

A: A fabless company (e.g., Qualcomm, AMD, NVIDIA) designs chips — does the RTL design, verification, and physical design covered across this academy — but does not own manufacturing facilities; it pays a foundry to actually fabricate the silicon. A foundry (e.g., TSMC) owns and operates fabs but generally doesn't design its own branded chip products — it manufactures other companies' designs as a service. An IDM (e.g., Intel, Samsung) does both: designs its own chips AND owns the fabs that manufacture them. (needs verification — recheck against current source) — the specific companies occupying each category, and especially which IDMs are opening their fabs to outside customers as foundry services (Intel Foundry, Samsung Foundry), shift over time and should be confirmed current at interview-prep time rather than assumed static.

---

**Q: Why does floorplanning happen before placement, and what goes wrong if you skip straight to placing individual gates?**

A: Floorplanning establishes where entire functional blocks (ALU, register file, memory, I/O) sit relative to each other on the die, based on how much they communicate — blocks that exchange signals frequently should be placed physically close, since (per the Fundamentals RC-delay example) wire delay scales directly with wire length. Skipping floorplanning and placing individual gates without this higher-level structure risks scattering logically-related gates across the die essentially at random, producing unnecessarily long wires between frequently-communicating logic — directly increasing RC delay on paths that didn't need to be slow, and potentially creating a new critical path (as the Overview "Try It" exercise showed with Path D) that better floorplanning would have avoided entirely.

---

**Q: What's "fault coverage" in DFT, and why doesn't 100% coverage happen in practice?**

A: Fault coverage is the percentage of a defined fault model (most commonly "stuck-at" faults — every internal node modeled as if it were permanently stuck at 0 or stuck at 1) that a given set of test patterns can actually detect via the scan-chain testing described in Fundamentals. For example, a design with 10,000 modeled stuck-at faults where the ATPG-generated test patterns successfully detect 9,500 of them has 95% fault coverage (9,500/10,000 × 100). 100% coverage is rare in practice because some faults are structurally hard or impossible to observe or control through the available scan/test infrastructure (e.g., faults deep inside redundant logic, or nodes with no test-mode observability path) — real designs typically target a high threshold (commonly cited in the high-90s percent range) rather than an absolute 100%, balancing diminishing returns in ATPG effort and added DFT circuitry against the residual risk of shipping an undetected defect.

---

**Q: What is the PPA (Power, Performance, Area) tradeoff, and how does it show up concretely in physical design decisions?**

A: PPA describes the three-way tradeoff nearly every physical design decision makes: Performance (how fast the chip can run, largely determined by the critical path from STA), Power (how much energy it consumes, both static leakage and dynamic switching power), and Area (how much silicon die space the design occupies, which directly affects manufacturing cost — more chips per wafer for a smaller die). Concretely: making transistors physically larger typically improves performance (faster switching, more drive strength) but increases both power and area; using more parallel scan chains (Fundamentals) reduces test time but increases area (extra test I/O) and design complexity. There's rarely a change that improves all three simultaneously — physical design is largely the practice of choosing where on this three-way tradeoff a given design needs to sit, based on its actual product requirements (a battery-powered wearable prioritizes power very differently than a data-center server chip prioritizing performance).

---

**Q: Why is hold-time fixing counterintuitive compared to setup-time fixing, and where does that actually happen in the physical design flow?**

A: RTL Design & Computer Architecture's interview Q&A noted this directly: a setup violation means a path is too SLOW (fixed by speeding logic up, e.g., shortening wires via better floorplanning, or using faster standard cells), while a hold violation means a path is too FAST (fixed, counterintuitively, by adding delay — inserting deliberate buffer cells into an overly-fast path so a new value doesn't race past a flip-flop before it finishes capturing the previous one). This happens specifically during and after routing (Overview/Fundamentals), once real wire RC delays are known — hold violations are often introduced or revealed only after routing, because pre-route timing estimates don't always capture how short a well-routed, physically-close wire's delay can be, which is one reason STA-driven timing closure is typically iterative rather than a single pass.

---

**Q: As of your current information, what's the state of leading-edge process nodes and India's fab buildout — and how would you verify that in an actual interview setting?**

A: (needs verification — recheck against current source) As of research conducted for this content (mid-2026): TSMC's 2nm (N2) node is in volume production and scaling toward roughly 100,000 wafers/month, with 3nm still in high-volume "golden period" production rather than being phased out; Intel's 18A node reached high-volume manufacturing status in January 2026. On India specifically: Micron's Sanand ATMP (assembly/test/packaging) facility is operational as of February 2026, while Tata Electronics' Dholera wafer fab — India's flagship fab project — has slipped further: as of a July 2026 report, it will open at 90nm rather than the 28nm originally promised, with commercial production now expected mid-2028, not the H1-2027 figure this content previously cited (itself already a downward revision from the original mid-2026 target) — a real, publicly reported, still-moving schedule delay rather than a minor detail. The honest interview answer to "what's current" in this specific domain is to state the most recently verified information explicitly as time-stamped and cite where it came from, rather than presenting node/fab timelines as fixed facts — this entire category (specific node status, foundry capacity, fab construction timelines) is genuinely volatile and shifts on a timescale of months, unlike the RC-delay/scan-chain/PPA mechanics covered elsewhere in this technology.

---

**Scenario Q: Post-silicon validation reports that a batch of parts fails a scan pattern only at −40°C and high voltage, and the failure rate does not change when the tester lowers the clock frequency. Walk through the diagnosis and what to do about it — both for these parts and for the next stepping.**

A: The frequency-independence is the signature of a hold violation, not setup — a max-delay (setup) failure would recover as the tester slows the clock, and it doesn't here. The −40°C/high-voltage corner confirms it: cold plus high voltage is the fastest silicon this design ships, exactly where `T_cq(min)` and `T_logic(min)` (Advanced) collapse and the hold race tightens. For the failing lot, there's no test-program fix, because hold failures exist at every frequency — options are limited to screening out the tail if the failure correlates with a measurable process monitor, or a metal-only ECO if the racing path can be slowed by rerouting or a spare-cell delay insertion without a full respin. For the next stepping, three things get checked against the STA database: whether this path was covered at the fast/cold corner with hold-specific OCV derates (Advanced), whether CTS applied useful skew (Advanced) to a neighboring setup path that stole this path's hold margin, and whether the hold uncertainty value in the SDC reflected measured jitter plus skew or an optimistic default. The systemic fix is process, not just the one path: hold sign-off at the true fastest shipped corner, with useful-skew moves gated on same-path hold re-verification.

---

**Scenario Q: Two weeks from tape-out, STA shows 300 setup violations (worst slack −180 ps, concentrated in one datapath block) and 40 hold violations scattered across the design. In what order is this attacked, and with which levers?**

A: Setup first, hold last — every hold-fixing buffer adds capacitance to nets that may be setup-critical (Advanced's `T_logic` term), so hold fixing happens once, against a frozen setup-clean database. For the setup wall: 300 violations concentrated in one block with −180 ps worst slack is a structural signal, not a cell-sizing problem — 180 ps at an advanced node is many gate delays. First check the constraints: is there a false path or multicycle path the designers intended but never wrote into the SDC (Advanced's `constraints.sdc` example)? If the constraints are genuinely correct, check floorplan-induced detours next — one badly placed macro can create exactly this clustered signature (Interview Q&A's own floorplanning-before-placement answer, above) before touching logic. If the paths are genuinely too deep, the levers in increasing order of cost are: cell upsizing/Vt swaps, logic restructuring or retiming to balance stages, useful skew where downstream hold margin allows it (Advanced), and finally the architectural options — an added pipeline stage or a frequency-target reduction — which, two weeks out, is a decision to escalate immediately, not discover later. The 40 scattered hold violations go to the ECO tool's min-delay fixing at the fast/cold corner as the final step, then a full re-run of STA at all corners confirms the hold buffers didn't reopen setup.

## Study Resources
- **Weste & Harris, *CMOS VLSI Design*** — the standard reference for floorplanning, PPA tradeoffs, and physical design fundamentals referenced throughout this Q&A set
- **Bushnell & Agrawal, *Essentials of Electronic Testing*** — the standard reference for fault coverage and ATPG concepts
- **TSMC and Intel Foundry official technology pages** (tsmc.com, intel.com) and **India Semiconductor Mission official updates** (ism.meity.gov.in) — primary sources for current node/fab status; check these directly rather than relying on this page's snapshot past its research date
