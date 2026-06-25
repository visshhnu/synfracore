# Gut Health Advanced Topics

## Inflammatory Bowel Disease (IBD)

### Crohn's Disease vs Ulcerative Colitis
| Feature | Crohn's Disease | Ulcerative Colitis |
|---------|----------------|-------------------|
| Location | Any GI segment (mouth to anus) | Colon and rectum ONLY |
| Pattern | Skip lesions (non-continuous) | Continuous from rectum upward |
| Depth | Transmural (all wall layers) | Mucosal layer only |
| Complications | Fistulas, strictures, abscesses | Toxic megacolon, perforation |
| Cancer risk | Slightly elevated | Elevated with long-standing extensive UC |
| Surgery | NOT curative — disease recurs | Colectomy is curative for UC |
| Diagnosis | Colonoscopy + MRI enterography + biopsy | Colonoscopy + biopsy |

### IBD Treatment Pyramid
1. Aminosalicylates (5-ASA): mesalazine — mild-moderate UC
2. Corticosteroids: acute flares only — NOT for maintenance (side effects)
3. Immunomodulators: azathioprine, 6-mercaptopurine — steroid-sparing maintenance
4. Biologics: anti-TNF (infliximab, adalimumab), anti-integrin (vedolizumab), anti-IL12/23 (ustekinumab)
5. Small molecules: JAK inhibitors (tofacitinib, upadacitinib) — oral targeted therapy

## SIBO — Small Intestinal Bacterial Overgrowth

### Overview
Bacteria normally residing in the colon colonise the small intestine where they compete with the host for nutrients and produce gases.
Causes: impaired gut motility (DM, hypothyroidism, scleroderma), post-surgical anatomy (short bowel, gastric bypass), chronic PPI use, immune deficiency.
Symptoms: bloating (1-2 hrs after eating carbs), gas, diarrhoea, malabsorption, weight loss, nutritional deficiencies (B12, iron, fat-soluble vitamins).
Diagnosis: Lactulose or glucose hydrogen/methane breath test.
Treatment: Rifaximin (non-absorbable antibiotic) ± neomycin (for methane-dominant); elemental diet; dietary modification; address root cause.

## Leaky Gut / Intestinal Permeability

### Mechanism
Tight junction proteins (claudin, occludin, zonulin) between intestinal epithelial cells weaken, allowing bacterial endotoxin (LPS), food antigens, and microbial products to translocate into systemic circulation.
Triggers: alcohol, chronic NSAID use, dysbiosis, chronic stress, processed food, infections.
Associated with: IBD, coeliac disease, type 1 diabetes, rheumatoid arthritis, obesity, non-alcoholic fatty liver disease.

### Supporting Gut Barrier
- L-Glutamine: primary fuel for enterocytes; supplementation supports tight junction integrity
- Zinc: required for tight junction protein synthesis
- Vitamin D: regulates tight junction expression
- Omega-3 fatty acids: anti-inflammatory; reduce intestinal permeability
- Eliminating triggers: alcohol, NSAIDs, highly processed food

## Microbiome, Immunity, and Early Life

### Critical Windows for Microbiome Development
Birth method: Vaginal birth → inoculation with Lactobacillus from birth canal. C-section → hospital bacteria colonise first → different immune programming.
Breastfeeding: Human milk oligosaccharides (HMOs) selectively feed Bifidobacterium infantis — key for immune tolerance development.
Antibiotic exposure in first year: persistent microbiome disruption → significantly increased risk of allergies, asthma, IBD, obesity.
First 1000 days: most critical window for establishing microbiome diversity and long-term immune and metabolic health.

**Q: What is faecal microbiota transplant (FMT) and what conditions is it used for?**
FMT: transferring processed stool from a healthy, screened donor into the GI tract of a recipient to restore healthy microbiome. Delivery: via colonoscopy, enema, nasogastric tube, or capsules. Evidence-based indication: Clostridioides difficile (C. diff) infection — FMT is >90% effective for recurrent C. diff, significantly outperforming antibiotics alone; now FDA-approved (Rebyota, Vowst) for this indication. Investigational uses: IBD (emerging evidence for UC), obesity, IBS, autism spectrum disorder, hepatic encephalopathy. Donor screening is critical: extensive testing for pathogens, antibiotic resistance genes, and health markers.

## Advanced Topics

### Production-Grade Architecture

**High Availability Design**
No single point of failure. Multiple availability zones. Health checks with automatic failover. Tested failover procedures (not just designed). RTO (Recovery Time Objective) and RPO (Recovery Point Objective) defined and verified.

**Data Consistency Models**
| Model | Guarantee | Trade-off |
|-------|-----------|-----------|
| Strong consistency | Every read sees the latest write | Lower availability, higher latency |
| Eventual consistency | Reads will eventually reflect writes | Higher availability, temporary inconsistency |
| Read-your-writes | You see your own writes immediately | Most intuitive for users |
| Causal consistency | Causally related operations are ordered | Balance of consistency and availability |

Choose based on business requirements, not personal preference. Financial transactions need strong consistency. Social media feeds work fine with eventual consistency.

**Capacity Planning Framework**
1. Baseline: Measure current p50/p95/p99 latency and throughput
2. Model: Project growth (traffic, data, users) over 6/12/18 months
3. Identify bottleneck: Which component hits its limit first?
4. Test: Load test to verify the model
5. Provision: Build headroom before you need it (not after)
6. Monitor: Alert before limits are reached, not after

**Zero-Downtime Deployments**
Database migrations must be backward-compatible with the previous version of the application (old code must work with new schema). Deploy schema changes before code changes. Use expand-contract pattern: add column → deploy code that writes to both → backfill data → remove old column.

### Advanced Observability

**SLOs and Error Budgets**
Define your SLO: "99.9% of requests complete in <500ms over 30 days." Error budget: the amount of downtime/errors you can have while still meeting the SLO. Burn rate alerts: alert when you are consuming the error budget too fast to survive the month.

**Distributed Tracing**
Propagate a trace ID across all services involved in a request. Capture spans (individual operations) with timing. Visualise the critical path — the sequence of operations that determines the overall latency. Identify where time is actually spent.

**Cardinality and Metric Design**
High-cardinality dimensions (user ID, request ID) destroy metrics databases. Use them in logs and traces; use low-cardinality labels in metrics (service, endpoint, status code, region). Design metrics for the questions you need to answer, not all possible questions.
