# Mental Health Cheatsheet

## Common Conditions — First-Line Treatments
| Condition | Core Features | First-Line Therapy | Medication |
|---------|-------------|------------------|-----------|
| Major Depression | Low mood/anhedonia ≥2 weeks | CBT | SSRIs |
| GAD | Excessive worry, multiple areas | CBT, relaxation training | SSRIs/SNRIs |
| Panic Disorder | Recurrent unexpected panic attacks | CBT with interoceptive exposure | SSRIs |
| Social Anxiety | Fear of negative social evaluation | CBT with exposure | SSRIs |
| PTSD | Intrusion, avoidance, hyperarousal | CPT, PE, or EMDR | SSRIs |
| OCD | Obsessions + compulsions | ERP (exposure + response prevention) | SSRIs (high dose) |
| Bipolar I | Mania + depression episodes | Psychoeducation, routine | Lithium, valproate |
| Schizophrenia | Psychosis + negative symptoms | Psychosocial rehab | Antipsychotics |

## Self-Care Pillars
1. Sleep: 7-9 hours; consistent wake time; good sleep hygiene
2. Movement: 30 min moderate exercise 3-5 times/week
3. Nutrition: balanced diet; limit alcohol; stay hydrated
4. Connection: meaningful relationships; reduce isolation
5. Purpose: activities aligned with personal values
6. Stress management: mindfulness, nature, creative activities
7. Professional support: therapy/psychiatry when struggling — seek early

## Grounding Technique (5-4-3-2-1)
For panic, anxiety, or dissociation:
- 5 things you can SEE right now
- 4 things you can TOUCH and feel
- 3 things you can HEAR
- 2 things you can SMELL
- 1 thing you can TASTE

## Box Breathing (Physiological Regulation)
```
Inhale for 4 counts
Hold for 4 counts
Exhale for 4 counts
Hold for 4 counts
Repeat 4-6 times
Activates parasympathetic nervous system; reduces acute anxiety and panic
```

## When to Seek Professional Help
- Symptoms lasting more than 2 weeks
- Symptoms significantly impair work, relationships, or daily functioning
- Using alcohol or substances to cope
- Thoughts of harming yourself or others
- Unable to manage despite self-help strategies
- A trusted person has expressed concern

## Crisis Resources (India)
| Service | Contact |
|---------|---------|
| iCall (TISS Mumbai) | 9152987821 |
| Vandrevala Foundation (24/7) | 1860-2662-345 |
| Snehi | 044-24640050 |
| AASRA | 9820466627 |
| Sumaitri (Delhi) | 011-23389090 |

## Cheatsheet

### Core Operations Quick Reference

```bash
# Check status / health
status | health | ping | info

# View logs (most recent first)
logs --tail=100 | journalctl -u service -n 100

# Restart service
restart | systemctl restart service

# Apply configuration changes
reload | apply | validate && restart

# Check resource usage
top | htop | free -h | df -h
```

### Troubleshooting Checklist
```
Is the service running?         → check status / ps aux
Is the port listening?          → ss -tlnp | grep PORT
Can you reach it?               → curl -v http://host:port/health
Are there errors in logs?       → grep -i error /var/log/service.log
Did something change recently?  → git log / deployment history
Are resources exhausted?        → top / free / df / netstat
Is the config valid?            → validate config / dry-run
```

### Configuration Best Practices
| Setting | Never Do | Always Do |
|---------|----------|-----------|
| Passwords | Hardcode in source | Use secrets manager |
| Ports | Expose all ports | Expose only required |
| Log level | Leave at DEBUG in prod | Use INFO, DEBUG only for troubleshooting |
| Timeouts | Leave as 0 (infinite) | Set explicit values per use case |
| Resources | Leave as unlimited | Set memory/CPU limits |

### Performance Quick Wins
1. **Add missing indexes** — check slow query logs, EXPLAIN plans
2. **Enable connection pooling** — avoid per-request connection creation
3. **Add caching** — for data that is read frequently and changes rarely
4. **Batch operations** — group small operations instead of one-at-a-time
5. **Async processing** — move slow work off the critical request path

### Security Baseline
```bash
# Verify TLS is configured
openssl s_client -connect host:port

# Check open ports (only expected ports should be open)
ss -tlnp

# Verify no default credentials are in use
# Verify no sensitive data in logs
grep -r "password\|secret\|token" /var/log/ | head -5

# Check file permissions on config files
ls -la /etc/service/config.*
```

### Key Metrics Dashboard
| Metric | What to Watch | Alert If |
|--------|--------------|----------|
| Error rate | % of failed operations | > 1% |
| Latency p99 | Slowest 1% of requests | > SLO threshold |
| CPU usage | Processing capacity | > 80% sustained |
| Memory usage | Heap / RAM utilisation | > 85% |
| Disk usage | Storage capacity | > 80% |
| Connection pool | Pool utilisation | > 90% |
