# Propulsion Systems — Interview Q&A

## Common Questions and Answers

**Q: Why can't a jet engine work in space?**

A: A jet engine is air-breathing — it takes in ambient air, compresses it, mixes it with fuel, and burns the mixture, using atmospheric oxygen as the oxidizer. In space there's no air to take in and no oxygen to burn fuel with. A rocket engine avoids this entirely by carrying both the fuel and the oxidizer onboard, mixed and burned internally, so it has no dependency on outside air at all — which is exactly why spaceflight uses rockets, not jet engines.

---

**Q: What does specific impulse (Isp) actually measure, in plain terms?**

A: It's an efficiency metric — essentially fuel economy for a rocket engine. A higher Isp means the engine extracts more thrust, or more precisely more total achievable velocity change, from the same mass of propellant burned. It's expressed in seconds because of how the unit conversion works out (Isp = exhaust velocity ÷ standard gravity), not because it represents a duration of anything physical.

---

**Q: Why do rockets use multiple stages instead of one big single-stage vehicle?**

A: Because of how the Tsiolkovsky rocket equation is shaped — the achievable delta-v depends on the natural logarithm of the mass ratio (wet mass ÷ dry mass), not on the mass ratio directly. A logarithm gives rapidly diminishing returns: adding more and more propellant to a single stage keeps costing you more dead structural mass (tanks, engines) that has to be hauled all the way to orbit, for less and less delta-v gain. Staging lets you drop that dead structural mass partway through flight instead of carrying it the whole way, which is a much better trade — this diminishing-returns effect is often called "the tyranny of the rocket equation."

---

**Q: What's the trade-off between a high-Isp engine like an ion thruster and a lower-Isp engine like a solid rocket motor?**

A: Isp and thrust level are a genuine trade-off, not a simple "higher is always better" situation. Ion/electric propulsion reaches very high Isp (often 1,500-3,000+ seconds) but produces very low thrust — often just a fraction of a newton — because it accelerates a very small mass flow rate to extremely high exhaust velocity. Solid rocket motors have much lower Isp (roughly 250-270 seconds) but produce enormous thrust by expelling a large mass flow rate quickly. High-Isp, low-thrust engines suit long-duration deep-space missions where you have months to slowly build up delta-v; high-thrust engines suit launch, where you need to overcome gravity and reach orbital velocity in minutes, not months.

---

**Q: What is the physical meaning of the "Δv" a mission requires, and where does it come from?**

A: Delta-v (Δv) is the total velocity change a spacecraft needs to achieve across a mission — launch, orbital maneuvers, course corrections, landing, and so on all cost some amount of Δv, and mission planners add these up into a total "Δv budget." The Tsiolkovsky rocket equation is how you check whether a given engine, propellant load, and stage design can actually deliver the Δv the mission budget requires — if the equation says your Δv comes up short, the mission physically cannot be completed with that vehicle as designed, no matter how the flight is planned.

---

**Q: Why is g0 (9.80665 m/s²) used inside the specific impulse and rocket equations, even for a mission that never touches Earth's gravity?**

A: It's used purely as a fixed unit-conversion constant, not because Earth's gravity is physically acting on the rocket in that equation. Historically, engine performance data was measured and reported using this standard gravity value to keep specific impulse in a consistent unit (seconds) across engines and missions — including ones bound for the Moon, Mars, or deep space, where Earth's actual gravity is irrelevant to the vehicle's physics.

## Study Resources
- **NASA Glenn Research Center — Beginner's Guide to Rockets** (grc.nasa.gov) — free source for the specific impulse and staging explanations referenced above
- **Sutton & Biblarz, *Rocket Propulsion Elements*** — standard reference for engine-type Isp/thrust trade-offs in more depth
