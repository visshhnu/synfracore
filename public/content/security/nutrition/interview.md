# Nutrition Interview Q&A

**Q: What is the difference between saturated and unsaturated fats?**
Saturated fat: carbon chain fully saturated with hydrogen — no double bonds. Solid at room temperature. Primarily animal products (butter, ghee, fatty meat) and tropical oils. Raises LDL ("bad") cholesterol when consumed in excess. Should be limited but not completely eliminated.
Unsaturated fat: has one (monounsaturated) or more (polyunsaturated) double bonds. Liquid at room temperature. Olive oil, avocado, nuts (MUFA); fatty fish, flaxseed, walnuts (omega-3 PUFA). Generally heart-healthy — omega-3 PUFAs are particularly anti-inflammatory.

**Q: Do most people need supplements?**
Food-first approach is preferred — whole foods provide synergistic nutrients and phytochemicals. Evidence-based supplements for specific situations: Vitamin D (very common deficiency, difficult to get from diet alone), Vitamin B12 (essential for all vegans and many vegetarians), Folate (women planning pregnancy), Omega-3 DHA/EPA (if not eating oily fish 2× week), Iodine (if not using iodised salt). Other supplements: only if documented deficiency by blood test.

**Q: What is the glycaemic index vs glycaemic load?**
Glycaemic Index (GI): Ranks foods by how fast they raise blood glucose compared to pure glucose (GI=100). Low <55 (lentils, oats), Medium 55-70, High >70 (white bread, glucose drinks).
Glycaemic Load (GL) = GI × grams carbohydrate per serving / 100. Accounts for PORTION SIZE — more practically meaningful. Watermelon has high GI (72) but low GL (4) because a typical serving contains few carbs. Better tool for managing blood sugar than GI alone.

**Q: How much protein is needed for muscle building?**
Research consensus: 1.6-2.2 g protein per kg body weight daily for hypertrophy combined with resistance training. Distribute across 3-5 meals (~25-40 g per meal). Leucine content per meal (≥2.5-3 g) is the key trigger for muscle protein synthesis. Total daily intake matters more than timing, but consuming protein within 1-2 hours of training is moderately beneficial.

**Q: Is dietary fat unhealthy?**
Fat quality matters far more than total quantity. Trans fats: avoid completely — most harmful dietary fat. Saturated fats: limit, not eliminate. Unsaturated fats (olive oil, avocado, nuts, omega-3 fish): actively beneficial. Fat is essential for: fat-soluble vitamin absorption (A, D, E, K), sex hormone production, cell membrane integrity, brain function (60% of dry brain weight is fat), and satiety. Very low-fat diets (<15% calories) cause deficiencies and hormonal disruption.

**Q: What is a caloric deficit and what's the right amount?**
Caloric deficit = consuming fewer calories than you expend. Body draws on stored glycogen then fat to compensate. 1 kg of fat ≈ 7,700 kcal. Practical target: 300-500 kcal/day deficit = approximately 0.3-0.5 kg per week loss. Aggressive deficits (>750-1000 kcal/day) cause: muscle loss (even with high protein), metabolic adaptation, nutrient deficiencies, fatigue, hormonal disruption, and are unsustainable. Slower loss (0.5-1% body weight per week) preserves muscle mass better.

**Q: Are carbohydrates bad for you?**
No — carbohydrate QUALITY and source matter enormously. Whole food carbohydrates (vegetables, legumes, whole grains, fruits) are associated with better health outcomes across cardiovascular disease, diabetes, and longevity. They come packaged with fibre, vitamins, minerals, and phytochemicals. Refined carbohydrates (white bread, sugary drinks, white rice in excess, processed snacks) are associated with worse metabolic health. The problem is not carbohydrates per se but the elimination of fibre and micronutrients in refining. Low-carb diets can work for weight loss but are not necessary and may not be sustainable long-term.

**Q: How much water should I drink daily?**
General guideline: approximately 2.0-2.5 litres total from all sources (food + drink) for adults in temperate climates. Increases with: exercise, hot or humid climate, fever, diarrhoea, breastfeeding. Best indicator: urine colour — pale yellow = well hydrated, dark yellow/amber = dehydrated, colourless = possibly overhydrated (dilutes electrolytes). The "8 glasses a day" rule is an approximation — individual needs vary significantly based on body size, activity, and climate.

**Q: What is the difference between a food allergy and food intolerance?**
Food allergy: involves the immune system; IgE-mediated response; can be life-threatening (anaphylaxis); even tiny amounts trigger reaction; onset rapid (minutes to 2 hours); diagnosed by skin prick test or specific IgE blood test. Common: peanuts, tree nuts, shellfish, fish, milk, eggs, wheat, soy.
Food intolerance: no immune involvement; usually dose-dependent (small amounts tolerated); symptoms delayed (hours); not life-threatening; GI symptoms primarily. Examples: lactose intolerance (enzyme deficiency), fructose intolerance (absorption issue), gluten sensitivity (not coeliac — no immune/structural damage).

**Q: What is the Mediterranean diet and why is it considered healthy?**
Dietary pattern traditional to Mediterranean countries: abundant vegetables, fruits, legumes, nuts, and whole grains; olive oil as primary fat; moderate fish (2+×/week) and poultry; limited red meat and processed foods; moderate red wine (optional). Extensive evidence base: reduces risk of cardiovascular disease (CVD) by 30% in PREDIMED trial, improves cognitive function and reduces Alzheimer's risk, reduces type 2 diabetes risk, associated with lower overall mortality. Mechanisms: anti-inflammatory (olive oil, fish omega-3), antioxidant (plant polyphenols), gut microbiome-supporting (high fibre diversity), lipid-improving (MUFA + omega-3). Most consistently supported dietary pattern across disease outcomes in research.

**Q: How do you read a nutrition label effectively?**
Key elements in order of importance: Serving size (all values are per serving, not per package — check how many servings per container first), Total calories, Protein content (g), Fibre content (g — aim for foods with >3g per serving), Added sugar (vs naturally occurring — keep added sugar low), Saturated fat (limit) and trans fat (avoid — any amount is too much), Sodium (high sodium >600mg per serving). Ingredients list: ingredients listed in descending order by weight — if sugar (in any form) appears in the first 3 ingredients, it is a high-sugar product. Short ingredient list with recognisable foods = generally better. % Daily Values: based on 2000 kcal diet — 5% or less = low; 20% or more = high.

**Q: What is intermittent fasting and does it work?**
Intermittent fasting (IF): eating patterns that cycle between periods of eating and fasting. Common protocols: 16:8 (16-hour fast, 8-hour eating window daily), 5:2 (eat normally 5 days, restrict to ~500 kcal on 2 non-consecutive days). Mechanisms: during fasting, insulin levels fall → fat burning increases; cellular autophagy (cellular clean-up process) is enhanced. Evidence: effective for weight loss in short-term studies, comparable to continuous calorie restriction; some metabolic benefits (insulin sensitivity, inflammation reduction). Limitations: adherence challenges, may not be suitable for those with diabetes, pregnancy, history of eating disorders, or who take medications requiring food.

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
