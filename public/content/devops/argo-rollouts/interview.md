# Argo Rollouts Interview Q&A

**Q: Argo Rollouts vs standard Deployment?**
Standard Deployment: simple rolling update (replaces old pods gradually). Argo Rollouts: advanced strategies (canary, blue-green) with automatic analysis. Can pause, promote, abort based on metrics. Integrates with Prometheus, Datadog, Wavefront for automated rollback.

**Q: Blue-Green vs Canary deployment?**
Blue-Green: two identical environments (blue=current, green=new). Instant switch, easy rollback, 2x resource cost. Canary: gradually shift traffic to new version (5% → 25% → 50% → 100%). Real user validation, lower risk, more complex.

**Q: What is an AnalysisTemplate in Argo Rollouts?**
Defines metrics queries and success/failure conditions during rollout. If error rate exceeds threshold during canary phase → automatic rollback. Metrics from: Prometheus, Datadog, Wavefront, New Relic.


**Q: What is the difference between Argo Rollouts and standard Deployment?**
Standard Deployment does basic rolling update with limited control. Argo Rollouts adds: canary (percentage traffic shifting), blue-green (instant traffic switch), automated analysis (metric-based promotion/rollback), pause steps, and header-based routing.

**Q: What is an AnalysisRun?**
Argo Rollouts creates an AnalysisRun when a canary step reaches an analysis step. AnalysisRun queries your metrics provider (Prometheus, Datadog, Wavefront) and evaluates success/failure criteria. If metrics exceed failure thresholds — automatic rollback.

**Q: How does Argo Rollouts integrate with Istio or AWS ALB?**
Uses VirtualService (Istio) or TargetGroupBinding (AWS ALB) to control traffic weights between stable and canary versions. The Rollout controller adjusts weights progressively as the canary moves through steps. This gives real user traffic validation at low risk.

**Q: Can Argo Rollouts work without a service mesh?**
Yes — Nginx ingress, Traefik, AWS ALB, and other ingress controllers support weighted traffic splitting. The rollout controller adjusts ingress annotations or target group weights. Istio provides the most granular control (header-based, fault injection) but is not required.


