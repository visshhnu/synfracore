# Gut Health Fundamentals

## The Digestive System Overview
The gut is a 9-metre muscular tube from mouth to anus. Primary functions: digesting food into absorbable molecules, absorbing nutrients into the bloodstream, eliminating waste, and hosting the body's largest immune system (70% of immune cells are gut-associated).

## Key Organs and Their Roles
| Organ | Primary Function |
|-------|----------------|
| Mouth | Mechanical breakdown; salivary amylase begins starch digestion |
| Oesophagus | Peristalsis transports food to stomach (10 seconds) |
| Stomach | HCl (pH 1.5-3.5) + pepsin for protein digestion; churning |
| Small intestine (6m) | Primary absorption site; duodenum, jejunum, ileum |
| Large intestine (1.5m) | Water reabsorption; microbial fermentation; stool formation |
| Liver | Bile for fat emulsification; detoxification; nutrient metabolism |
| Pancreas | Enzymes (amylase, lipase, proteases); insulin; glucagon |
| Gallbladder | Stores and concentrates bile; releases when fat enters duodenum |

## The Gut Microbiome
- 38 trillion microorganisms: bacteria, viruses, fungi, archaea
- Total weight approximately 1.5 kg
- Contains 150× more genes than the human genome
- Key functions: ferment fibre → SCFAs (energy for gut cells), produce vitamins (K, B12), train immune system, compete with pathogens, synthesise neurotransmitter precursors
- Diversity correlates with better health across immunity, metabolism, and mental health

## Healthy Gut Indicators
- Bowel frequency: 1-3 per day or every 1-2 days (wide normal range)
- Stool appearance: Bristol types 3-4 (smooth, formed, easy to pass)
- No significant bloating or cramping after normal meals
- No frequent acid reflux, heartburn, or excessive gas
- No urgency, straining, or pain with bowel movements

## Common Conditions

### IBS (Irritable Bowel Syndrome)
Functional disorder: abdominal pain + altered bowel habits with NO structural damage.
Types: IBS-D (diarrhoea), IBS-C (constipation), IBS-M (mixed).
Triggers: FODMAPs, stress, hormonal changes.
Management: low-FODMAP diet, stress reduction, probiotics (strain-specific), fibre adjustment.

### GERD (Gastroesophageal Reflux Disease)
Stomach acid refluxes into oesophagus. Heartburn, regurgitation, chronic cough.
Triggers: fatty/spicy food, caffeine, alcohol, large meals, lying down after eating, obesity.
Management: lifestyle changes first; antacids or PPIs (omeprazole, lansoprazole) for persistent symptoms.

## Dietary Foundations
- Fibre: 25-38 g/day; mix soluble (oats, legumes) and insoluble (whole grains, vegetables)
- Water: 2-3 litres daily (fibre needs water to work effectively)
- Fermented foods: yogurt, kefir, kimchi, sauerkraut — natural probiotic sources
- Plant diversity: 30+ different plant species per week supports microbiome diversity
- Omega-3: salmon, sardines, flaxseed — anti-inflammatory for gut lining

**Q: What are short-chain fatty acids and why do they matter?**
SCFAs (short-chain fatty acids) are produced when gut bacteria ferment dietary fibre. Main types: butyrate (4 carbons), propionate (3 carbons), acetate (2 carbons). Butyrate is the primary energy source for colonocytes (colon lining cells). Functions: maintain gut barrier integrity, anti-inflammatory effects, regulate immune function, influence appetite (propionate stimulates PYY and GLP-1 release → satiety), acetate crosses blood-brain barrier and affects energy metabolism. Higher fibre intake → more diverse microbiome → more SCFA production → better gut and systemic health.

## Fundamentals

### What You Need to Know First
These are the building blocks. Master these before moving to intermediate topics. Every expert skipped fundamentals at some point and paid for it later.

### Core Concepts

**Architecture Overview**
Understanding how a system is structured helps you reason about its behaviour. Know the main components, how they interact, and what each is responsible for. Draw it out — if you cannot sketch the architecture, you do not understand it yet.

**The Basic Unit of Work**
Every technology operates on some fundamental unit: a container, a query, a message, a record, a request. Understanding what this unit is and its lifecycle (creation → processing → completion/failure) explains most of the technology's behaviour.

**Configuration Fundamentals**
Defaults are chosen to be safe, not optimal. Know the defaults, understand what they mean, and know when to change them. Keep configuration in version control. Separate configuration from code.

**Error Handling Basics**
Read error messages completely — they almost always tell you exactly what is wrong. Know where logs are and how to read them. Understand the difference between transient errors (retry) and permanent errors (fix the code or config).

### Hands-On Exercises
1. Install and run the technology locally following the official getting-started guide
2. Run the simplest possible working example
3. Break it intentionally — introduce an error and read the error message
4. Check the logs and understand what they show
5. Change one configuration value and observe the effect

### Key Terminology
| Term | Definition |
|------|-----------|
| Node / Instance | A single running copy of the service |
| Cluster | Multiple nodes working together |
| Replica | A copy of data or a service for redundancy |
| Partition | A subdivision of data or work |
| Leader/Primary | The authoritative instance for writes |
| Follower/Replica | Secondary instance that replicates from leader |

### First 30 Minutes Checklist
- [ ] Verified installation works
- [ ] Read the architecture overview in the official docs
- [ ] Ran a hello-world example successfully
- [ ] Understood what the example actually does
- [ ] Located where logs are written
- [ ] Found the configuration file and read what the main settings do
