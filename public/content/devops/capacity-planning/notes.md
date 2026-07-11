# Capacity Planning — Notes

## Core mental model

- SLOs define the reliability target; capacity planning is what makes hitting that target actually achievable under real load. They're complementary, not the same discipline.
- Plan against peak utilization, not average — a service can average low utilization while still regularly spiking well past a safe threshold during specific windows.
- Headroom exists specifically to cover the gap between a scaling trigger firing and new capacity actually serving traffic — not as generic, unmotivated padding.
- Senior-level capacity planning is about finding the *minimum* headroom that reliably works, not the maximum that feels safe — over-provisioning is a real, ongoing cost, not a free safety margin.

## The three test types

- **Load test** — confirm the system holds at expected peak
- **Stress test** — push past expected peak deliberately to find the real breaking point
- **Soak test** — sustained moderate load over hours/days, the only test type that reliably catches memory leaks and slow degradation

## Forecasting inputs worth combining

- Historical trend (with enough data to separate real trend from noise)
- Seasonal decomposition — separates recurring seasonal spikes from genuine underlying growth
- Known planned events, forecast explicitly rather than left to reactive autoscaling
- Business-side leading indicators (signups, active users) that predict infra demand ahead of the infra metrics themselves moving

## Autoscaling tuning

- Scale up fast (avoid SLO breach during a real spike), scale down slowly (avoid thrashing — scaling in too eagerly then having to scale back out minutes later)
- Queue-depth-based scaling (KEDA and similar) is a fundamentally different, often more accurate signal than CPU/memory for queue-consuming workloads
- A scale-out event itself can cause a secondary outage (thundering herd) if new replicas all perform an expensive startup action simultaneously against a shared dependency

## Stateful services need separate treatment

- Read capacity scales via replicas; write capacity in most relational databases scales vertically (a real ceiling) or via sharding (a significant project, not a capacity knob)
- Conflating read and write capacity into one number misses that they have entirely different scaling paths and lead times

## Multi-region and chaos-informed planning

- A failover-capable region needs steady-state headroom for absorbing a failed region's full load, not just its own normal traffic — otherwise "designed for failover" hasn't actually been capacity-tested
- Chaos experiments that remove real capacity are the closest thing to genuinely verifying a capacity forecast, rather than trusting it as an untested assumption

## Common failure modes worth remembering

- Autoscaler "reacted" on paper but new capacity wasn't actually ready in time — check real time-to-serving-traffic, not just time-to-schedule
- Load test used uniform synthetic traffic that doesn't match real bursty, unevenly-distributed production traffic
- Headroom that was correct at last review silently erodes from continued organic growth between reviews — treat capacity review as continuous, not periodic
- Longstanding over-provisioning discovered late in a cost review — the same continuous-review discipline needed to catch under-provisioning applies in the other direction too
