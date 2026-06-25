# BCHHC Intermediate — PDGM Deep Dive

## PDGM — Patient-Driven Groupings Model

Effective January 2020, replaced the therapy-based PPS. Payment is per 30-day period (not 60-day episode). Each period classified by five factors:

### Factor 1: Timing
- **Early**: First 30-day period of the episode
- **Late**: Second and all subsequent 30-day periods
- Early periods typically pay more

### Factor 2: Admission Source
- **Community**: Patient not hospitalised in the 14 days before home health SOC
- **Institutional**: Patient discharged from hospital, SNF, or inpatient rehab within 14 days
- Institutional source generally pays slightly higher

### Factor 3: Clinical Grouping (12 Groups)
| Group | Primary Diagnosis Examples |
|-------|--------------------------|
| Musculoskeletal Rehab | Hip fracture, joint replacement, M17 OA knee |
| Neuro/Stroke Rehab | CVA sequela (I69.-), Parkinson's |
| Wound Care | L89 pressure ulcer, L97 non-pressure, T81 post-surgical |
| Complex Medical/Surgical | Post-surgical care, complex medical management |
| Respiratory | COPD J44.1, respiratory failure |
| Endocrine | E11 diabetes with complications |
| Infectious Disease/Neoplasms | Active infection, cancer care |
| Cardiac/Circulatory | CHF I50.22, I13.0 HTN combo |
| MMTA | Medication management, teaching, assessment |
| Behavioural Health | Dementia, depression, psychiatric conditions |
| Immobility | Debility, deconditioning |
| GI/GU | Colostomy care, urinary management |

### Factor 4: Functional Level
From OASIS items: Low / Medium / High
Based on: ambulation, transferring, bathing, dressing, eating, toilet hygiene

### Factor 5: Comorbidity Adjustment
Based on secondary diagnoses: None / Low / High
Higher comorbidity complexity = higher payment

## LUPA — Low Utilization Payment Adjustment
- If visits fall below the LUPA threshold for the clinical group, payment switches to per-visit rate
- Thresholds vary by group (2–6 visits per 30-day period)
- LUPA payments significantly lower than standard episode payments
- Document and schedule visits to meet minimum thresholds when clinically appropriate

## Form 485 — Plan of Care
- Physician-certified plan required every 60 days
- Must include: all diagnoses, medications, functional limitations, safety measures, goals, visit frequency
- Physician must sign — cannot be backdated
- Without valid 485: services not billable to Medicare

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
