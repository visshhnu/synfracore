# SLO Quick Reference

```
Availability SLO to downtime conversion:
99.9%  = 8.7 hours/year  = 43.8 min/month
99.95% = 4.4 hours/year  = 21.9 min/month
99.99% = 52 min/year     = 4.4 min/month
99.999%= 5.2 min/year    = 26 sec/month

Error budget burn rate alerting:
2% burn in 1 hour  → page immediately (Sev 1)
5% burn in 6 hours → urgent (Sev 2)
10% burn in 3 days → ticket (Sev 3)

PromQL: Error rate
rate(http_requests_total{status=~"5.."}[5m]) /
rate(http_requests_total[5m])
```
