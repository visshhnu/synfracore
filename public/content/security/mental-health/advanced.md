# Mental Health Advanced Topics

## Trauma and PTSD

### Types of Trauma
Type I (single-incident): Car accident, assault, natural disaster, medical emergency.
Type II (repeated/prolonged): Childhood abuse, domestic violence, war, trafficking.
Complex PTSD (C-PTSD — ICD-11): Prolonged interpersonal trauma; PTSD core criteria plus: affect dysregulation, negative self-concept ("I am permanently damaged"), and disturbed relationships.

### PTSD Symptom Clusters (DSM-5)
Intrusion: flashbacks, nightmares, intrusive memories, intense psychological/physiological distress at cues.
Avoidance: avoiding trauma-related thoughts, feelings, people, places, activities.
Negative cognitions/mood: distorted blame, persistent negative beliefs about self/world, emotional numbing, detachment, persistent shame/guilt, anhedonia.
Alterations in arousal: hypervigilance, exaggerated startle, sleep disturbance, irritability/aggression, reckless behaviour, concentration difficulties.

### Evidence-Based PTSD Treatments
CPT (Cognitive Processing Therapy): Identify and challenge "stuck points" — distorted beliefs about trauma, safety, power/control, esteem, and intimacy. 12 structured sessions.
Prolonged Exposure (PE): Imaginal exposure (recounting trauma in detail) and in vivo exposure (approaching avoided situations/reminders). Gradually reduces conditioned fear response.
EMDR (Eye Movement Desensitisation and Reprocessing): Bilateral sensory stimulation while processing trauma memories. WHO recommended. Mechanism debated but outcomes well-established.

## Severe Mental Illness

### Schizophrenia Spectrum
Positive symptoms: hallucinations (auditory most common — typically commenting or commanding voices), delusions (persecutory, referential, grandiose, erotomanic), disorganised thought and speech (loose associations, word salad), disorganised behaviour.
Negative symptoms: flat/blunted affect, alogia (poverty of speech), avolition (impaired goal-directed behaviour), anhedonia, asociality — most disabling for long-term function.
Cognitive symptoms: working memory impairment, processing speed deficits, executive dysfunction — predict functional outcome better than positive symptoms.
Treatment: antipsychotics (D2 antagonism); clozapine for treatment-resistant; psychosocial rehabilitation; family psychoeducation; supported employment (IPS).

### Bipolar Disorder
Bipolar I: Full manic episodes (elevated/irritable mood, decreased need for sleep, grandiosity, racing thoughts, pressured speech, increased goal-directed activity, risky behaviour, ≥1 week or any duration if hospitalised) ± psychosis; major depressive episodes common.
Bipolar II: Hypomanic episodes (milder, <1 week, no psychosis, no significant impairment) + major depressive episodes (often more severe and frequent than hypomania).
Treatment: Mood stabilisers (lithium, valproate, lamotrigine); atypical antipsychotics (especially for mania); psychoeducation; maintaining sleep regularity; avoiding alcohol and cannabis.

## Mental Health Stigma and Language

### Types of Stigma
Public stigma: negative stereotypes, prejudice, and discrimination toward people with mental illness.
Self-stigma: internalisation of public stigma — reduces help-seeking, worsens self-esteem, interferes with recovery.
Structural stigma: institutional policies and practices disadvantaging people with mental illness — underfunding of mental health vs physical health, employment discrimination.

### Person-First and Recovery-Oriented Language
Use: "person with schizophrenia" not "schizophrenic"
Use: "died by suicide" not "committed suicide" (decriminalising language)
Use: "experiencing psychosis" not "is psychotic"
Use: "person living with bipolar disorder" not "manic-depressive"
Contact-based education (direct positive contact with people with lived experience) is the most effective anti-stigma intervention.

**Q: What is the recovery model in mental health?**
The recovery model shifts focus from 'cure' (eliminating symptoms) to 'recovery' (living a meaningful, satisfying life despite mental illness). Core principles: hope (recovery is possible for anyone), self-determination (person defines their own recovery goals), meaningful activity, social inclusion, personal responsibility (active role in own care). Recovery does NOT necessarily mean absence of symptoms — it means the person has a life worth living despite ongoing challenges. Originated in consumer/survivor movement. Contrasts with medical model's exclusive focus on symptom reduction. WRAP (Wellness Recovery Action Planning) is a structured self-management recovery tool.

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
