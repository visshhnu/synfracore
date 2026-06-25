# JEE Physics Interview Q&A

**Q: A ball is projected at 45°. Derive maximum range.**
Horizontal: x = u cosθ × t. Vertical: 0 = u sinθ × t − ½gt² → t = 2u sinθ/g.
Range R = u cosθ × (2u sinθ/g) = u²(2sinθ cosθ)/g = u²sin2θ/g.
Maximum when sin2θ = 1 → θ = 45°. Therefore Rmax = u²/g.

**Q: Why are astronauts weightless in orbit?**
Both the spacecraft and everything inside it are in continuous free fall toward Earth, but moving horizontally fast enough to "miss" it. The spacecraft and astronaut accelerate identically at g = GM/r² — the contact force (normal force) between them is zero. This is weightlessness. Gravity IS present and IS acting; it is providing centripetal acceleration. The sensation of weightlessness is indistinguishable from true zero-gravity.

**Q: State and prove the work-energy theorem.**
Wnet = ΔKE = ½mv_f² − ½mv_i².
Proof: W = ∫F·ds = ∫ma·ds = m∫(v dv/ds)ds = m∫v dv = ½mv_f² − ½mv_i². □
Applies to ALL forces combined. Positive Wnet → KE increases (speeds up). Negative Wnet → KE decreases (slows down). Friction always does negative work on a moving object.

**Q: What is stopping potential in the photoelectric effect?**
Maximum KE of emitted electrons = hf − φ (where φ = work function, h = Planck's constant, f = frequency). Stopping potential V₀ is the minimum reverse voltage that stops all emitted electrons: eV₀ = hf − φ. Key experimental observations: V₀ depends ONLY on frequency, NOT intensity; no emission below threshold frequency f₀ = φ/h regardless of intensity; emission is instantaneous. These proved light has particle nature — classical wave theory could not explain them.

**Q: State Lenz's law and give an example.**
The direction of induced current is such that it OPPOSES the change in magnetic flux causing it (consequence of energy conservation — must do work to induce current).
Example: Bar magnet (N-pole first) approaching a coil → flux through coil increases → induced current creates N-pole at the facing end of the coil → REPELS the approaching magnet. Moving magnet away → S-pole faces magnet → ATTRACTS it (opposes the change = decrease in flux). Work must be done against these opposing forces.

**Q: Nuclear fission vs fusion — key differences?**
Fission: Heavy nucleus (U-235, Pu-239) absorbs neutron → splits into two medium nuclei + 2-3 neutrons + energy. Chain reaction possible. Basis of nuclear reactors and bombs. Energy released because binding energy per nucleon of products > that of uranium.
Fusion: Light nuclei (H isotopes) combine → heavier nucleus + energy. Requires T > 10⁷ K to overcome electrostatic repulsion. Powers the sun and stars. Energy density far greater than fission per kg of fuel. Challenge: achieving and sustaining sufficient temperature for controlled fusion (tokamak, inertial confinement).

**Q: What is Bernoulli's principle and where is it applied?**
For steady, incompressible, non-viscous fluid flow along a streamline: P + ½ρv² + ρgh = constant. As fluid velocity increases, pressure decreases (and vice versa). Applications: aircraft wings (aerofoil shape — air moves faster over curved top → lower pressure above → lift); venturimeter (measures flow rate via pressure difference); atomisers and spray guns; curve ball in cricket/baseball (Magnus effect, related concept); carburetor in engines; blood flow through narrowed arteries (stenosis causes high velocity, low pressure → vessel walls pushed inward).

**Q: Explain the photoelectric effect and its significance.**
When light of frequency above a threshold f₀ = φ/h illuminates a metal, electrons are emitted with KE = hf - φ (φ = work function). Key observations: (1) No emission below threshold frequency regardless of intensity — proved light comes in quantised packets (photons). (2) KE of emitted electrons depends on frequency, not intensity. (3) Emission is instantaneous — no time delay. Significance: Einstein's 1905 explanation won the 1921 Nobel Prize. Established wave-particle duality of light. Foundation of quantum mechanics. Practical applications: solar cells, photodiodes, night vision devices, photoelectron spectroscopy.

**Q: What is Doppler effect and its applications?**
When source and observer are in relative motion, the observed frequency differs from the emitted frequency. Approaching: observed frequency increases (blue shift). Receding: observed frequency decreases (red shift). Formula (source moving): f_obs = f_source × (v ± v_obs)/(v ∓ v_source), where v = wave speed. Applications: RADAR speed guns (police, cricket ball speed), ultrasound Doppler (blood flow measurement), astronomical redshift (evidence for expanding universe and Big Bang), bat echolocation, sonar.

**Q: What is the principle of superposition and its applications?**
Principle of superposition: when two or more waves overlap, the resultant displacement at any point is the algebraic sum of displacements due to each individual wave. Applications: interference (constructive when path difference = nλ; destructive when = (2n+1)λ/2 — thin film colours, Young's double slit experiment), standing waves (superposition of two identical waves travelling in opposite directions — string resonance, sound in pipes), beats (superposition of two slightly different frequencies → periodic intensity variation at frequency |f₁-f₂|), diffraction patterns.

**Q: What is the difference between scalar and vector quantities? Give examples.**
Scalar: has magnitude only; described completely by a single number with a unit. No direction. Example: mass (5 kg), temperature (37°C), speed (60 km/h), energy (100 J), distance, time, density, pressure.
Vector: has both magnitude AND direction; obeys vector addition laws. Cannot be fully described without both. Examples: velocity (60 km/h NORTH), force (50 N at 30°), displacement, momentum, acceleration, electric field, magnetic field. Mathematical operations: scalars follow ordinary algebra; vectors obey parallelogram/triangle law of addition, dot product, cross product.

**Q: What is the difference between elastic and inelastic collision?**
Elastic collision: both momentum AND kinetic energy are conserved. Example: billiard balls, ideal gas molecules. In 1D elastic collision: balls may exchange velocities (if equal mass). Coefficient of restitution e = 1.
Inelastic collision: momentum is conserved but kinetic energy is NOT (some converted to heat, sound, deformation). Example: car crash. Perfectly inelastic: objects stick together after collision; maximum KE loss; momentum still conserved. Coefficient of restitution e < 1 (0 for perfectly inelastic). In real world, all macroscopic collisions are inelastic to some degree. A super-elastic collision (e > 1) is possible if internal energy is released (explosion).

## Interview Q&A

**Q: What is the core problem this technology solves?**
Frame your answer around the specific pain point: what was broken or missing before this tool existed, how it addresses that gap, and what the alternatives are. The best engineers understand why, not just how.

**Q: How does this behave under failure conditions?**
Discuss: graceful degradation, circuit breakers, retry logic, timeouts, and fallback strategies. What happens when a dependency is slow? When it is down entirely? When the network partitions? Production is defined by edge cases.

**Q: What are the security considerations?**
Authentication (who are you?), authorisation (what can you do?), encryption (data in transit and at rest), audit logging (what did you do?), secret management (passwords/keys never in code), and network isolation (who can reach this?).

**Q: How would you monitor this in production?**
Three pillars: Metrics (Prometheus/Datadog — RED: Rate, Errors, Duration), Logs (structured JSON, centrally aggregated), Traces (distributed context for multi-service flows). Define your SLO first, then build alerting to protect it.

**Q: How does this scale?**
Horizontal scaling (more instances), vertical scaling (bigger instances), sharding/partitioning (splitting data), and caching (reducing repeated work). What is the bottleneck? Stateless services scale easily; stateful services require careful partitioning strategy.

**Q: Walk me through your debugging process when something is wrong.**
1. Check the current state and error messages. 2. Check logs around the time of failure. 3. Check recent changes (deployments, config changes). 4. Check resource utilisation (CPU, memory, disk, connections). 5. Isolate the component. 6. Reproduce in a lower environment. 7. Fix and verify.

**Q: What is your deployment strategy for changes?**
Never deploy big bang to production. Blue-green (instant rollback), canary (gradual traffic shift), or rolling (phased instance replacement). All require automated rollback triggers based on error rate metrics. Feature flags for long-running changes.

**Q: How do you handle configuration across environments?**
Environment variables for runtime config, secrets manager (Vault, AWS Secrets Manager) for sensitive values, config maps for non-sensitive structured config. Never commit secrets to git. Validate config at startup — fail fast rather than fail mysteriously later.
