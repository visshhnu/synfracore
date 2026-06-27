# Jenkins Troubleshooting Guide

## Issue 1: Build stuck in queue (never starts)

**Symptom:** Build queued but no executors pick it up.

**Root Cause:** No available executor with required label, all agents offline, or resource constraint.

**Debug steps:**
- Jenkins UI → Build Executor Status (sidebar)
- Pipeline: check `agent { label 'docker' }` — does that label exist?
- Manage Jenkins → Manage Nodes → Check agent status

**Fix patterns:**
```groovy
// Check label matches agent configuration exactly
agent { label 'linux && docker' }

// Or use any available executor
agent any

// For Kubernetes: check pod templates
agent {
    kubernetes {
        yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: docker
    image: docker:26
    command: ['sleep', 'infinity']
'''
    }
}
```

---

## Issue 2: Groovy sandbox violation

**Symptom:** `org.jenkinsci.plugins.scriptsecurity.sandbox.RejectedAccessException: Scripts not permitted to use method...`

**Root Cause:** Declarative or scripted pipeline calls a method not in the Groovy sandbox allowlist.

**Fix:**
- Option 1: Go to Manage Jenkins → In-process Script Approval → Approve the specific method
- Option 2: Move the logic to a Shared Library (`@Library`) which runs outside sandbox
- Option 3: Wrap in `@NonCPS` annotation for non-serializable operations:

```groovy
@NonCPS
def parseJson(text) {
    new groovy.json.JsonSlurper().parseText(text)
}
```

---

## Issue 3: Credential binding not working

**Symptom:** `$API_KEY` is empty inside sh step or withCredentials block seems to not inject.

**Debug steps:**
```groovy
withCredentials([string(credentialsId: 'my-api-key', variable: 'API_KEY')]) {
    sh 'echo "Length: ${#API_KEY}"'  // check if non-empty (never print value!)
    sh 'env | grep -c API'           // verify it's set
}
```

**Fix patterns:**
```groovy
// Wrong: using env. prefix inside withCredentials
withCredentials([usernamePassword(credentialsId: 'docker-hub', 
    usernameVariable: 'DOCKER_USER', 
    passwordVariable: 'DOCKER_PASS')]) {
    
    // Correct: reference without env. prefix in sh
    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
    
    // Wrong: this won't work
    sh "docker login -u ${env.DOCKER_USER}"  // env.DOCKER_USER is masked/empty
}
```

---

## Issue 4: Pipeline fails with "Cannot serialize" in parallel stages

**Symptom:** `java.io.NotSerializableException` when using parallel blocks.

**Root Cause:** CPS (Continuation Passing Style) transformation requires all variables to be serializable for pipeline pausing/resuming.

**Fix:**
```groovy
// Move non-serializable logic to @NonCPS methods
@NonCPS
def getDockerImages() {
    // List or regex operations that fail serialization
    return ['nginx:latest', 'redis:7']
}

// Use the result (which IS serializable - List<String>)
def images = getDockerImages()
parallel images.collectEntries { img ->
    ["Build ${img}": { sh "docker pull ${img}" }]
}
```

---

## Issue 5: Disk space causing builds to fail

**Symptom:** `No space left on device` on Jenkins controller or agent.

**Root Cause:** Old build artifacts, Docker layers, or workspace accumulation.

**Fix:**
```groovy
// Add cleanup to pipeline
post {
    always {
        cleanWs()  // clean workspace after build
        sh 'docker system prune -f'  // if docker agent
    }
}

// Configure job-level retention
properties([
    buildDiscarder(logRotator(
        numToKeepStr: '10',      // keep last 10 builds
        artifactNumToKeepStr: '5'
    ))
])
```

```bash
# Manual cleanup on Jenkins controller
find /var/lib/jenkins/jobs -name "*.log" -mtime +30 -delete
docker system prune -a -f --volumes  # on agents
```

**Prevention:**
- Set Build Discarder in all jobs: 10-20 builds maximum
- Use external artifact storage (S3/Nexus) instead of Jenkins archive
- Mount `/var/lib/jenkins` on a large separate volume
- Monitor disk usage: `df -h /var/lib/jenkins`
