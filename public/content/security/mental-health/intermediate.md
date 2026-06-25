# Mental Health Intermediate

## Evidence-Based Therapies

### Cognitive Behavioural Therapy (CBT)
Most extensively researched psychotherapy. Core model: thoughts → feelings → behaviours are interconnected and all are modifiable.

Key techniques:
- Thought records: identify automatic negative thoughts, examine supporting/contradicting evidence, generate balanced alternatives
- Behavioural activation: schedule pleasurable and meaningful activities (counters depression and avoidance)
- Exposure therapy: gradual systematic confrontation of feared stimuli (most effective for anxiety)
- Cognitive restructuring: identify and challenge cognitive distortions (catastrophising, mind-reading, all-or-nothing thinking, personalisation)

Strongly evidence-based for: depression, all anxiety disorders, OCD, PTSD, eating disorders, health anxiety, chronic pain.

### Acceptance and Commitment Therapy (ACT)
Third-wave CBT. Core principle: "Accept what you cannot control; commit to action aligned with your values."
Psychological flexibility is the goal — not symptom elimination.
Defusion: observe thoughts as passing mental events, not literal facts ("I notice I'm having the thought that...")
Values clarification: identify what truly matters → guide behaviour regardless of uncomfortable emotions.

### DBT (Dialectical Behaviour Therapy)
Developed by Marsha Linehan for borderline personality disorder; widely applicable.
Four skill modules: Mindfulness (core skill), Distress Tolerance (crisis survival), Emotion Regulation (reduce suffering), Interpersonal Effectiveness (relationship skills).
Evidence: self-harm, suicidality, eating disorders, substance use, PTSD, treatment-resistant depression.

## Psychiatric Medications

### Antidepressants
SSRIs (first-line): fluoxetine, sertraline, escitalopram — block serotonin reuptake. 4-6 weeks for full effect. Common side effects: nausea (initial), sexual dysfunction, sleep disruption.
SNRIs: venlafaxine, duloxetine — also used for generalised anxiety, neuropathic pain, fibromyalgia.
Bupropion: dopamine + norepinephrine reuptake inhibitor. Good for motivation/energy/concentration. No sexual side effects. Avoid in seizure disorder.
Mirtazapine: sedating — ideal for severe insomnia + poor appetite. Weight gain is common.

### Mood Stabilisers
Lithium: gold standard for bipolar I. Narrow therapeutic window (0.6-1.2 mmol/L). Requires regular blood level monitoring (quarterly), kidney function, and thyroid function tests. Very effective for suicide prevention.
Valproate/sodium valproate: effective mood stabiliser; weight gain; elevated ammonia; teratogenic (neural tube defects) — AVOID in women of childbearing age without reliable contraception.
Lamotrigine: effective for bipolar depression and maintenance. Risk of Stevens-Johnson syndrome (SJS) — must titrate slowly. Safer in pregnancy than valproate.

## Lifestyle as Medicine

### Exercise and Mental Health
Multiple RCTs demonstrate exercise comparable to antidepressants for mild-moderate depression. Meta-analyses report effect size ~0.75 (large). Mechanisms: ↑ BDNF (brain-derived neurotrophic factor — promotes neuroplasticity), ↑ serotonin and dopamine, ↓ cortisol, ↓ systemic inflammation, ↑ self-efficacy, ↑ social engagement (if group-based). Dose: 30+ minutes of moderate aerobic exercise 3-5 times per week.

### Sleep and Mental Health
Bidirectional relationship: insomnia worsens depression, anxiety, psychosis, and mania; mental illness disrupts sleep. CBT-I (Cognitive Behavioural Therapy for Insomnia) is MORE effective than sleeping medications long-term with no dependency risk. Sleep hygiene: consistent wake time (anchor of circadian rhythm), limit caffeine after 2pm, dark/cool/quiet bedroom, screens off 1 hour before bed, no napping after 3pm.

**Q: What is the difference between psychologist and psychiatrist?**
Psychologist: typically holds a PhD or PsyD in psychology. Specialises in psychological assessment (neuropsychological testing, psychometric testing) and psychotherapy. Cannot prescribe medications in most countries (exceptions: some US states, military psychologists in limited contexts). Works with mental health, learning disabilities, and neuropsychological conditions.
Psychiatrist: medical doctor (MBBS/MD) with specialisation in psychiatry. Can diagnose all mental and medical conditions. Can and does prescribe medications. Often combines medication management with some psychotherapy. Handles complex, severe, or treatment-resistant conditions. Best outcomes: psychiatrist for medication + psychologist or trained therapist for therapy — collaborative care model.

## Intermediate Topics

### The Gap Between Learning and Production
Most tutorials show you the happy path. Intermediate knowledge is about the unhappy paths: what breaks, how to debug it, how to prevent it, and how to recover when it does break anyway.

### Real-World Patterns

**Configuration Management**
Use environment variables for values that differ per environment. Use a secrets manager for sensitive values. Validate all configuration at startup — a service that starts with invalid config and then crashes an hour later is harder to debug than one that refuses to start. Version your configuration alongside your code.

**Connection Management**
Connections are expensive to create. Use connection pools. Set appropriate pool sizes — too small creates a bottleneck, too large exhausts server resources. Set timeouts: connect timeout (how long to wait for a connection to be established), read/write timeout (how long to wait for a response).

**Retry and Backoff**
Transient failures are normal in distributed systems. Retry with exponential backoff: wait 1s, then 2s, then 4s, then 8s. Add jitter (random variation) to prevent thundering herd when many services retry simultaneously. Set a maximum number of retries. Use a circuit breaker to stop retrying a service that is clearly down.

**Structured Logging**
JSON logs are machine-readable. Include: timestamp (ISO 8601), log level, service name, trace ID (for correlation across services), user ID or request ID (for debugging specific requests), and the actual message. Never log sensitive data (passwords, tokens, PII).

### Performance Fundamentals
Measure first, optimise second. Use profiling tools — optimise what the profiler shows is slow, not what you think is slow. Common wins: add the right indexes, reduce N+1 queries, add a cache layer, reduce serialisation overhead, batch small operations.

### Intermediate Debugging
When basics fail: 1. Enable debug logging temporarily. 2. Add timing instrumentation around suspected slow operations. 3. Check network traffic (tcpdump, Wireshark, or a proxy). 4. Check system resources (top, iostat, netstat). 5. Reproduce with minimal config to eliminate variables.

### Testing Strategy
| Test Type | What It Tests | When It Runs |
|-----------|--------------|-------------|
| Unit test | Single function/component in isolation | Every commit |
| Integration test | Component with real dependencies | Every commit or daily |
| End-to-end test | Full user journey | Pre-release |
| Load test | Performance under realistic load | Pre-release, periodically |
| Chaos test | Behaviour under failure | Periodically in staging |
