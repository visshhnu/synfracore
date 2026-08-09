# Splunk — Installation Guide

## Download Splunk

1. Go to **splunk.com/download** and sign up for a free account (required even for the free tier)
2. Choose **Splunk Enterprise** (self-hosted, full-featured, free for a limited daily ingestion volume without a license, per Overview's Splunk Free framing) — this is the right choice for learning the platform hands-on
3. Select the package for your OS (Linux `.tgz`, macOS `.dmg`, Windows `.msi`)

## Install — Single-Instance Evaluation (Linux)

Matches Fundamentals' minimal install path — the right starting point before any clustering concepts from Advanced apply:

```bash
wget -O splunk.tgz "https://download.splunk.com/products/splunk/releases/latest/linux/splunk.tgz"
tar xvzf splunk.tgz -C /opt
/opt/splunk/bin/splunk start --accept-license

# You'll be prompted to set an admin username/password on first start
# Web UI available at http://<host>:8000 once startup completes
```

## Install — macOS

```bash
# After downloading the .dmg from splunk.com, or via the package:
tar xvzf splunk*.tgz -C /Applications
/Applications/splunk/bin/splunk start --accept-license
```

## Install — Windows

1. Run the downloaded `.msi` installer
2. Follow the setup wizard — set the admin account during installation
3. Splunk starts automatically as a Windows service; access the Web UI at `http://localhost:8000`

## Install a Universal Forwarder (Separate From the Indexer)

A production-shaped setup separates the **forwarder** (lightweight, runs on the data source) from the **indexer** (the full Splunk Enterprise instance receiving data) — this mirrors the architecture Overview describes:

```bash
# On the source host — a lightweight package, not full Splunk Enterprise
wget -O splunkforwarder.tgz "https://download.splunk.com/products/universalforwarder/releases/latest/linux/splunkforwarder.tgz"
tar xvzf splunkforwarder.tgz -C /opt
/opt/splunkforwarder/bin/splunk start --accept-license

# Point the forwarder at the indexer
/opt/splunkforwarder/bin/splunk add forward-server <indexer-host>:9997

# Tell the forwarder what to monitor
/opt/splunkforwarder/bin/splunk add monitor /var/log/myapp/app.log
```

## Verify Everything Works

```bash
# 1. Confirm splunkd is running
/opt/splunk/bin/splunk status

# 2. Log in to the Web UI at http://<host>:8000 with the admin
#    credentials set during first start

# 3. Run a basic search to confirm data is searchable
#    Search bar: index=_internal | head 10
#    (the _internal index always exists and contains Splunk's own logs —
#    a reliable way to confirm search is functioning before any real
#    data source is configured)

# 4. If a forwarder was set up, confirm its data arrives:
#    index=<your_index> | head 10
```

## Common Installation Issues

**Web UI unreachable at port 8000**
```bash
/opt/splunk/bin/splunk status
# If not running:
/opt/splunk/bin/splunk start
# Confirm no firewall is blocking 8000 (Web UI) or 8089 (management port)
```

**Forwarder shows connected but no data appears in searches**
```bash
/opt/splunkforwarder/bin/splunk list monitor
# Confirms what paths the forwarder actually thinks it's watching —
# a common gap is a monitor path that doesn't match the real log
# file's actual location or file-permission access
```

**"License violation" warnings on a fresh install**
Splunk Free/evaluation licenses have a daily ingestion volume cap `(needs verification — recheck against current source for the current cap and licensing terms)` — this is expected during heavy testing and doesn't block search of already-indexed data, only new ingestion until the daily window resets.

**`splunk start` hangs or fails on first run**
```bash
# Check the splunkd log directly rather than guessing
tail -f /opt/splunk/var/log/splunk/splunkd.log
```

## What's Installed

After a successful single-instance installation:
- **splunkd** — the core Splunk process, handling indexing and running the Web UI/management interface
- **Web UI** — accessible on port 8000 by default
- **The `_internal` index** — Splunk's own operational logs, always present, useful as a working baseline before any real data source is configured

## Next Steps

Go to the **Fundamentals** section to run your first SPL searches.
