# Argo Rollouts Interview Q&A

**Q: Argo Rollouts vs standard Deployment?**
Standard Deployment: simple rolling update (replaces old pods gradually). Argo Rollouts: advanced strategies (canary, blue-green) with automatic analysis. Can pause, promote, abort based on metrics. Integrates with Prometheus, Datadog, Wavefront for automated rollback.

**Q: Blue-Green vs Canary deployment?**
Blue-Green: two identical environments (blue=current, green=new). Instant switch, easy rollback, 2x resource cost. Canary: gradually shift traffic to new version (5% → 25% → 50% → 100%). Real user validation, lower risk, more complex.

**Q: What is an AnalysisTemplate in Argo Rollouts?**
Defines metrics queries and success/failure conditions during rollout. If error rate exceeds threshold during canary phase → automatic rollback. Metrics from: Prometheus, Datadog, Wavefront, New Relic.
