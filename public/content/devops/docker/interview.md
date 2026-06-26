# Docker Interview Q&A

Docker Build & Push') {

            steps {

                withCredentials([usernamePassword(credentialsId: 'acr-creds', 

                    usernameVariable: 'ACR_USER', 

                    passwordVariable: 'ACR_PASS')]) {

                    sh '''

                        docker build -t myacr.azurecr.io/${DOCKER_IMAGE} .

                        docker login myacr.azurecr.io -u $ACR_USER -p $ACR_PASS

                        docker push myacr.azurecr.io/${DOCKER_IMAGE}

                    '''

                }

            }

        }

        

        stage('Deploy to Dev') {

            steps {

                sh '''

                    helm upgrade --install myapp ./helm/myapp \

                        --namespace dev \

                        --set image.tag=${BUILD_NUMBER} \

                        --values helm/values-dev.yaml

                '''

            }

        }

        

        stage('Deploy to Production') {

            when { branch 'main' }

            input {

                message "Deploy to Production?"

                ok "Yes, deploy!"

            }

            steps {

                sh '''

                    helm upgrade --install myapp ./helm/myapp \

                        --namespace prod \

                        --set image.tag=${BUILD_NUMBER} \

                        --values helm/values-prod.yaml

                '''

            }

        }

    }

    

    post {

        failure {

            emailext subject: "Pipeline FAILED: ${JOB_NAME}",

                     body: "Check console: ${BUILD_URL}",

                     to: 'devops-team@company.com'

        }

    }

}

**2.6 MONITORING — ELK vs SPLUNK vs DATADOG**

**Q: You use ELK. How would you approach a production log analysis in Datadog?**

"Same workflow, different syntax:

| **Task** | **ELK/Kibana** | **Datadog** | **Splunk** |
| --- | --- | --- | --- |
| Search logs | KQL: level:ERROR AND service:payment | service:payment status:error | SPL: index=prod service=payment level=ERROR |
| Count errors per hour | Kibana Lens aggregation | @level:error │ timeseries count | │ timechart count |
| Filter last 15 min | Kibana time picker | @timestamp:>now-15m | earliest=-15m |
| Alert on error rate | Watcher/ElastAlert | Datadog Monitor | Splunk Alert |

In ELK I set up log pipelines using Logstash with grok patterns to parse our telecom SOM/COM logs, then visualised them in Kibana. In Datadog or Splunk the same structured parsing happens at ingest — the query language differs but the problem-solving approach is identical."

**Q: Prometheus alert is firing but you see nothing wrong. How do you investigate?**

# Check Prometheus targets — is scraping working?

# Go to Prometheus UI → Status → Targets

# Check alerting rules

kubectl get prometheusrule -n monitoring

kubectl describe prometheusrule <name>

# Query the metric directly in Prometheus UI

# Example: check if metric actually exceeds threshold

rate(http_requests_total{status="500"}[5m])

# Check Alertmanager is receiving and routing

kubectl logs -n monitoring alertmanager-0

# Check silences

# Prometheus UI → Alerting → Silences

# Common causes:

# 1. Alert is silenced

# 2. Metric labels changed — alert selector no longer matches

# 3. Scrape target is down — metric returning stale value

# 4. Threshold is correct but alert has pending period not yet met

**2.7 LINUX — Critical Troubleshooting**

**Q: Server is slow/unresponsive. Walk me through your troubleshooting.**

# Step 1: Quick overview

top        # CPU, memory, load average

htop       # Better view

uptime     # Load average trend

# Step 2: CPU analysis

vmstat 1 5          # CPU wait (wa) — if high, disk I/O issue

iostat -x 1 5       # Disk I/O per device

ps aux --sort=-%cpu | head -10  # Top CPU consumers

# Step 3: Memory analysis

free -h              # Available memory

ps aux --sort=-%mem | head -10  # Top memory consumers

cat /proc/meminfo   # Detailed breakdown


**Q: Docker vs containerd vs CRI-O?**
- Docker: full container platform (deprecated in K8s 1.24 as runtime, still used for building/local dev)
- containerd: lightweight container runtime (used by Docker internally, now direct K8s runtime)
- CRI-O: minimal runtime designed for Kubernetes (used by OpenShift)

**Q: Multi-stage build benefits?**
Separates build environment from runtime. Build stage has compilers/tools; runtime stage has only the compiled artifact. Result: 10x smaller images, smaller attack surface.

**Q: What is a Docker layer?**
Each RUN/COPY/ADD instruction creates a layer. Layers are cached — if instruction unchanged, cache is used. Order matters: put rarely-changing instructions first (dependencies before code).

**Q: How do you handle secrets in Dockerfile?**
NEVER use ARG or ENV for secrets — they appear in layer history. Use:
- Docker BuildKit secrets: `--mount=type=secret,id=mykey`
- Runtime secrets: inject via environment at container startup
- External secret managers: Vault, AWS Secrets Manager
