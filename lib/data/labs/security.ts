export const runtime = "edge";

export type LabStep = {
  id: string;
  title: string;
  description: string;
  type: "info" | "command" | "code" | "sql" | "verify" | "challenge";
  language?: string;
  code?: string;
  expectedOutput?: string;
  hint?: string;
  explanation?: string;
};

export type Lab = {
  id: string;
  title: string;
  difficulty: "Beginner" | "Intermediate" | "Advanced";
  duration: string;
  tools: string[];
  objective: string;
  steps: LabStep[];
  interface?: "terminal" | "code-editor" | "sql-console" | "none";
};

export type TechLabs = {
  [techSlug: string]: Lab[];
};

export const labs_security: TechLabs = {
"network-security": [
  { id: "ns-lab-1", title: "Network Security Scanning and Analysis", difficulty: "Intermediate", duration: "30 min",
    tools: ["nmap", "wireshark", "openssl"], objective: "Scan networks, analyze traffic, test TLS configurations",
    interface: "terminal",
    steps: [
      { id: "ns1", title: "Network reconnaissance with nmap", type: "command",
        description: "Map your own network to understand your attack surface.",
        code: `# Discover hosts on your network
nmap -sn 192.168.1.0/24

# Full port scan with service detection (your own systems only)
nmap -sV -sC -p- --min-rate 1000 localhost

# Check for common vulnerabilities
nmap --script vuln localhost 2>/dev/null | head -40

# UDP scan for DNS, SNMP (often overlooked)
nmap -sU -p 53,161,162 localhost

# Output formats
nmap -sV localhost -oN normal.txt -oX results.xml -oG grepable.txt`,
        explanation: "Only scan networks and systems you own or have permission to scan. nmap --script vuln runs NSE vulnerability scripts. -oX XML output can be parsed by security tools like Metasploit." },
      { id: "ns2", title: "TLS/SSL security testing", type: "command",
        description: "Verify your HTTPS configuration is secure.",
        code: `TARGET="example.com"

# Check certificate details
echo | openssl s_client -connect $TARGET:443 -servername $TARGET 2>/dev/null | \
  openssl x509 -noout -text | grep -E "Subject:|DNS:|Not After"

# Test TLS versions (should support TLS 1.2 and 1.3 only)
for version in -tls1 -tls1_1 -tls1_2 -tls1_3; do
  result=$(echo | openssl s_client -connect $TARGET:443 $version 2>&1 | grep -i "handshake")
  echo "$version: $([ -n '$result' ] && echo 'SUPPORTED' || echo 'not supported')"
done

# Check cipher suites
nmap --script ssl-enum-ciphers -p 443 $TARGET | head -30

# Comprehensive SSL test
# testssl.sh $TARGET (install from testssl.sh)`,
        explanation: "TLS 1.0 and 1.1 are deprecated and insecure — disable them. Check certificate expiry, proper hostname matching, and strong cipher suites. Run sslyze or testssl.sh for comprehensive analysis." },
    ],
  },
],

// ═══ SECURITY: SOC ═══

"soc": [
  { id: "soc-lab-1", title: "SOC: Incident Investigation Workflow", difficulty: "Advanced", duration: "35 min",
    tools: ["splunk", "bash"], objective: "Investigate a simulated security incident using SOC methodology",
    interface: "terminal",
    steps: [
      { id: "soc1", title: "Investigate failed login alerts", type: "command",
        description: "Simulate investigating brute-force alert — the most common SOC task.",
        code: `# Simulate auth log analysis (common SOC task)
# Generate sample log entries
cat > /tmp/auth.log << 'EOF'
Jan 15 14:20:01 server sshd[1234]: Failed password for root from 192.168.1.100 port 52341 ssh2
Jan 15 14:20:02 server sshd[1234]: Failed password for root from 192.168.1.100 port 52342 ssh2
Jan 15 14:20:03 server sshd[1234]: Failed password for admin from 192.168.1.100 port 52343 ssh2
Jan 15 14:20:04 server sshd[1234]: Failed password for ubuntu from 192.168.1.100 port 52344 ssh2
Jan 15 14:20:05 server sshd[1234]: Accepted password for alice from 10.0.0.5 port 52345 ssh2
Jan 15 14:20:10 server sshd[1235]: Accepted password for root from 192.168.1.100 port 52346 ssh2
EOF

echo "=== INVESTIGATION STEP 1: Count failures by IP ==="
grep "Failed password" /tmp/auth.log | awk '{print $(NF-3)}' | sort | uniq -c | sort -rn

echo "\n=== STEP 2: What accounts were targeted? ==="
grep "Failed password" /tmp/auth.log | awk '{print $9}' | sort | uniq -c

echo "\n=== STEP 3: Did any attacker succeed? ==="
grep "Accepted password" /tmp/auth.log

echo "\n=== STEP 4: Timeline of events ==="
grep "192.168.1.100" /tmp/auth.log | awk '{print $1,$2,$3,$5,$6,$7,$8,$9}'`,
        explanation: "SOC investigation order: 1) What triggered the alert? 2) Is it real or false positive? 3) Scope: how widespread? 4) Impact: was anything compromised? 5) Contain and remediate." },
      { id: "soc2", title: "Threat hunting with log analysis", type: "command",
        description: "Proactively hunt for threats that didn't trigger alerts.",
        code: `# Hunt for suspicious patterns in logs
# 1. Large data transfers (possible exfiltration)
cat > /tmp/access.log << 'EOF'
192.168.1.10 - - [15/Jan/2024:10:00:01 +0000] "GET /api/users HTTP/1.1" 200 524
192.168.1.10 - - [15/Jan/2024:10:00:02 +0000] "GET /api/users?export=all HTTP/1.1" 200 52428800
192.168.1.20 - - [15/Jan/2024:10:01:00 +0000] "POST /api/login HTTP/1.1" 200 120
10.0.0.5 - - [15/Jan/2024:10:05:00 +0000] "GET /admin/backup HTTP/1.1" 403 -
EOF

echo "=== Large responses (>1MB potential data exfil) ==="
awk '$10 > 1000000 {print $1, $7, $10/1048576 "MB"}' /tmp/access.log

echo "\n=== Unusual endpoints ==="
grep -E "(backup|export|dump|admin|config|secret)" /tmp/access.log

echo "\n=== 403s to admin paths (reconnaissance) ==="
grep " 403 " /tmp/access.log | grep -i admin`,
        explanation: "Threat hunting = proactive search beyond automated alerts. Look for: large transfers, unusual endpoints, failed admin access (reconnaissance), logins from unusual IPs, processes running at unusual hours." },
    ],
  },
],

// ═══ SECURITY: SIEM ═══

"siem": [
  { id: "siem-lab-1", title: "SIEM: Detection Rules and Investigation", difficulty: "Advanced", duration: "30 min",
    tools: ["splunk", "elasticsearch"], objective: "Write correlation rules, investigate alerts, reduce false positives",
    interface: "terminal",
    steps: [
      { id: "siem1", title: "Write detection rules (SPL/KQL)", type: "code",
        description: "Detection rules in Splunk SPL and Elastic KQL — the core SIEM skill.",
        language: "sql",
        code: `-- ============ SPLUNK SPL DETECTION RULES ============

-- Rule 1: Brute force detection (>10 failures in 5 min from same IP)
index=auth action=failed
| bucket span=5m _time
| stats count by src_ip, _time
| where count > 10
| eval alert="Brute Force Detected"

-- Rule 2: Impossible travel (login from 2 IPs within 1 hour)
index=auth action=success
| stats values(src_ip) as ips, values(_time) as times by user
| where mvcount(ips) > 1
| eval time_diff=max(times)-min(times)
| where time_diff < 3600
| table user, ips, time_diff

-- Rule 3: Data exfiltration (response > 100MB)
index=proxy
| eval size_mb=bytes/1048576
| where size_mb > 100
| stats sum(size_mb) as total_mb by src_ip
| sort -total_mb

-- ============ ELASTIC KQL DETECTION ============
-- Privilege escalation: new user added to admin group
event.action:user-added-to-group AND group.name:(admin OR sudo OR wheel OR administrators)

-- Lateral movement: RDP to many hosts
event.code:4625 AND winlog.event_data.LogonType:10
| stats count by source.ip, destination.ip`,
        explanation: "Good detection rules balance precision (few false positives) and recall (catch real threats). Start with high-confidence rules (10+ failures), tune thresholds, then add enrichment (IP reputation, time of day)." },
    ],
  },
],

// ═══ CLOUD: AWS RDS ═══

"security-fundamentals": [
  { id: "sf-lab-1", title: "Security Scanning and Hardening", difficulty: "Intermediate", duration: "30 min",
    tools: ["trivy", "gitleaks", "openssl"], objective: "Scan containers for vulnerabilities, detect secrets in code, configure TLS",
    interface: "terminal",
    steps: [
      { id: "sf1", title: "Container vulnerability scanning with Trivy", type: "command",
        description: "Trivy scans images, filesystem, and IaC for security issues.",
        code: `# Install Trivy
curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin

trivy image --severity HIGH,CRITICAL nginx:latest
trivy image --format json --output scan.json nginx:latest
trivy config ./terraform/
trivy k8s --report summary cluster`,
        explanation: "Trivy is the most comprehensive scanner: CVEs in packages, secrets in code, misconfigs in IaC. Integrate in CI: fail pipeline on CRITICAL findings. Use --ignore-unfixed to skip unfixable vulns." },
      { id: "sf2", title: "Detect secrets with gitleaks", type: "command",
        description: "Find API keys, passwords, tokens accidentally committed to Git.",
        code: `curl -sSfL https://github.com/gitleaks/gitleaks/releases/latest/download/gitleaks_8.18.0_linux_x64.tar.gz | tar xz
./gitleaks detect --source . --verbose
./gitleaks detect --source . --log-opts="--all"  # Scan all history

# Add to .pre-commit-config.yaml
cat > .pre-commit-config.yaml << 'EOF'
repos:
  - repo: https://github.com/gitleaks/gitleaks
    rev: v8.18.0
    hooks:
      - id: gitleaks
EOF
pre-commit install`,
        explanation: "Gitleaks finds: AWS keys, GCP credentials, GitHub tokens, private keys, DB passwords. --log-opts=--all scans entire git history — crucial when a secret was committed months ago." },
    ],
  },
],

// ═══ SECURITY: ETHICAL HACKING ═══

"ethical-hacking": [
  { id: "eh-lab-1", title: "Web App Security Testing", difficulty: "Advanced", duration: "35 min",
    tools: ["nmap", "gobuster", "sqlmap"], objective: "Authorized recon of a vulnerable test site: port scan, dir discovery, SQL injection",
    interface: "terminal",
    steps: [
      { id: "eh1", title: "Setup and reconnaissance", type: "command",
        description: "Use testphp.vulnweb.com — an authorized vulnerable practice site.",
        code: `# AUTHORIZED TARGET: testphp.vulnweb.com (deliberately vulnerable for practice)
TARGET="testphp.vulnweb.com"

# Port scan
nmap -sV -sC $TARGET

# Directory discovery
gobuster dir -u http://$TARGET -w /usr/share/wordlists/dirb/common.txt -x php,html -t 50

# Look for sensitive files
for path in admin login phpinfo.php .env config.php backup.sql; do
  code=$(curl -s -o /dev/null -w "%{http_code}" http://$TARGET/$path)
  echo "$code http://$TARGET/$path"
done`,
        explanation: "Always obtain written permission before scanning. Only use these techniques on: your own systems, authorized bug bounty programs, or dedicated practice sites like HackTheBox, TryHackMe, DVWA." },
      { id: "eh2", title: "SQL injection testing", type: "command",
        description: "Test for SQL injection on the authorized vulnerable site.",
        code: `TARGET="testphp.vulnweb.com"

# Manual test: add ' to URL parameter
curl "http://$TARGET/artists.php?artist=1'"
# Look for SQL errors in response

# Automated testing with sqlmap
sqlmap -u "http://$TARGET/artists.php?artist=1" --batch --level 1 --risk 1 -p artist

# If found: extract database info
sqlmap -u "http://$TARGET/artists.php?artist=1" --batch --dbs
sqlmap -u "http://$TARGET/artists.php?artist=1" --batch -D acuart --tables`,
        explanation: "SQL injection: unsanitized user input is embedded in SQL queries. Prevention: parameterized queries / prepared statements (never string concatenation). sqlmap automates detection and exploitation. Use only on authorized targets." },
    ],
  },
],
};

export function getLabsForTech(tech: string): Lab[] {
  return labs_security[tech] || [];
}
