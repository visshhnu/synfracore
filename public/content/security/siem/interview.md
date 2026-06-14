# SIEM — Interview Questions

**What is a SIEM and how does it differ from a firewall or IDS?**
Firewall: prevents unauthorized access by blocking traffic (Layer 3-7 packet filtering). IDS: detects suspicious traffic/behavior in real-time and alerts. SIEM: collects and correlates logs from ALL sources (firewalls, IDS, servers, applications, cloud) to detect complex attack patterns that span multiple systems over time. A firewall blocks a bad packet; a SIEM correlates 50 failed logins then a successful one then suspicious file access = brute force + compromise. SIEM enables historical investigation; firewall and IDS are real-time.

**What is the difference between SIEM, SOAR, and XDR?**
SIEM: aggregates logs, detects threats, requires humans to investigate and respond. SOAR (Security Orchestration, Automation, Response): automates the response to SIEM alerts — enriches context, creates tickets, blocks IPs, without human intervention. XDR (Extended Detection and Response): integrates detection and response across endpoints, network, cloud, and email natively — less need for manual integration. Modern trend: SIEM + SOAR together, or XDR for organizations without dedicated SOC. SIEM is the data lake; SOAR is the automation on top.

**How do you reduce false positives in SIEM alerts?**
Baselining: understand normal behavior before alerting on anomalies. Whitelisting: exclude known-good IPs (monitoring tools, backup servers), service accounts, maintenance windows. Threshold tuning: start high (10 events), track false positive rate, tune down carefully. Correlation: require multiple signals (failed login + from new country + at unusual hour + admin account = high confidence). Context enrichment: low-risk user + low-criticality system = lower severity. Regular review: weekly false positive analysis, feedback loop to tune rules.
