# Incident Response

SRE › Incident Response
🚨**Incident Response**
BeginnerEngineerProductionArchitectProduction incident management — severity, runbooks, blameless postmortems
[Framework](#sec-what)[Runbook](#sec-runbook)[Postmortem](#sec-postmortem)[Tools](#sec-tools)[Interview Q&A](#sec-interview)


## 🚨 Incident Response Framework›


#### Why structured incident response matters

Unstructured incident response: multiple engineers doing duplicate work, no one communicating to stakeholders, random restarts without understanding root cause, same incident happening again next month.


Structured incident response: clear roles, focused investigation, stakeholders informed, postmortem prevents recurrence.


| Severity | Definition | Response time | Resolve within |
|---|---|---|---|
| SEV1 | All users affected, production down | Immediate (24/7) | 1 hour |
| SEV2 | Major features unavailable, significant impact | 15 minutes | 4 hours |
| SEV3 | Minor degradation, workaround available | 1 hour (business hours) | 24 hours |
| SEV4 | Cosmetic issues, no user impact | Next sprint | Sprint cycle |


Severity levels and team rolesCopy

```

```


## 📋 Incident Runbook›


Detect → Assess → Mitigate → Resolve phasesCopy

```

```


## 📝 Blameless Postmortem›


Postmortem template + 5 Whys + action itemsCopy

```

```


## 🔧 Tools & Commands›


Alerting tools + quick investigation commands + rollbackCopy

```

```


## 🎯 Interview Questions›


All
Architect
Engineer
Production


INCIDENT · ENGINEER
What is the difference between an incident and a problem in ITSM?
In ITSM (IT Service Management, ITIL framework): an Incident is an unplanned interruption or degradation of service — something is broken right now. The goal is to restore service as fast as possible, root cause can wait. A Problem is the underlying cause of one or more incidents. Problem management investigates root causes to prevent future incidents. Example: Monday morning, payment service is down (Incident). The team restores service by restarting pods. Later that week, Problem management investigates why pods crash — discovers memory leak in a new library version. Fix the library to prevent future incidents. In DevOps practice we use simpler terminology: Incident (acute, restore now), Postmortem (root cause analysis, prevent recurrence). The ITSM distinction is still important at enterprise accounts (banks, telco, HPE-scale) where formal ITSM processes are required for compliance and change management.

INCIDENT · ARCHITECT
How do you build a blameless postmortem culture?
Blameless postmortems require a top-down commitment that the goal is system improvement not punishment. The foundational principle: engineers make the best decisions possible with the informa
