# Shell Scripting — Real World Scenarios

A note on framing: Scenario 1 below is a real, publicly documented incident (GitLab's own 2017 postmortem, which they published openly). Scenarios 2 and 3 are composite/illustrative — they describe patterns that show up repeatedly across DevOps postmortems and outage write-ups industry-wide, not a specific named company's incident, and are labeled as such.

---

## Scenario 1: The GitLab January 2017 Database Outage (documented, public incident)

**What happened:** On January 31, 2017, a GitLab engineer needed to wipe and resynchronize a secondary PostgreSQL replica as part of routine database maintenance. The intended target was the secondary server. The command was run against the **primary production database** instead — the two servers looked similar enough in the terminal that the mistake wasn't caught until data was already gone. Roughly 6 hours of production data was permanently lost (around 5,000 projects, 5,000 comments, and 700 user accounts), and the outage took GitLab.com down for many hours. GitLab published a full public postmortem rather than staying quiet about it.

**Why the backups didn't save them:** This is the part that turns "one bad command" into a multi-hour outage. GitLab had *three* separate backup mechanisms (scheduled `pg_dump` to S3, disk snapshots, and LVM snapshots) — and none of them were being actively verified. The `pg_dump` cron job had been silently failing for weeks due to a version mismatch between the dump tool and the running PostgreSQL version, and the failure alert emails were being rejected by a DMARC policy. The disk snapshots existed but were far too slow to restore under time pressure. The only backup that actually worked was an LVM snapshot that happened to be roughly 6 hours stale.

**Shell-scripting-relevant lessons — and what to actually write:**

- **Make the destructive command harder to run by accident.** A one-line safety wrapper goes a long way:
  ```bash
  confirm_destructive() {
      local target="$1"
      read -rp "About to run a destructive operation against: $target
Type the hostname to confirm: " confirmed
      [[ "$confirmed" == "$target" ]] || { echo "Aborted — confirmation did not match."; exit 1; }
  }
  confirm_destructive "$(hostname)"
  rm -rf "${DATA_DIR:?DATA_DIR must be set}"
  ```
  Note the `${DATA_DIR:?...}` guard — if `DATA_DIR` is ever unset, this fails loudly instead of expanding to an empty string and running `rm -rf` on the wrong path.

- **Make environments visually distinguishable at the shell level.** One of GitLab's own follow-up actions was color-coding the prompt (`PS1`) by environment, and showing the fully-qualified hostname instead of a short name that two servers might share:
  ```bash
  # In /etc/profile.d/ or ~/.bashrc on production hosts
  if [[ "$(hostname -f)" == *prod* ]]; then
      PS1='\[\033[1;31m\]\u@\H (PRODUCTION)\[\033[0m\]:\w\$ '
  else
      PS1='\[\033[1;33m\]\u@\H (staging)\[\033[0m\]:\w\$ '
  fi
  ```

- **A backup you haven't restored from is a hypothesis, not a backup.** A scheduled script that actually attempts a restore (to a scratch environment) and alerts on failure catches silent breakage before you need the backup for real:
  ```bash
  #!/usr/bin/env bash
  set -euo pipefail
  # Nightly: restore last backup to a throwaway DB and verify row counts look sane
  LATEST=$(aws s3 ls s3://backups/postgres/ | sort | tail -n1 | awk '{print $4}')
  pg_restore -d restore_test_db "/tmp/${LATEST}" || {
      curl -X POST "$SLACK_WEBHOOK" -d "{\"text\":\"🔴 Backup restore test FAILED for ${LATEST}\"}"
      exit 1
  }
  ROWS=$(psql -d restore_test_db -tAc "SELECT count(*) FROM projects;")
  [[ "$ROWS" -gt 0 ]] || { curl -X POST "$SLACK_WEBHOOK" -d "{\"text\":\"🔴 Restored backup has 0 rows — investigate\"}"; exit 1; }
  echo "Backup restore test passed: $ROWS rows in projects table"
  ```

---

## Scenario 2 (illustrative/composite): The health-check script that hid a real outage

**The pattern:** A deployment pipeline includes a post-deploy health check like `curl -sf http://localhost:8080/health || exit 1`. The check passes because the app *process* is up and answering `/health` — but the health endpoint only checks that the web server is running, not that it can reach the database. A downstream database migration breaks every real user-facing request while the shallow health check keeps reporting green, and the bad deploy stays live for hours before a human notices error rates climbing.

**Why this happens repeatedly:** it's a very natural first version of a health check to write, and it's easy to forget to revisit it as the app grows dependencies. This is essentially the pattern behind Scenario 1's own follow-up item, above, about verifying backups actually restore rather than just existing — the general lesson is: **a check that only verifies "the process is alive" is not the same as a check that verifies "the thing depending on this is actually healthy."**

**What a more honest health check looks like:**
```bash
#!/usr/bin/env bash
set -euo pipefail

check_deep_health() {
    local base="$1"
    # Shallow: is the process even responding?
    curl -sf "${base}/health" >/dev/null || { echo "FAIL: process not responding"; return 1; }

    # Deep: can the app actually reach its real dependencies?
    local db_status
    db_status=$(curl -sf "${base}/health/db" | jq -r '.status' 2>/dev/null || echo "unreachable")
    [[ "$db_status" == "ok" ]] || { echo "FAIL: DB dependency reports: $db_status"; return 1; }

    echo "OK: deep health check passed"
}

check_deep_health "http://localhost:8080" || exit 1
```
The honest caveat here: this requires the application itself to expose a `/health/db` (or equivalent) endpoint that actually checks its dependencies — the shell script can only be as good as what it's given to poll. If your app doesn't expose deep health information, the script-side fix is necessary but not sufficient.

---

## Scenario 3 (illustrative/composite): The retry loop that made an outage worse

**The pattern:** A script polls a service with a tight retry loop and no backoff — `while ! curl -sf "$URL"; do sleep 1; done` — during an incident where the service is already struggling under load. Dozens of hosts running the same script every second turns a recoverable blip into a thundering herd that keeps the service from ever fully recovering, because it never gets a quiet window to catch up.

**What a safer version looks like** (this is a straightforward strengthening of the `retry()` pattern already used elsewhere in this course, adding backoff and a jitter so many hosts don't all retry in lockstep):
```bash
retry_with_backoff() {
    local max_attempts="$1" base_delay="$2"; shift 2
    local attempt=1 delay="$base_delay"
    until "$@"; do
        if (( attempt >= max_attempts )); then
            echo "Giving up after $attempt attempts" >&2
            return 1
        fi
        local jitter=$(( RANDOM % 3 ))
        echo "Attempt $attempt failed, waiting $((delay + jitter))s..." >&2
        sleep $((delay + jitter))
        delay=$(( delay * 2 ))
        ((attempt++))
    done
}
retry_with_backoff 6 5 curl -sf https://api.example.com/health
```
