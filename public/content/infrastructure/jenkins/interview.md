# Jenkins Interview Questions

## Core Concepts

**Q: What is Jenkins? How does it work?**

Jenkins is an open-source automation server for CI/CD pipelines. It monitors version control for changes, triggers builds, runs tests, and deploys applications.

**Key concepts:**
- **Job/Project**: Unit of work (Freestyle, Pipeline, Multibranch Pipeline)
- **Build**: Single execution of a job
- **Pipeline**: Sequence of stages defined as code (Jenkinsfile)
- **Agent/Node**: Machine where jobs run (master or agents)
- **Executor**: Slot on an agent to run concurrent builds
- **Workspace**: Directory where build files exist

---

**Q: Declarative vs Scripted Pipeline — what's the difference?**

**Declarative Pipeline** (recommended, structured):
```groovy
pipeline {
  agent any
  
  environment {
    IMAGE_NAME = "myapp"
    DOCKER_REGISTRY = "registry.example.com"
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    
    stage('Test') {
      steps {
        sh 'npm test'
      }
      post {
        always {
          junit 'test-results/*.xml'
        }
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          docker.build("${IMAGE_NAME}:${BUILD_NUMBER}")
        }
      }
    }

    stage('Deploy to Staging') {
      when {
        branch 'develop'
      }
      steps {
        sh './deploy.sh staging'
      }
    }

    stage('Deploy to Production') {
      when {
        branch 'main'
      }
      input {
        message "Deploy to production?"
        ok "Yes, deploy!"
      }
      steps {
        sh './deploy.sh production'
      }
    }
  }

  post {
    failure {
      slackSend channel: '#deployments', message: "Build FAILED: ${BUILD_URL}"
    }
    success {
      slackSend channel: '#deployments', message: "Build PASSED: ${BUILD_URL}"
    }
  }
}
```

**Scripted Pipeline** (flexible, Groovy code):
```groovy
node {
  stage('Build') {
    // Full Groovy — more flexible but harder to read
    def mvn = tool 'Maven-3.8'
    sh "${mvn}/bin/mvn clean package"
  }
}
```

**Declarative** is preferred: easier to read, has built-in validation, better IDE support.

---

**Q: What is a Multibranch Pipeline?**

Automatically creates a pipeline job for each branch (or PR) in a repository. Scans repository → finds Jenkinsfiles → creates one job per branch.

Benefits:
- PR builds: test before merge
- Branch isolation: dev/staging/prod can have different pipelines or different parameters
- Auto-creates/deletes branch jobs as branches appear/disappear

```groovy
// Jenkinsfile at root of each branch
pipeline {
  agent any
  stages {
    stage('Test') {
      steps { sh 'make test' }
    }
    stage('Deploy') {
      when { branch 'main' }
      steps { sh 'make deploy' }
    }
  }
}
```

---

**Q: How do you store and use credentials in Jenkins?**

Jenkins Credentials Store: Manage Jenkins → Credentials → Store.
Types: Secret text, Username/Password, SSH key, Certificate, Docker registry.

```groovy
pipeline {
  environment {
    DOCKER_CREDS = credentials('docker-hub-creds')  // Username/password
    AWS_ACCESS_KEY = credentials('aws-key')          // Secret text
  }
  stages {
    stage('Push Image') {
      steps {
        sh "docker login -u $DOCKER_CREDS_USR -p $DOCKER_CREDS_PSW registry.example.com"
        // DOCKER_CREDS_USR and DOCKER_CREDS_PSW auto-created from credentials binding
      }
    }
  }
}
```

**Credentials Plugin** binds secrets to environment variables. Never echo/print credentials — Jenkins masks them in logs.

---

**Q: Explain Jenkins agents/nodes.**

**Master/Controller**: Manages jobs, stores config, distributes to agents.
**Agent**: Executes builds. Can be:
- **Permanent agent**: Always-on server (JNLP or SSH)
- **Docker agent**: Spins up Docker container per build, destroys after
- **Kubernetes agent**: Pod per build (scales automatically)
- **Cloud agent**: EC2/GCP instances spun up on demand

```groovy
pipeline {
  agent {
    docker {
      image 'node:18-alpine'
      args '-v /var/run/docker.sock:/var/run/docker.sock'
    }
  }
  // All stages run inside Node.js container
}
```

```groovy
// Different agents per stage
pipeline {
  agent none
  stages {
    stage('Build') {
      agent { label 'linux' }
      steps { sh 'make build' }
    }
    stage('Test Windows') {
      agent { label 'windows' }
      steps { bat 'make test' }
    }
  }
}
```

---

**Q: How do you implement parallel stages in Jenkins?**

```groovy
stage('Test') {
  parallel {
    stage('Unit Tests') {
      steps { sh 'npm run test:unit' }
    }
    stage('Integration Tests') {
      steps { sh 'npm run test:integration' }
    }
    stage('Linting') {
      steps { sh 'npm run lint' }
    }
  }
}
```

All three stages run simultaneously — reduces total pipeline time.

---

**Q: How do you handle shared libraries in Jenkins?**

Shared Libraries: Reusable Groovy code across multiple pipelines. Stored in a separate Git repo.

```
jenkins-shared-library/
  vars/
    deployToK8s.groovy    # Global variable/function
    sendSlackNotification.groovy
  src/
    org/company/
      Utils.groovy        # Groovy classes
```

```groovy
// vars/deployToK8s.groovy
def call(String environment, String image) {
  sh "helm upgrade --install myapp ./charts --set image=${image} --namespace ${environment}"
}
```

```groovy
// Jenkinsfile using shared library
@Library('jenkins-shared-lib@main') _

pipeline {
  stages {
    stage('Deploy') {
      steps {
        deployToK8s('production', "myapp:${BUILD_NUMBER}")
      }
    }
  }
}
```

---

**Q: How do you implement blue-green deployment with Jenkins?**

```groovy
stage('Blue-Green Deploy') {
  steps {
    script {
      // Check which environment is active
      def currentEnv = sh(returnStdout: true, script: 'kubectl get service myapp-active -o jsonpath="{.spec.selector.slot}"').trim()
      def newEnv = currentEnv == 'blue' ? 'green' : 'blue'
      
      // Deploy to inactive environment
      sh "helm upgrade --install myapp-${newEnv} ./charts --set slot=${newEnv} --set image=myapp:${BUILD_NUMBER}"
      
      // Smoke test new environment
      sh "./smoke-test.sh http://myapp-${newEnv}.internal"
      
      // Switch traffic
      sh "kubectl patch service myapp-active -p '{"spec":{"selector":{"slot":"${newEnv}"}}}'"
      
      // Remove old environment after validation
      sh "helm uninstall myapp-${currentEnv}"
    }
  }
}
```

---

**Q: Jenkins vs GitHub Actions — when to use which?**

| | Jenkins | GitHub Actions |
|---|---|---|
| Hosting | Self-hosted (you manage) | Cloud (GitHub manages) |
| Cost | Infrastructure only | Free tier + paid minutes |
| Integration | Any VCS, extensive plugins | GitHub native |
| Plugins | 1800+ plugins | Marketplace Actions |
| Setup | Complex initial setup | Simple YAML |
| Scale | Unlimited (you provision) | Limited by plan |
| Use case | Complex enterprise pipelines | GitHub-hosted projects |

Choose Jenkins: existing Jenkins investment, complex pipelines, non-GitHub VCS, full control needed.
Choose GitHub Actions: GitHub projects, simple pipelines, want managed infrastructure.

## Revision Notes
```
JENKINS ARCHITECTURE:
Master: orchestration, UI, job management
Agents: execution (permanent, Docker, K8s, cloud)
Executor: concurrent build slot per agent

DECLARATIVE PIPELINE STRUCTURE:
pipeline { agent + environment + stages { stage { steps + post } } + post }

STAGES: sequential by default | parallel {} for concurrent
WHEN: condition for stage execution (branch, environment, expression)
INPUT: manual approval gate

CREDENTIALS: stored in Jenkins, bound with credentials() binding
AUTO-MASKING: Jenkins hides secrets in logs

MULTIBRANCH: auto-creates jobs per branch/PR from repository scan

SHARED LIBRARIES:
vars/: global functions | src/: Groovy classes
@Library('name') _ to use in Jenkinsfile

BEST PRACTICES:
Pipeline as code (Jenkinsfile in repo)
Use declarative over scripted
Credentials plugin for secrets
Docker/K8s agents for clean builds
Shared libraries for DRY code
Parallel stages for speed
Approval gates for production
```
