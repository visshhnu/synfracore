# JEE Chemistry Interview Q&A

**Q: Difference between SN1 and SN2 reaction mechanisms?**
SN1: Two-step; forms carbocation intermediate; first-order kinetics (rate = k[RX] only); racemisation at chiral centre; favoured by 3° > 2° substrates, polar protic solvents (stabilise carbocation and leaving group anion).
SN2: One-step backside attack; inverts configuration (Walden inversion); second-order kinetics (rate = k[RX][Nu⁻]); favoured by 1° > 2° substrates (3° too hindered), polar aprotic solvents, strong nucleophile.
Key distinction: SN1 forms carbocation intermediate; SN2 has no intermediate (concerted mechanism).

**Q: Why is benzene unusually stable despite having three double bonds?**
Benzene's 6 π electrons are fully delocalised over all 6 carbons in a cyclic planar ring. Hückel's rule: 4n+2 π electrons for n=1 → 6 electrons = aromatic stabilisation. Resonance energy ≈ 150 kJ/mol (energy released relative to a hypothetical non-delocalised structure). This extra stability explains why benzene undergoes electrophilic aromatic SUBSTITUTION (preserves aromaticity) rather than ADDITION (would destroy aromaticity).

**Q: State Markovnikov's rule and explain its mechanism.**
In addition of HX to an unsymmetrical alkene: H adds to the carbon bearing MORE hydrogen atoms (less substituted carbon); X adds to the carbon bearing FEWER hydrogen atoms (more substituted). Mechanism: H⁺ (electrophile) adds first → generates carbocation at the more substituted carbon (higher stability: 3° > 2° > 1°) → X⁻ attacks the more stable carbocation. Anti-Markovnikov addition occurs via radical mechanism (peroxide effect) where radicals, not carbocations, are the intermediates.

**Q: Why do transition metals form coloured compounds?**
Partially filled d orbitals. When ligands surround the metal ion, they cause Crystal Field Splitting — d orbitals split into two energy sets (t₂g lower, eg higher). The energy gap Δ falls in the visible light range. Electrons absorb photons of specific wavelength to jump from t₂g to eg. The complementary colour (not absorbed) is what we observe. Δ depends on ligand field strength (spectrochemical series). Example: [Cu(H₂O)₄]²⁺ absorbs red light → appears blue.

**Q: Explain the Nernst equation and its use.**
E = E° − (0.0592/n) log Q at 25°C. Calculates electrode potential at non-standard conditions. Applications: cell EMF at any concentration, finding equilibrium constants (K = antilog(nE°/0.0592)), explaining concentration cells, glass electrode pH measurement. At equilibrium: Q = K and E = 0. When Q > K: reaction goes in reverse; when Q < K: reaction proceeds forward.

**Q: Physisorption vs chemisorption?**
Physisorption: Weak van der Waals forces. ΔH = 20-40 kJ/mol. Reversible. Multilayer possible. No activation energy. Decreases with increasing temperature. Non-specific. Example: activated charcoal adsorbing gases.
Chemisorption: Chemical bond formation between adsorbate and surface. ΔH = 40-400 kJ/mol. Irreversible (mostly). Monolayer only. Requires activation energy. Initially increases then decreases with temperature (volcano plot). Highly specific. Example: N₂ on iron catalyst in Haber-Bosch process.

**Q: What is the iodoform test and what does it detect?**
React compound with I₂/NaOH (or KI/KIO₃). Yellow precipitate of CHI₃ (iodoform, characteristic antiseptic smell) indicates: methyl ketones (CH₃COR), acetaldehyde (CH₃CHO), ethanol (CH₃CH₂OH), and secondary alcohols with structure CH₃CH(OH)R. Mechanism: base-catalysed trihalogenation of the α-methyl group → CI₃ group → base cleaves to give CHI₃ + carboxylate. Useful distinction: acetone (positive), diethyl ketone (negative, no methyl adjacent to C=O).

**Q: What is the difference between enthalpy and entropy?**
Enthalpy (H): Heat content of a system. ΔH = heat absorbed/released at constant pressure. Exothermic reactions: ΔH < 0 (heat released to surroundings). Endothermic: ΔH > 0 (heat absorbed from surroundings). Related to bond formation/breaking.
Entropy (S): Measure of disorder or randomness. ΔS > 0 = increased disorder (gas from solid, solution formation, more moles of gas). ΔG = ΔH - TΔS determines spontaneity. Reaction is spontaneous when ΔG < 0.

**Q: What are coordination compounds and how are they named?**
Coordination compounds contain a central metal atom/ion bonded to surrounding ligands (Lewis bases). Example: [Fe(CN)₆]⁴⁻ = hexacyanoferrate(II) ion. Naming rules: ligands named before metal; anionic ligands end in -o (cyano, chloro, hydroxo); neutral ligands: aqua, ammine, carbonyl. Metal oxidation state in Roman numerals in parentheses. If complex is anion: metal name ends in -ate. Example: [Cu(NH₃)₄]²⁺ = tetraamminecopper(II) ion.

**Q: What is the Born-Haber cycle and what does it calculate?**
A thermodynamic cycle applying Hess's law to calculate lattice energy of ionic compounds — which cannot be measured directly. Steps for NaCl: sublimation of Na (endothermic), dissociation of Cl₂ (endothermic), ionisation of Na → Na⁺ (endothermic, IE₁), electron affinity of Cl → Cl⁻ (exothermic), lattice formation Na⁺ + Cl⁻ → NaCl(s) (exothermic, lattice energy). By Hess's law: ΔH_f = sum of all steps. Lattice energy = ΔH_f - (sublimation + ½ dissociation + IE₁ + EA). High lattice energy → more stable ionic compound, higher melting point, lower solubility.

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
