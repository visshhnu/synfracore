# HA & DR Cheatsheet

```
RTO/RPO Targets by tier:
Tier 1 (Mission critical): RTO < 1 min, RPO = 0 (zero data loss)
Tier 2 (Business critical): RTO < 15 min, RPO < 5 min
Tier 3 (Important): RTO < 4 hours, RPO < 1 hour
Tier 4 (Non-critical): RTO < 24 hours, RPO < 24 hours

DR Strategies (cost vs recovery speed):
Backup & Restore → Pilot Light → Warm Standby → Multi-Site Active-Active
(cheapest)                                        (most expensive)
(hours RTO)                                       (zero RTO)
```
