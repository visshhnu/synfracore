# Gut Health Cheatsheet

## Bristol Stool Chart
| Type | Appearance | Meaning |
|------|-----------|---------|
| 1 | Separate hard lumps | Severe constipation |
| 2 | Lumpy sausage shape | Mild constipation |
| 3 | Cracked sausage | Normal (slightly firm) |
| 4 | Smooth soft sausage | Ideal — aim for this |
| 5 | Soft blobs, clear edges | Insufficient fibre |
| 6 | Fluffy mushy pieces | Mild diarrhoea |
| 7 | Entirely liquid, watery | Diarrhoea |

## Top Gut-Supportive Foods
| Category | Examples |
|---------|---------|
| Fermented (probiotics) | Yogurt, kefir, kimchi, sauerkraut, miso, kombucha |
| Prebiotic fibre | Garlic, onion, asparagus, oats, banana, chicory root |
| High fibre | Lentils, beans, whole grains, vegetables, berries |
| Anti-inflammatory | Turmeric, ginger, fatty fish, olive oil, leafy greens |

## Common Gut Disruptors
- Ultra-processed food (low fibre, emulsifiers, artificial additives)
- Alcohol (disrupts gut lining and kills beneficial bacteria)
- NSAIDs like ibuprofen (damage mucosal lining)
- Unnecessary antibiotics (collateral damage to microbiome)
- Chronic stress (disrupts motility and increases permeability)
- Sedentary lifestyle (reduces peristalsis and microbiome diversity)
- Poor sleep (gut repair happens during sleep)

## IBS vs IBD at a Glance
| Feature | IBS | IBD (Crohn's/UC) |
|---------|-----|----------------|
| Cause | Functional (no structural damage) | Inflammatory damage to gut wall |
| Blood in stool | Rare | Common |
| Weight loss | Uncommon | Common |
| Imaging findings | Normal | Abnormal (ulcers, strictures) |
| Cancer risk | Normal background | Elevated in extensive UC |
| Diagnosis | Symptom criteria | Endoscopy + biopsy |
| Treatment | Diet, lifestyle, symptom meds | Immunosuppressants, biologics |

## FODMAP Quick Summary
| High FODMAP — Limit | Low FODMAP — OK |
|--------------------|-----------------|
| Wheat, rye | Rice, quinoa, oats (small serve) |
| Garlic, onion | Spring onion tops only |
| Apple, pear, mango | Strawberry, kiwi, orange |
| Regular dairy (milk, soft cheese) | Lactose-free milk, hard cheese |
| Chickpeas (large amounts) | Canned lentils (rinsed, small portion) |
| Mushrooms, cauliflower | Carrot, zucchini, spinach, tomato |

## Daily Gut Health Habits
☑ 25-38 g fibre from diverse plant sources
☑ 2-3 litres water daily
☑ At least one fermented food daily
☑ 30+ different plant foods per week (aim)
☑ 30 min movement daily (stimulates motility)
☑ 7-9 hours sleep (gut repairs overnight)
☑ Stress management practice daily

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
