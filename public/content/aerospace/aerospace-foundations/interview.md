# Aerospace Foundations — Interview Q&A

## Common Questions and Answers

**Q: Why do aerospace engineers need vectors instead of just regular numbers?**

A: Almost every quantity that matters in flight — force, velocity, acceleration — has both a size and a direction, and direction changes the outcome. A 10,000 N thrust force pointed straight ahead does something completely different from the same 10,000 N pointed 30° upward. A plain number (a "scalar") only captures the size; a vector captures both, which is why forces get resolved into components (as in the climb-angle example) rather than just added as numbers.

---

**Q: What's the practical difference between the dot product and the cross product?**

A: The dot product of two vectors gives you a plain number and answers "how much does one vector act along the direction of the other" — its main aerospace use is computing work (force times displacement in the direction of motion). The cross product gives you a new vector, perpendicular to both original ones, and its main aerospace use is torque — a force applied at a distance from a pivot point, like an aileron creating a rolling moment at the wingtip. If the question is "how much energy/work," reach for the dot product; if it's "how much twisting/turning force," reach for the cross product.

---

**Q: What is Newton's Second Law and why does it show up in every aerospace calculation?**

A: F = ma — net force equals mass times acceleration. It shows up everywhere because it's the equation that actually connects "what forces are acting on the vehicle" (which is what Aerodynamics and Propulsion calculate) to "how the vehicle moves" (which is what everyone actually cares about). Without F = ma, computing lift, drag, and thrust would just be abstract numbers with no connection to the aircraft's actual speed, altitude, or trajectory.

---

**Q: In plain terms, what do a derivative and an integral represent in flight mechanics?**

A: A derivative answers "how fast is this changing right now" — velocity is the derivative of position (how fast position is changing), and acceleration is the derivative of velocity (how fast velocity is changing). An integral does the reverse: given acceleration, integrating once gives velocity, and integrating again gives position. Practically, if you know how hard a rocket motor is pushing (acceleration) and for how long, integration is how you find out how fast it's going and how far it traveled.

---

**Q: In steady, level flight, why does lift have to exactly equal weight?**

A: Because "steady, level flight" specifically means constant altitude and constant speed — by Newton's First Law, that requires zero net force. If lift were greater than weight, the aircraft would accelerate upward (climb); if less, it would accelerate downward (descend). The same logic applies horizontally: thrust must exactly equal drag, or the aircraft would speed up or slow down instead of holding steady speed.

---

**Q: Why does an aircraft need less lift, but more thrust, once it starts climbing?**

A: Climbing tilts the flight path, which changes how weight resolves into components relative to that path. Lift only has to balance the *component* of weight perpendicular to the flight path (W·cos γ), which is less than the full weight once γ > 0. But thrust now has to fight drag *plus* the component of weight now pulling backward along the flight path (W·sin γ), which is extra work lift never had to do in level flight. Steeper climbs mean more of that backward weight component, which is why steep climbs demand disproportionately more thrust.

## Study Resources
- **NASA Glenn Research Center — Beginner's Guide to Aeronautics** (grc.nasa.gov) — free walkthroughs of the four forces of flight, referenced throughout this Q&A set
- **Anderson, *Introduction to Flight*** — the standard textbook reference for the vector/Newton's-laws foundation these answers draw from
