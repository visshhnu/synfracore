# Flight Mechanics & Aircraft Structures — Interview Q&A

## Common Questions and Answers

**Q: What does it mean for an aircraft to be "longitudinally statically stable," in plain terms?**

A: It means that if something disturbs the aircraft's pitch — a gust of wind pushes the nose up, for example — the aircraft generates its own aerodynamic force that pushes the nose back down, without any pilot input. This requires the center of gravity to sit ahead of the aircraft's neutral point (the combined aerodynamic center of the wing and tail). If the CG is behind the neutral point, the same disturbance instead produces a force that makes the nose keep pitching up further — genuine instability, not just poor handling.

---

**Q: Why does the tail matter so much for stability, rather than just the wing?**

A: The wing alone usually isn't enough to guarantee stability — its own aerodynamic center typically sits close to the CG, giving little restoring leverage. The tail sits far behind the CG, so even a modest force from the tail creates a large restoring moment, because moment = force × distance (r × F), and the tail has a large "r." This is why the tail is sometimes called the aircraft's stabilizer — it's providing the moment arm the wing alone doesn't have.

---

**Q: Why does an aircraft need more lift during a turn than it does in level flight?**

A: In level flight, lift only has to balance weight (L = W). In a banked turn, part of the lift vector now points sideways (toward the center of the turn) to actually curve the flight path, which means the vertical component of lift alone isn't enough to still balance weight — the aircraft has to generate MORE total lift than its weight, specifically L = W / cos(bank angle), to keep the vertical component equal to weight while also getting a sideways component to turn.

---

**Q: What is load factor, and why do steep turns feel "heavier"?**

A: Load factor (n) is the ratio of lift to weight, and by extension the ratio of the apparent force felt by the aircraft (and its occupants) to normal weight. In a banked turn, n = 1/cos(bank angle) — a 60° bank produces n = 2, meaning the wings, the structure, and the occupants all experience twice the normal gravitational force. This is the same physical effect as feeling pressed into your seat on a tight fairground loop — it's a real force increase, not just a sensation.

---

**Q: Why are aircraft certified with different maximum load factors depending on category (Normal, Utility, Acrobatic)?**

A: Different categories of aircraft are designed and expected to be flown differently, and their structures are built (and certified, under 14 CFR Part 23.337) to match. Normal category aircraft, intended for straightforward, non-aerobatic flying, are certified to +3.8g/-1.52g. Utility category, which permits some more aggressive maneuvering, is certified higher at +4.4g. Acrobatic category, built for genuine aerobatics, goes up to +6.0g. Flying a Normal-category aircraft into a maneuver that exceeds +3.8g risks structural damage the airframe was never certified — or necessarily built — to survive.

---

**Q: What's the basic trade-off between aluminum and composite materials in aircraft structures?**

A: This is a genuinely more complex, multi-factor engineering trade-off than a single "which is better" answer — at a foundational level, the general trade-off is that composites can offer a better strength-to-weight ratio and more design flexibility (shapes and load paths that are hard to achieve with metal), while aluminum has a much longer track record, well-understood fatigue and damage-tolerance behavior, and generally lower manufacturing and repair cost. Specific strength, weight, and cost figures vary significantly by exact material grade and application (needs verification against current manufacturer/material datasheets before citing specific numbers), so this answer stays at the qualitative trade-off level rather than citing exact figures that would need per-material verification.

## Study Resources
- **NASA Glenn Research Center — Beginner's Guide to Aeronautics** (grc.nasa.gov) — free source for the stability and load-factor explanations referenced above
- **14 CFR Part 23.337** (ecfr.gov) — the regulatory source for the load-factor limits by aircraft category
- **Anderson, *Introduction to Flight*** — standard reference for static stability and load factor in more depth
