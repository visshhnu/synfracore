# Aerodynamics — Interview Q&A

## Common Questions and Answers

**Q: What actually causes lift — and is the "equal transit time" explanation correct?**

A: No — that's a common misconception, and NASA explicitly flags it as incorrect. Equal transit time claims that air splitting at the leading edge must reunite at the trailing edge, which measured airflow disproves (the air over the top actually arrives first). The accurate explanation is two views of the same event: the wing's shape and angle of attack deflect airflow downward, and by Newton's Third Law that deflection pushes the wing upward (lift); equivalently, that same downward deflection creates lower pressure above the wing and higher pressure below, and the pressure difference summed over the surface is the lift force.

---

**Q: Why does an aircraft need more runway to take off at a high-altitude airport?**

A: Lift depends on air density (ρ) in the lift equation L = ½ρV²S·CL. Higher-altitude airports have thinner air (lower ρ), so for the same speed and configuration, less lift is generated. To reach the same lift needed for takeoff, the aircraft needs a higher ground speed — which means a longer runway to accelerate to that speed.

---

**Q: What's the difference between angle of attack and pitch angle?**

A: Pitch angle is the aircraft's nose orientation relative to the horizon — a purely geometric measurement independent of how the air is actually moving. Angle of attack is the angle between the wing's chord line and the oncoming airflow direction. They can differ significantly — for example, in a strong headwind or during certain climb/descent profiles, an aircraft's pitch angle and its actual angle of attack relative to the air it's moving through are not the same number.

---

**Q: Why is stall dangerous at any airspeed, not just low speed?**

A: Stall is fundamentally about exceeding the critical angle of attack, not about a specific airspeed. While stalls are more commonly encountered at low speed (because pilots increase angle of attack to maintain lift as speed drops), an aircraft pulling a hard, high-G turn at high speed can also exceed the critical angle of attack and stall — this is called an accelerated stall. The airspeed a stall happens at isn't fixed; the angle of attack it happens at is.

---

**Q: Why does drag rise so sharply in the transonic regime, even before the aircraft itself reaches the speed of sound?**

A: Airflow doesn't move uniformly around an aircraft — it accelerates over curved surfaces like the upper wing. In the transonic regime (roughly Mach 0.75–1.20), the aircraft's own speed can still be subsonic while local airflow over the wing has already accelerated past Mach 1, forming small shockwaves. Those shockwaves cause a sharp, disproportionate increase in drag — often called the "drag rise" or "sound barrier" effect historically — well before the aircraft as a whole is flying supersonically.

---

**Q: What does a higher L/D ratio actually buy you?**

A: More lift produced per unit of drag paid. In unpowered flight, a higher L/D ratio directly means a longer glide distance for a given altitude loss — a glider with L/D of 40 can travel 40 meters forward for every meter of altitude lost. In powered flight, a higher L/D at cruise means less thrust (and therefore less fuel) is needed to sustain level flight, since thrust only has to equal drag in steady flight (per Foundations' four-forces balance).

## Study Resources
- **NASA Glenn Research Center — Beginner's Guide to Aerodynamics** (grc.nasa.gov) — free source for the lift-mechanism and Mach-regime explanations referenced throughout this Q&A set
- **Anderson, *Fundamentals of Aerodynamics*** — the standard textbook reference for angle of attack, stall, and L/D ratio in more depth
