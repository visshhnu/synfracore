# SRE Automation — Advanced

## The core risk of automated remediation: acting faster than a human can verify

Automated remediation's entire value proposition is speed — react to a failure in seconds instead of the minutes it takes a human to notice, diagnose, and act. That same speed is also its central risk: an automated action that's wrong executes just as fast as one that's right, potentially causing real damage before any human has a chance to notice something's off. This is the reason mature automation design treats blast radius for automated actions with at least as much discipline as chaos engineering treats blast radius for deliberate failure injection (see the Chaos Engineering content elsewhere in this academy for the same underlying principle applied in the opposite direction) — an auto-remediation action should default to the smallest possible scope, with escalating scope requiring escalating confidence, not a single script empowered to take a broad action against production based on one alert firing.

## Circuit breakers for automation itself

An automated remediation script that keeps re-triggering — restart, still failing, restart again, still failing — without ever escalating to a human is a specific, real failure mode worth explicitly guarding against, not an edge case:

```python
# A remediation loop with a circuit breaker — stops auto-acting after
# repeated failures and escalates instead of retrying indefinitely
class RemediationCircuitBreaker:
    def __init__(self, max_attempts=3, window_minutes=15):
        self.max_attempts = max_attempts
        self.window = timedelta(minutes=window_minutes)
        self.attempts = defaultdict(list)

    def should_attempt(self, service: str) -> bool:
        now = datetime.now()
        recent = [t for t in self.attempts[service] if now - t < self.window]
        self.attempts[service] = recent
        return len(recent) < self.max_attempts

    def record_attempt(self, service: str):
        self.attempts[service].append(datetime.now())

def handle_failure(service):
    breaker = get_circuit_breaker()
    if breaker.should_attempt(service):
        breaker.record_attempt(service)
        auto_remediate(service)
    else:
        # Circuit open — stop auto-acting, this needs a human now
        escalate_to_oncall(service, reason="Auto-remediation exhausted, needs investigation")
```
Without this, a genuinely broken deployment can trigger dozens of automated restarts in a short window, each one masking the fact that the underlying problem was never actually fixed — worse, repeated restarts can themselves cause secondary load (see the thundering-herd pattern covered in Capacity Planning) on top of whatever caused the original failure.

## Automating away the signal: a subtler, more dangerous failure mode

The most dangerous automation mistake isn't a script that fails loudly — it's automation that successfully suppresses the *symptom* of a real, worsening problem without anyone noticing the underlying issue is still there and getting worse. An auto-restart that "fixes" a memory leak every time it approaches the OOM threshold makes the leak invisible in normal monitoring — the service never crashes, never pages anyone, and the leak can grow worse for months, until either the restart frequency itself becomes a problem or the leak eventually outpaces even frequent restarts and causes a genuine outage with far less warning than an unmasked, gradually-worsening trend would have given. The practical guardrail: automated remediation should always emit its own signal (a metric, a log line, a dashboard counter) every time it acts — "auto-remediation fired for service X" needs to be visible and reviewable on its own, specifically so a rising remediation-action rate for one service is itself an alertable trend, not a silently-repeating background process nobody's watching.

## Validating automation with chaos engineering

Automated remediation is itself a hypothesis — "when X fails, this script correctly fixes it" — until it's actually been tested against a real triggering condition, and the most reliable way to test that hypothesis deliberately, rather than waiting for a real incident to be the first real test, is the same chaos-engineering discipline covered elsewhere in this academy: deliberately trigger the exact failure the automation is meant to handle, in a controlled environment, and confirm the automation actually does what it's supposed to. This closes a real, common gap — automation that was correct when written can silently stop working after an unrelated change (an API the script calls gets deprecated, a label selector stops matching after a naming convention change), and the first sign of that breakage shouldn't be a real incident where the automation was expected to help and didn't.

## Automation maturity: a rough progression

| Level | What it looks like | Typical next gap |
|---|---|---|
| Reactive | Runbooks exist but are executed manually by whoever's on-call | No automated triggering — every action still requires a human to notice and act |
| Triggered | Automation runs on-demand from an alert webhook, but with no circuit breaker or escalation logic | Repeated failures can loop indefinitely without escalating; no protection against automating away signal |
| Guarded | Circuit breakers, explicit escalation paths, and automation-action visibility are all in place | Automation hasn't been validated against real failure conditions — it's trusted but not chaos-tested |
| Validated | Automation is regularly chaos-tested against its actual triggering conditions, with metrics tracked on its own effectiveness over time | Genuinely mature — the remaining gap is usually organizational: sustaining the discipline of chaos-testing automation as the system continues to change |

Most teams building SRE automation stop at "Triggered" — the jump to "Guarded" is mostly a design discipline (circuit breakers, escalation, visibility) rather than new tooling, and is worth prioritizing before expanding automation's scope further, since ungoverned automation with broader scope is a larger version of the same risk, not a different one.
