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

export const labs_devops: TechLabs = {
"docker": [
  {
    id: "docker-lab-1",
    title: "Run Your First Container",
    difficulty: "Beginner",
    duration: "15 min",
    tools: ["docker"],
    objective: "Pull an image, run a container, inspect it, and clean up",
    interface: "terminal",
    steps: [
      {
        id: "d1-1", title: "Verify Docker is installed", type: "command",
        description: "Check Docker version to confirm it's ready to use.",
        code: "docker --version\ndocker info",
        expectedOutput: "Docker version 24.x.x\nServer: Docker Engine",
        explanation: "Docker info shows server stats — running containers, images stored, storage driver.",
      },
      {
        id: "d1-2", title: "Pull the nginx image", type: "command",
        description: "Download the official nginx web server image from Docker Hub.",
        code: "docker pull nginx:alpine\ndocker images",
        expectedOutput: "alpine: Pulling from library/nginx\nStatus: Downloaded newer image for nginx:alpine",
        explanation: "alpine variant is a minimal Linux image (~5MB vs ~140MB for full nginx). Always prefer slim images in production.",
      },
      {
        id: "d1-3", title: "Run nginx container", type: "command",
        description: "Start nginx, map port 8080 on your machine to port 80 inside the container.",
        code: "docker run -d --name my-nginx -p 8080:80 nginx:alpine",
        expectedOutput: "3a7b9c2d1e4f...",
        hint: "-d means detached (background), --name gives it a friendly name, -p maps ports host:container",
        explanation: "The container has its own network namespace. Port mapping punches a hole through so external traffic reaches nginx.",
      },
      {
        id: "d1-4", title: "Verify it's running", type: "verify",
        description: "Check container status and test the web server.",
        code: "docker ps\ncurl http://localhost:8080",
        expectedOutput: "CONTAINER ID   IMAGE          STATUS\n3a7b9c2d1e4f   nginx:alpine   Up 30 seconds",
        explanation: "docker ps shows running containers. Use docker ps -a to see all containers including stopped ones.",
      },
      {
        id: "d1-5", title: "Inspect container details", type: "command",
        description: "Look inside the container's configuration, network settings, and environment.",
        code: "docker inspect my-nginx | head -50\ndocker logs my-nginx\ndocker exec -it my-nginx sh",
      },
      {
        id: "d1-6", title: "Stop and remove", type: "command",
        description: "Clean up: stop the container, remove it, and optionally remove the image.",
        code: "docker stop my-nginx\ndocker rm my-nginx\ndocker rmi nginx:alpine",
        hint: "You can combine stop + rm: docker rm -f my-nginx",
        explanation: "Stopped containers still exist on disk. Always clean up to free space. docker system prune removes everything unused.",
      },
    ],
  },
  {
    id: "docker-lab-2",
    title: "Build a Custom Docker Image",
    difficulty: "Beginner",
    duration: "20 min",
    tools: ["docker", "Dockerfile"],
    objective: "Write a Dockerfile, build an image, and run your own containerized app",
    interface: "terminal",
    steps: [
      {
        id: "d2-1", title: "Create the app files", type: "command",
        description: "Create a simple Node.js app that we'll containerize.",
        language: "bash",
        code: `mkdir myapp && cd myapp

cat > app.js << 'EOF'
const http = require('http');
const server = http.createServer((req, res) => {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello from Docker! Hostname: ' + require('os').hostname());
});
server.listen(3000, () => console.log('Server running on port 3000'));
EOF

cat > package.json << 'EOF'
{"name": "myapp", "version": "1.0.0", "main": "app.js"}
EOF`,
      },
      {
        id: "d2-2", title: "Write the Dockerfile", type: "code",
        description: "Create a Dockerfile that packages the app. Every instruction creates a new layer.",
        language: "dockerfile",
        code: `FROM node:20-alpine

# Set working directory inside container
WORKDIR /app

# Copy dependency files first (layer caching optimization)
COPY package.json .

# Install dependencies (cached if package.json unchanged)
RUN npm install --production

# Copy app source
COPY . .

# Document which port the app uses (metadata only, doesn't publish)
EXPOSE 3000

# Default command to run when container starts
CMD ["node", "app.js"]`,
        explanation: "Order matters in Dockerfiles. Put things that change rarely (package.json, npm install) before things that change often (source code). This maximizes Docker's layer cache.",
      },
      {
        id: "d2-3", title: "Build the image", type: "command",
        description: "Build the image. Docker executes each Dockerfile instruction and creates a layer.",
        code: "docker build -t myapp:1.0 .\ndocker images | grep myapp",
        expectedOutput: "REPOSITORY   TAG   IMAGE ID       SIZE\nmyapp        1.0   abc123def456   125MB",
        hint: "The -t flag tags the image as name:version. The . means use current directory as build context.",
      },
      {
        id: "d2-4", title: "Run and test", type: "verify",
        description: "Start a container from your custom image and test it.",
        code: "docker run -d -p 3000:3000 --name myapp-container myapp:1.0\ncurl http://localhost:3000",
        expectedOutput: "Hello from Docker! Hostname: abc123def456",
      },
      {
        id: "d2-5", title: "Challenge: Multi-stage build", type: "challenge",
        description: "Rewrite the Dockerfile using multi-stage builds to reduce the final image size by 60%.",
        hint: "Use FROM node:20-alpine AS builder to compile/install, then FROM node:20-alpine and COPY --from=builder to only copy what's needed.",
        explanation: "Multi-stage builds keep build tools out of production images. A Go binary might be 800MB with compiler, 10MB without.",
      },
    ],
  },
  {
    id: "docker-lab-3",
    title: "Docker Compose: Multi-Container App",
    difficulty: "Intermediate",
    duration: "30 min",
    tools: ["docker", "docker-compose"],
    objective: "Deploy a 3-tier web app (nginx + app + postgres) with Docker Compose",
    interface: "terminal",
    steps: [
      {
        id: "d3-1", title: "Write docker-compose.yml", type: "code",
        description: "Define all services, networks, and volumes in a single file.",
        language: "yaml",
        code: `version: '3.8'

services:
  # PostgreSQL database
  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_DB: appdb
      POSTGRES_USER: appuser
      POSTGRES_PASSWORD: secret123
    volumes:
      - pgdata:/var/lib/postgresql/data   # persist data
    networks:
      - backend
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U appuser -d appdb"]
      interval: 10s
      timeout: 5s
      retries: 5

  # Application
  app:
    build: .
    environment:
      DATABASE_URL: postgresql://appuser:secret123@db:5432/appdb
      NODE_ENV: production
    depends_on:
      db:
        condition: service_healthy   # Wait until DB is ready
    networks:
      - backend
      - frontend
    restart: unless-stopped

  # Nginx reverse proxy
  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
    volumes:
      - ./nginx.conf:/etc/nginx/conf.d/default.conf:ro
    depends_on:
      - app
    networks:
      - frontend

volumes:
  pgdata:   # Named volume: persists across container restarts

networks:
  frontend: {}   # nginx <-> app
  backend:  {}   # app <-> db (isolated from nginx)`,
        explanation: "Services in the same network can reach each other by service name (app connects to db:5432). Network segmentation means nginx can't directly access the database.",
      },
      {
        id: "d3-2", title: "Start all services", type: "command",
        description: "Launch the entire stack with one command.",
        code: "docker compose up -d\ndocker compose ps\ndocker compose logs -f",
        expectedOutput: "✔ Container db-1     Started\n✔ Container app-1    Started\n✔ Container nginx-1  Started",
      },
      {
        id: "d3-3", title: "Scale the app tier", type: "command",
        description: "Run 3 app instances behind nginx for load balancing.",
        code: "docker compose up -d --scale app=3\ndocker compose ps",
        explanation: "Compose handles container naming automatically. Nginx round-robins requests across all 3 app containers.",
      },
      {
        id: "d3-4", title: "Zero-downtime update", type: "command",
        description: "Update the app image without any downtime.",
        code: "docker compose pull app\ndocker compose up -d --no-deps --build app",
        explanation: "Compose recreates only the app service. --no-deps skips stopping dependent services (nginx stays up).",
      },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// KUBERNETES
// ═══════════════════════════════════════════════════════

"kubernetes": [
  {
    id: "k8s-lab-1",
    title: "Deploy Your First App to Kubernetes",
    difficulty: "Beginner",
    duration: "25 min",
    tools: ["kubectl", "minikube"],
    objective: "Create a Deployment, expose it with a Service, and scale it",
    interface: "terminal",
    steps: [
      {
        id: "k1-1", title: "Verify cluster is running", type: "command",
        description: "Check that your cluster is accessible and nodes are ready.",
        code: "kubectl cluster-info\nkubectl get nodes\nkubectl get pods -A",
        expectedOutput: "NAME        STATUS   ROLES           AGE   VERSION\nnode-1      Ready    control-plane   10d   v1.28.0",
      },
      {
        id: "k1-2", title: "Create a Deployment", type: "command",
        description: "Deploy nginx with 3 replicas. Kubernetes will ensure 3 pods always run.",
        language: "bash",
        code: `cat <<EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-app
  labels:
    app: web-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: web-app
  template:
    metadata:
      labels:
        app: web-app
    spec:
      containers:
      - name: nginx
        image: nginx:alpine
        ports:
        - containerPort: 80
        resources:
          requests:
            cpu: "100m"
            memory: "64Mi"
          limits:
            cpu: "200m"
            memory: "128Mi"
EOF`,
        explanation: "The Deployment controller constantly reconciles: it watches real state (pods running) vs desired state (3 replicas) and takes action to close any gap.",
      },
      {
        id: "k1-3", title: "Watch pods come up", type: "verify",
        description: "Observe the pods being created and reaching Running state.",
        code: "kubectl get pods -l app=web-app -w\nkubectl describe pod -l app=web-app | grep -E 'State|Ready'",
        expectedOutput: "NAME                       READY   STATUS    RESTARTS\nweb-app-7d4b9c5f8-x2k9p   1/1     Running   0\nweb-app-7d4b9c5f8-n8t4r   1/1     Running   0\nweb-app-7d4b9c5f8-p7m3q   1/1     Running   0",
      },
      {
        id: "k1-4", title: "Expose with a Service", type: "command",
        description: "Create a Service to give stable network access to the pods. Pods come and go; Service IP is stable.",
        code: `kubectl expose deployment web-app --port=80 --type=ClusterIP
kubectl get service web-app
kubectl describe service web-app`,
        explanation: "ClusterIP is internal-only. The Endpoints list shows which Pod IPs the Service load-balances to. This list updates automatically as pods are added/removed.",
      },
      {
        id: "k1-5", title: "Scale up and down", type: "command",
        description: "Change the replica count and watch Kubernetes adjust.",
        code: "kubectl scale deployment web-app --replicas=5\nkubectl get pods -l app=web-app\nkubectl scale deployment web-app --replicas=2",
        hint: "You can also edit the YAML: kubectl edit deployment web-app",
      },
      {
        id: "k1-6", title: "Simulate a pod failure", type: "challenge",
        description: "Delete a pod manually. Watch Kubernetes automatically recreate it to maintain desired state.",
        code: "kubectl delete pod -l app=web-app --wait=false\nkubectl get pods -l app=web-app -w",
        expectedOutput: "Pod deleted. New pod created automatically within seconds.",
        explanation: "This is the core value of Kubernetes: self-healing. The ReplicaSet controller detects the deficit and schedules a replacement.",
      },
    ],
  },
  {
    id: "k8s-lab-2",
    title: "ConfigMaps, Secrets, and Environment Variables",
    difficulty: "Intermediate",
    duration: "25 min",
    tools: ["kubectl"],
    objective: "Manage app configuration and secrets without hardcoding values in container images",
    interface: "terminal",
    steps: [
      {
        id: "k2-1", title: "Create a ConfigMap", type: "command",
        description: "Store non-sensitive configuration data in a ConfigMap.",
        code: `kubectl create configmap app-config \\
  --from-literal=LOG_LEVEL=info \\
  --from-literal=MAX_CONNECTIONS=100 \\
  --from-literal=APP_ENV=production

kubectl describe configmap app-config`,
        explanation: "ConfigMaps decouple configuration from container images. Same image, different behavior per environment (dev/staging/prod).",
      },
      {
        id: "k2-2", title: "Create a Secret", type: "command",
        description: "Store sensitive data (passwords, API keys) in Secrets. Secrets are base64-encoded (not encrypted by default — use KMS for encryption at rest).",
        code: `kubectl create secret generic app-secrets \\
  --from-literal=DB_PASSWORD=super-secret-pw \\
  --from-literal=API_KEY=sk-prod-abc123

kubectl get secret app-secrets -o yaml`,
        hint: "The values appear base64-encoded. Decode with: kubectl get secret app-secrets -o jsonpath='{.data.DB_PASSWORD}' | base64 -d",
        explanation: "In production, use external secret managers (AWS Secrets Manager, HashiCorp Vault) and sync to K8s secrets automatically with tools like External Secrets Operator.",
      },
      {
        id: "k2-3", title: "Inject into a Deployment", type: "command",
        description: "Reference the ConfigMap and Secret from a pod's environment variables.",
        language: "bash",
        code: `cat <<EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app-with-config
spec:
  replicas: 1
  selector:
    matchLabels: {app: app-with-config}
  template:
    metadata:
      labels: {app: app-with-config}
    spec:
      containers:
      - name: app
        image: nginx:alpine
        envFrom:
        - configMapRef:
            name: app-config        # All keys become env vars
        - secretRef:
            name: app-secrets       # All keys become env vars
        env:
        - name: POD_NAME            # Downward API: expose pod metadata
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
EOF`,
      },
      {
        id: "k2-4", title: "Verify env vars inside pod", type: "verify",
        description: "Exec into the pod and verify the environment variables are injected.",
        code: "kubectl exec -it deploy/app-with-config -- env | sort | grep -E 'LOG_LEVEL|MAX_CONN|APP_ENV|DB_PASS|API_KEY|POD_NAME'",
        expectedOutput: "API_KEY=sk-prod-abc123\nAPP_ENV=production\nDB_PASSWORD=super-secret-pw\nLOG_LEVEL=info\nMAX_CONNECTIONS=100\nPOD_NAME=app-with-config-xxx",
      },
    ],
  },
  {
    id: "k8s-lab-3",
    title: "Rolling Updates and Rollbacks",
    difficulty: "Intermediate",
    duration: "20 min",
    tools: ["kubectl"],
    objective: "Deploy a new version with zero downtime, then rollback if something goes wrong",
    interface: "terminal",
    steps: [
      {
        id: "k3-1", title: "Deploy v1", type: "command",
        description: "Create a deployment with version 1.0 (simulated with nginx 1.24).",
        code: `kubectl create deployment webapp --image=nginx:1.24-alpine --replicas=4
kubectl rollout status deployment/webapp`,
      },
      {
        id: "k3-2", title: "Update to v2 (rolling)", type: "command",
        description: "Update the image. Kubernetes updates pods in batches (maxUnavailable=1, maxSurge=1 by default).",
        code: `kubectl set image deployment/webapp nginx=nginx:1.25-alpine
kubectl rollout status deployment/webapp --timeout=2m

# Watch the rolling update in real time
kubectl get pods -l app=webapp -w`,
        expectedOutput: "Waiting for deployment \"webapp\" rollout to finish: 1 out of 4 new replicas have been updated...\ndeployment \"webapp\" successfully rolled out",
        explanation: "Rolling update maintains availability. At no point is the service down. Old pods are terminated only after new ones pass readiness checks.",
      },
      {
        id: "k3-3", title: "Check rollout history", type: "command",
        description: "View the history of deployments. Each change creates a new revision.",
        code: "kubectl rollout history deployment/webapp\nkubectl rollout history deployment/webapp --revision=2",
      },
      {
        id: "k3-4", title: "Rollback to previous version", type: "command",
        description: "Something went wrong! Roll back to the previous known-good version instantly.",
        code: "kubectl rollout undo deployment/webapp\nkubectl rollout status deployment/webapp\nkubectl describe deployment/webapp | grep Image",
        expectedOutput: "deployment.apps/webapp rolled back",
        explanation: "Kubernetes keeps the previous ReplicaSet. Rollback just scales old RS up and new RS down. It's near-instant.",
      },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// TERRAFORM
// ═══════════════════════════════════════════════════════

"terraform": [
  {
    id: "tf-lab-1",
    title: "Your First Terraform Configuration",
    difficulty: "Beginner",
    duration: "20 min",
    tools: ["terraform"],
    objective: "Write HCL config, run init/plan/apply, understand state, destroy resources",
    interface: "terminal",
    steps: [
      {
        id: "tf1-1", title: "Create main.tf", type: "code",
        description: "Write a Terraform config that creates a local file (no cloud credentials needed).",
        language: "hcl",
        code: `# main.tf
terraform {
  required_version = ">= 1.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# Input variables
variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "development"
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "myapp"
}

# Resource: create a local file
resource "local_file" "app_config" {
  filename = "\${path.module}/\${var.app_name}-config.json"
  content  = jsonencode({
    environment = var.environment
    app_name    = var.app_name
    created_at  = timestamp()
    features = {
      logging   = true
      metrics   = true
      tracing   = var.environment == "production"
    }
  })
}

# Output values
output "config_file_path" {
  value = local_file.app_config.filename
}

output "config_content" {
  value = local_file.app_config.content
}`,
        explanation: "Every Terraform config has: provider (cloud API), resources (things to create), variables (inputs), and outputs (values to expose).",
      },
      {
        id: "tf1-2", title: "Initialize Terraform", type: "command",
        description: "Download providers and set up the working directory.",
        code: "terraform init",
        expectedOutput: "Initializing provider plugins...\n- Installing hashicorp/local v2.4.x...\nTerraform has been successfully initialized!",
        explanation: "init downloads provider plugins (like npm install). Creates .terraform/ directory and .terraform.lock.hcl to pin versions.",
      },
      {
        id: "tf1-3", title: "Preview changes with plan", type: "command",
        description: "See exactly what Terraform will create/modify/destroy BEFORE making any changes.",
        code: "terraform plan",
        expectedOutput: "Plan: 1 to add, 0 to change, 0 to destroy.\n\n+ resource \"local_file\" \"app_config\" {",
        hint: "terraform plan -out=tfplan saves the plan. Use terraform apply tfplan to apply exactly that plan (important in CI/CD).",
        explanation: "Plan shows a diff of current state vs desired state. Green + = create, Yellow ~ = modify, Red - = destroy. Review before every apply.",
      },
      {
        id: "tf1-4", title: "Apply to create resources", type: "command",
        description: "Actually create the resources. Terraform will ask for confirmation.",
        code: "terraform apply\n# Type 'yes' when prompted\nterraform show",
        expectedOutput: "Apply complete! Resources: 1 added, 0 changed, 0 destroyed.",
        explanation: "Terraform writes resource state to terraform.tfstate. This tracks what it created so it can update/destroy it later.",
      },
      {
        id: "tf1-5", title: "Modify and re-apply", type: "command",
        description: "Change the environment variable and apply. Terraform calculates the diff.",
        code: "terraform apply -var='environment=production'\nterraform show",
        explanation: "Terraform detects that the file content changed and updates only that file. It doesn't recreate everything — just what changed.",
      },
      {
        id: "tf1-6", title: "Destroy all resources", type: "command",
        description: "Clean up everything Terraform created.",
        code: "terraform destroy\n# Type 'yes'\nterraform show",
        expectedOutput: "Destroy complete! Resources: 1 destroyed.",
        explanation: "Destroy removes resources in reverse dependency order. Always verify what will be destroyed in the plan output.",
      },
    ],
  },
  {
    id: "tf-lab-2",
    title: "Modules and Remote State",
    difficulty: "Intermediate",
    duration: "30 min",
    tools: ["terraform"],
    objective: "Create a reusable Terraform module and configure remote state storage",
    interface: "terminal",
    steps: [
      {
        id: "tf2-1", title: "Create a module structure", type: "command",
        description: "Organize code into reusable modules — like functions in programming.",
        code: `mkdir -p modules/app-config
cat > modules/app-config/main.tf << 'EOF'
variable "app_name" { type = string }
variable "environment" { type = string }
variable "port" { type = number; default = 8080 }

resource "local_file" "config" {
  filename = "\${path.module}/output/\${var.app_name}.json"
  content  = jsonencode({
    name = var.app_name
    env  = var.environment
    port = var.port
  })
}

output "config_path" { value = local_file.config.filename }
EOF`,
        explanation: "A module = a directory of .tf files. Accepts input variables, creates resources, exposes outputs. Call it multiple times with different inputs.",
      },
      {
        id: "tf2-2", title: "Call the module", type: "code",
        description: "Use the module to create multiple app configs without code duplication.",
        language: "hcl",
        code: `# main.tf — calls the module multiple times
module "api_service" {
  source      = "./modules/app-config"
  app_name    = "api-service"
  environment = "production"
  port        = 3000
}

module "auth_service" {
  source      = "./modules/app-config"
  app_name    = "auth-service"
  environment = "production"
  port        = 3001
}

module "worker" {
  source      = "./modules/app-config"
  app_name    = "background-worker"
  environment = "production"
  port        = 9000
}

output "all_configs" {
  value = {
    api    = module.api_service.config_path
    auth   = module.auth_service.config_path
    worker = module.worker.config_path
  }
}`,
        hint: "After adding modules, always run terraform init again — it installs module dependencies.",
      },
      {
        id: "tf2-3", title: "Configure remote state (S3)", type: "code",
        description: "Store state remotely so teams can collaborate and state is never lost.",
        language: "hcl",
        code: `# backend.tf
terraform {
  backend "s3" {
    bucket         = "mycompany-terraform-state"
    key            = "production/app/terraform.tfstate"
    region         = "ap-south-1"
    
    # State locking (prevents concurrent modifications)
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    
    # Use IAM role (no hardcoded credentials)
  }
}`,
        explanation: "Remote state enables team collaboration, provides backup, and enables state locking (only one person can apply at a time via DynamoDB). Never commit .tfstate to git.",
      },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// LINUX
// ═══════════════════════════════════════════════════════

"linux": [
  {
    id: "linux-lab-1",
    title: "Linux Navigation and File Management",
    difficulty: "Beginner",
    duration: "20 min",
    tools: ["bash"],
    objective: "Master essential Linux commands for navigating, creating, moving, and searching files",
    interface: "terminal",
    steps: [
      {
        id: "l1-1", title: "Navigate the filesystem", type: "command",
        description: "Learn the essential navigation commands every Linux user needs.",
        code: `pwd                    # Where am I?
ls -la                 # List with details and hidden files
ls -lh /var/log        # Human-readable sizes
cd /tmp && pwd         # Change directory
cd ~                   # Go home
cd -                   # Go to previous directory
tree /etc -L 2 2>/dev/null || ls -R /etc | head -20`,
        explanation: "pwd = print working directory. The filesystem tree starts at / (root). Home directory is ~, which expands to /home/username or /root for root user.",
      },
      {
        id: "l1-2", title: "Create and manage files", type: "command",
        description: "Create directories, files, copy, move, and delete them.",
        code: `mkdir -p projects/myapp/src      # Create nested dirs
touch projects/myapp/src/app.py  # Create empty file
echo "print('Hello')" > projects/myapp/src/app.py  # Write to file
echo "# Version 1.0" >> projects/myapp/README.md   # Append to file
cat projects/myapp/src/app.py    # Read file
cp -r projects/myapp projects/myapp-backup  # Recursive copy
mv projects/myapp-backup projects/myapp-old # Move/rename
rm -rf projects/myapp-old        # Delete (be careful!)`,
        hint: "rm -rf is permanent — there's no Recycle Bin on Linux. Always double-check the path.",
      },
      {
        id: "l1-3", title: "Find and search", type: "command",
        description: "Find files by name, search content with grep, and combine with pipes.",
        code: `# Find files
find /etc -name "*.conf" -type f 2>/dev/null | head -10
find /home -name "*.py" -newer /etc/passwd
find /var/log -size +10M -type f

# Search content with grep
grep -r "error" /var/log/syslog 2>/dev/null | tail -5
grep -n "import" projects/myapp/src/app.py
grep -i "server" /etc/hosts           # Case-insensitive

# Pipes: combine commands
ls -la | grep "^d"                    # Only directories
cat /etc/passwd | awk -F: '{print $1}' | sort  # Extract usernames
ps aux | grep python | grep -v grep`,
        explanation: "The pipe | sends stdout of one command to stdin of the next. This is the Unix philosophy: small tools that do one thing well, combined to do complex things.",
      },
      {
        id: "l1-4", title: "Permissions deep dive", type: "command",
        description: "Understand and change file permissions — critical for security.",
        code: `# Read permission string: -rwxr-xr-x
# Position: [type][owner][group][others]
# r=4 w=2 x=1
ls -la /usr/bin/passwd

# chmod: change permissions
mkdir /tmp/permtest && touch /tmp/permtest/file.txt
chmod 755 /tmp/permtest          # rwxr-xr-x
chmod 644 /tmp/permtest/file.txt # rw-r--r--
chmod u+x /tmp/permtest/file.txt # Add execute for owner
chmod go-w /tmp/permtest         # Remove write for group+others

# chown: change ownership
ls -la /tmp/permtest

# Special permissions
chmod +s /tmp/permtest/file.txt  # Set SUID bit
stat /tmp/permtest/file.txt`,
        explanation: "755: owner can do anything (7=rwx), group and others can read+execute (5=r-x). 644 for files: owner read+write, others read-only. Never 777 in production.",
      },
    ],
  },
  {
    id: "linux-lab-2",
    title: "Process Management and System Monitoring",
    difficulty: "Intermediate",
    duration: "25 min",
    tools: ["bash", "systemctl", "ps", "top"],
    objective: "Monitor running processes, manage system services, and diagnose performance issues",
    interface: "terminal",
    steps: [
      {
        id: "l2-1", title: "Monitor processes", type: "command",
        description: "Find what's running, what's consuming resources, and how to control processes.",
        code: `# Process snapshot
ps aux | sort -rk 3 | head -10   # Top CPU consumers
ps aux | sort -rk 4 | head -10   # Top memory consumers
ps -ef | grep nginx               # Find specific process

# Real-time monitoring
top -b -n 1 -o %CPU | head -20   # top non-interactive mode
# In interactive top: P=sort by CPU, M=memory, k=kill, q=quit

# Process tree
pstree -p | head -30 2>/dev/null || ps --forest aux | head -20

# Find process by port
ss -tlnp | grep :80
lsof -i :80 2>/dev/null || ss -tlnp sport = :80`,
      },
      {
        id: "l2-2", title: "Systemd service management", type: "command",
        description: "Control system services — start, stop, enable at boot, check logs.",
        code: `systemctl status nginx     # Check service status
systemctl start nginx      # Start
systemctl stop nginx       # Stop
systemctl restart nginx    # Stop then start
systemctl reload nginx     # Reload config without stopping
systemctl enable nginx     # Start automatically on boot
systemctl disable nginx    # Don't start on boot

# View logs for a service
journalctl -u nginx -n 50  # Last 50 lines
journalctl -u nginx -f     # Follow logs
journalctl -u nginx --since "1 hour ago"
journalctl -p err -n 20    # Only errors`,
        explanation: "systemd is the init system on modern Linux. It manages the lifecycle of all system services. journald collects all logs — both from systemd services and the kernel.",
      },
      {
        id: "l2-3", title: "Resource monitoring", type: "command",
        description: "Check CPU, memory, disk, and network in real-time.",
        code: `# Memory
free -h
cat /proc/meminfo | grep -E "MemTotal|MemFree|MemAvailable|Cached"

# CPU
uptime                     # Load averages: 1m, 5m, 15m
nproc                      # Number of CPUs
cat /proc/loadavg          # Raw load average
mpstat 1 3 2>/dev/null || vmstat 1 3  # CPU stats

# Disk
df -h                      # Disk space by filesystem
du -sh /var/log/*          # Directory sizes
iostat -x 1 3 2>/dev/null  # Disk I/O

# Network
ip -s link show            # Interface statistics
ss -s                      # Socket statistics summary`,
        hint: "Load average > number of CPUs means the system is overloaded. 0.5 on a 4-core machine = 12.5% utilization. 4.0 on 4-core = 100%.",
      },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// GIT
// ═══════════════════════════════════════════════════════

"git": [
  {
    id: "git-lab-1",
    title: "Git Fundamentals: Track Your Code",
    difficulty: "Beginner",
    duration: "20 min",
    tools: ["git"],
    objective: "Initialize a repo, make commits, create branches, and understand Git's object model",
    interface: "terminal",
    steps: [
      {
        id: "g1-1", title: "Configure Git", type: "command",
        description: "Set your identity. Git records who made each commit.",
        code: `git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --list`,
      },
      {
        id: "g1-2", title: "Initialize and first commit", type: "command",
        description: "Create a new repository and make your first commit.",
        code: `mkdir my-project && cd my-project
git init
echo "# My Project" > README.md
echo "node_modules/" > .gitignore
git status                    # See untracked files
git add README.md .gitignore  # Stage specific files
git add .                     # Stage everything
git status                    # See staged files (green)
git commit -m "Initial commit: add README and .gitignore"
git log --oneline`,
        explanation: "Git's staging area (index) is a buffer between working directory and repository. Stage exactly what you want in the next commit — partial commits are fine.",
      },
      {
        id: "g1-3", title: "Create and merge branches", type: "command",
        description: "Branches let you work on features without affecting main code.",
        code: `git branch feature/login     # Create branch
git checkout feature/login   # Switch to it
# Or: git checkout -b feature/login (create + switch)

echo "function login() {}" > login.js
git add login.js
git commit -m "feat: add login function"

echo "function validate() {}" >> login.js
git add login.js
git commit -m "feat: add input validation"

git log --oneline main..feature/login  # Commits not in main

git checkout main
git merge feature/login      # Merge feature into main
git log --oneline --graph`,
        explanation: "git merge feature/login creates a merge commit. Use git rebase for linear history (advanced). git log --graph shows the branch structure visually.",
      },
      {
        id: "g1-4", title: "Undo mistakes", type: "command",
        description: "The most important skill: how to recover from mistakes.",
        code: `# Amend last commit (fix message or add forgotten file)
echo "extra.txt" >> .gitignore
git add .gitignore
git commit --amend -m "Initial commit: add README, .gitignore, and extra"

# Unstage a file (undo git add)
git add accidental-file.txt  # Oops
git restore --staged accidental-file.txt  # Unstage

# Discard local changes (DESTRUCTIVE - can't undo)
echo "broken code" > README.md
git restore README.md  # Restore to last committed state

# Show what changed
git diff                  # Unstaged changes
git diff --staged         # Staged changes`,
        hint: "Never force-push to main branch in a team. git push --force rewrites history and overwrites teammates' work.",
      },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// ANSIBLE
// ═══════════════════════════════════════════════════════

"ansible": [
  {
    id: "ansible-lab-1",
    title: "Your First Ansible Playbook",
    difficulty: "Beginner",
    duration: "25 min",
    tools: ["ansible"],
    objective: "Write inventory, create a playbook, run it against localhost",
    interface: "terminal",
    steps: [
      {
        id: "a1-1", title: "Install and verify Ansible", type: "command",
        description: "Install Ansible and run the first module — ping.",
        code: `ansible --version
# Install if needed: pip install ansible

# Test connection to localhost
ansible localhost -m ping
ansible localhost -m command -a "uname -a"
ansible localhost -m setup -a "filter=ansible_distribution*"`,
        expectedOutput: "localhost | SUCCESS => {\n  \"ping\": \"pong\"\n}",
      },
      {
        id: "a1-2", title: "Create inventory file", type: "code",
        description: "Inventory defines which hosts to manage and how to group them.",
        language: "ini",
        code: `# inventory.ini
[webservers]
web1 ansible_host=192.168.1.10 ansible_user=ubuntu
web2 ansible_host=192.168.1.11 ansible_user=ubuntu

[databases]
db1 ansible_host=192.168.1.20 ansible_user=ubuntu ansible_port=22

[production:children]   # Group of groups
webservers
databases

[all:vars]              # Variables for all hosts
ansible_ssh_private_key_file=~/.ssh/prod.pem
ansible_python_interpreter=/usr/bin/python3`,
        explanation: "Inventory is the foundation of Ansible. Define static hosts in INI/YAML, or use dynamic inventory plugins for cloud providers (AWS EC2, GCP, Azure).",
      },
      {
        id: "a1-3", title: "Write a playbook", type: "code",
        description: "A playbook is a list of plays, each targeting hosts and running tasks.",
        language: "yaml",
        code: `# setup-webserver.yml
---
- name: Configure web servers
  hosts: localhost          # Use 'webservers' in production
  become: true              # sudo
  gather_facts: true        # Collect system info (OS, IP, etc.)
  
  vars:
    app_port: 8080
    app_user: webuser
    packages:
      - nginx
      - curl
      - git

  tasks:
    - name: Update package cache
      apt:
        update_cache: true
        cache_valid_time: 3600   # Skip if cache is < 1hr old
      when: ansible_os_family == "Debian"

    - name: Install required packages
      apt:
        name: "{{ packages }}"
        state: present

    - name: Create app user
      user:
        name: "{{ app_user }}"
        shell: /bin/bash
        create_home: true
        state: present

    - name: Create app directory
      file:
        path: /var/www/myapp
        owner: "{{ app_user }}"
        group: "{{ app_user }}"
        mode: '0755'
        state: directory

    - name: Deploy nginx config
      template:
        src: templates/nginx.conf.j2
        dest: /etc/nginx/sites-available/myapp
        mode: '0644'
      notify: Restart nginx      # Handler runs after all tasks

    - name: Enable nginx site
      file:
        src: /etc/nginx/sites-available/myapp
        dest: /etc/nginx/sites-enabled/myapp
        state: link

  handlers:
    - name: Restart nginx
      service:
        name: nginx
        state: restarted`,
        explanation: "Tasks are idempotent — running the playbook twice has the same result as once. Ansible checks state before acting: 'ensure this file exists' not 'create this file'.",
      },
      {
        id: "a1-4", title: "Run the playbook", type: "command",
        description: "Execute the playbook with dry-run first, then for real.",
        code: `# Dry run — check what WOULD change
ansible-playbook -i inventory.ini setup-webserver.yml --check --diff

# Run for real (against localhost for practice)
ansible-playbook -i inventory.ini setup-webserver.yml -l localhost

# Verbose output for debugging
ansible-playbook -i inventory.ini setup-webserver.yml -v    # -vvv for max verbosity`,
        expectedOutput: "PLAY RECAP\nlocalhost: ok=6 changed=3 unreachable=0 failed=0",
      },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// PYTHON (DevOps)
// ═══════════════════════════════════════════════════════

"python": [
  {
    id: "py-lab-1",
    title: "Automate File Operations with Python",
    difficulty: "Beginner",
    duration: "20 min",
    tools: ["python3"],
    objective: "Use Python's standard library to automate file tasks every DevOps engineer needs",
    interface: "code-editor",
    steps: [
      {
        id: "py1-1", title: "Read and parse config files", type: "code",
        description: "Parse JSON, YAML, and environment files — the configs you deal with daily.",
        language: "python",
        code: `import json
import os

# Parse JSON config
config_json = '''
{
  "database": {
    "host": "db.prod.internal",
    "port": 5432,
    "name": "appdb",
    "pool_size": 10
  },
  "redis": {
    "host": "cache.prod.internal",
    "port": 6379
  },
  "features": ["logging", "metrics", "tracing"]
}
'''

config = json.loads(config_json)
print(f"DB host: {config['database']['host']}")
print(f"DB port: {config['database']['port']}")
print(f"Features: {', '.join(config['features'])}")

# Safely get nested values with defaults
timeout = config.get('database', {}).get('timeout', 30)
print(f"Timeout (default): {timeout}s")

# Environment variables (best for secrets)
db_password = os.environ.get('DB_PASSWORD', 'not-set')
print(f"DB password from env: {db_password}")

# Write a config file
output = {
    "generated_at": "2024-01-15",
    "environment": os.environ.get('APP_ENV', 'development'),
    **config
}
with open('/tmp/app-config.json', 'w') as f:
    json.dump(output, f, indent=2)
print("\\nConfig written to /tmp/app-config.json")`,
      },
      {
        id: "py1-2", title: "File and directory operations", type: "code",
        description: "Create, find, copy, and organize files programmatically.",
        language: "python",
        code: `import os
import shutil
from pathlib import Path  # Modern, readable path handling
from datetime import datetime

# pathlib is the modern way (Python 3.4+)
base = Path('/tmp/myapp')
logs_dir = base / 'logs'
backup_dir = base / 'backup'

# Create directories
logs_dir.mkdir(parents=True, exist_ok=True)
backup_dir.mkdir(parents=True, exist_ok=True)

# Create some log files
for i in range(5):
    log_file = logs_dir / f"app-2024-01-{i+1:02d}.log"
    log_file.write_text(f"Log entries for day {i+1}\\nERROR: Sample error\\nINFO: Normal operation\\n" * 100)

# Find files matching a pattern
print("Log files found:")
for f in sorted(logs_dir.glob("*.log")):
    size_kb = f.stat().st_size / 1024
    print(f"  {f.name}: {size_kb:.1f} KB")

# Find large files (> 5KB)
large_files = [f for f in logs_dir.glob("*") if f.stat().st_size > 5000]
print(f"\\nFiles > 5KB: {len(large_files)}")

# Rotate logs: backup files older than 3 days
cutoff = datetime(2024, 1, 3)
for f in logs_dir.glob("*.log"):
    # Parse date from filename
    date_str = f.stem.split('-', 1)[1]  # "2024-01-03"
    try:
        file_date = datetime.strptime(date_str, "%Y-%m-%d")
        if file_date < cutoff:
            dest = backup_dir / f.name
            shutil.move(str(f), str(dest))
            print(f"Rotated: {f.name} → backup/")
    except ValueError:
        pass

print(f"\\nCurrent logs: {len(list(logs_dir.glob('*.log')))}")
print(f"Archived logs: {len(list(backup_dir.glob('*.log')))}")`,
      },
      {
        id: "py1-3", title: "Run system commands from Python", type: "code",
        description: "Execute shell commands, capture output, and handle errors.",
        language: "python",
        code: `import subprocess
import sys

def run(cmd: str, check=True) -> subprocess.CompletedProcess:
    """Run a shell command and return result."""
    print(f"\\n$ {cmd}")
    result = subprocess.run(
        cmd, shell=True, capture_output=True, text=True, timeout=30
    )
    if result.stdout: print(result.stdout.rstrip())
    if result.stderr and result.returncode != 0:
        print(f"STDERR: {result.stderr.rstrip()}", file=sys.stderr)
    if check and result.returncode != 0:
        raise RuntimeError(f"Command failed (exit {result.returncode}): {cmd}")
    return result

# Basic commands
run("echo 'System info:'")
run("uname -a")
run("df -h /")
run("free -h")

# Capture output for processing
result = run("ps aux --no-headers", check=False)
processes = result.stdout.strip().split('\\n')
print(f"\\nTotal processes: {len(processes)}")

# Handle command failure gracefully
result = run("ls /nonexistent-path", check=False)
print(f"Exit code: {result.returncode}")
print(f"Error: {result.stderr.strip()}")

# Environment variables
import os
env = {**os.environ, 'MY_VAR': 'hello', 'DEBUG': '1'}
result = subprocess.run("echo $MY_VAR $DEBUG", shell=True, env=env, capture_output=True, text=True)
print(f"\\nEnv vars: {result.stdout.strip()}")`,
      },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// POSTGRESQL
// ═══════════════════════════════════════════════════════

"shell-scripting": [
  {
    id: "sh-lab-1",
    title: "Write Production-Grade Bash Scripts",
    difficulty: "Intermediate",
    duration: "30 min",
    tools: ["bash", "shellcheck"],
    objective: "Write safe, robust bash scripts with proper error handling and logging",
    interface: "terminal",
    steps: [
      {
        id: "sh1-1", title: "Script safety flags", type: "code",
        description: "Every production script should start with these safety flags.",
        language: "bash",
        code: `#!/usr/bin/env bash
# Always start with these
set -euo pipefail

# Explanation:
# -e: Exit immediately on any error (ERR)
# -u: Treat unset variables as errors
# -o pipefail: Catch errors in pipes (ls /bad | grep x — would fail silently without this)

# Good practice: redirect errors and use logging
readonly LOG_FILE="/tmp/myscript.log"
readonly SCRIPT_NAME="$(basename "$0")"

log()  { echo "[$(date '+%H:%M:%S')] INFO  $*" | tee -a "$LOG_FILE"; }
warn() { echo "[$(date '+%H:%M:%S')] WARN  $*" | tee -a "$LOG_FILE" >&2; }
die()  { echo "[$(date '+%H:%M:%S')] ERROR $*" | tee -a "$LOG_FILE" >&2; exit 1; }

# Clean up on exit
cleanup() {
    local exit_code=$?
    rm -f /tmp/tempfile.$$   # Remove temp files
    if [[ $exit_code -ne 0 ]]; then
        warn "Script exited with code $exit_code"
    fi
}
trap cleanup EXIT

log "Script started"
echo "Run this with: bash myscript.sh"`,
        explanation: "set -euo pipefail is the minimal safety net. Without -e, a failing command is silently ignored. Without -u, $UNSET_VAR expands to empty string — hard to debug. Logging to stderr (>&2) keeps stdout clean for piping.",
      },
      {
        id: "sh1-2", title: "Functions and argument parsing", type: "code",
        description: "Write reusable functions and parse command-line arguments.",
        language: "bash",
        code: `#!/usr/bin/env bash
set -euo pipefail

# Function: check_command ensures a command exists
check_command() {
    command -v "$1" &>/dev/null || die "Required command not found: $1"
}

# Function: confirm prompts user unless --yes flag passed
confirm() {
    local message="$1"
    if [[ "\${FORCE:-false}" == "true" ]]; then return 0; fi
    read -r -p "$message [y/N]: " response
    [[ "$response" =~ ^[Yy]$ ]]
}

# Default values
ENVIRONMENT="staging"
DRY_RUN=false
VERBOSE=false

# Parse arguments
usage() {
    cat <<EOF
Usage: $0 [OPTIONS] <service>
Options:
  -e, --env ENV     Environment (dev/staging/prod) [default: staging]
  -d, --dry-run     Preview changes without executing
  -v, --verbose     Enable verbose output
  -h, --help        Show this help
EOF
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        -e|--env)     ENVIRONMENT="$2"; shift 2 ;;
        -d|--dry-run) DRY_RUN=true; shift ;;
        -v|--verbose) VERBOSE=true; shift ;;
        -h|--help)    usage; exit 0 ;;
        --)           shift; break ;;
        -*)           die "Unknown flag: $1" ;;
        *)            break ;;
    esac
done

# Remaining args
SERVICE="\${1:-}"
[[ -z "$SERVICE" ]] && { usage; die "SERVICE argument required"; }

echo "Deploying $SERVICE to $ENVIRONMENT (dry-run: $DRY_RUN)"`,
      },
      {
        id: "sh1-3", title: "Loops, arrays, and string manipulation", type: "code",
        description: "Essential bash patterns for automation scripts.",
        language: "bash",
        code: `#!/usr/bin/env bash
set -euo pipefail

# Arrays
servers=("web1.example.com" "web2.example.com" "web3.example.com")
echo "Servers: \${#servers[@]}"   # Array length

# Loop over array
for server in "\${servers[@]}"; do
    echo "Deploying to $server..."
done

# Associative array (bash 4+)
declare -A config
config["db_host"]="db.internal"
config["db_port"]="5432"
config["app_port"]="8080"

for key in "\${!config[@]}"; do
    echo "$key = \${config[$key]}"
done

# String manipulation
url="https://api.example.com/v1/users?page=2"
echo "Full URL: $url"
echo "Protocol: \${url%%://*}"          # https
echo "Domain:   \${url#*://}"           # api.example.com/...
echo "Path:     \${url##*\.com}"        # /v1/users?page=2
echo "Lowercase: \${url,,}"             # bash 4+

# Process substitution: loop over command output
while IFS= read -r line; do
    echo "Processing: $line"
done < <(ls /tmp/*.sh 2>/dev/null || echo "no files")

# Arithmetic
count=0
for i in {1..5}; do
    ((count += i))
done
echo "Sum 1-5: $count"  # 15`,
      },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// PROMETHEUS
// ═══════════════════════════════════════════════════════

"prometheus": [
  {
    id: "prom-lab-1",
    title: "PromQL: Query Your Metrics",
    difficulty: "Intermediate",
    duration: "25 min",
    tools: ["prometheus", "promql"],
    objective: "Write PromQL queries to analyze metrics — error rates, latency, and resource usage",
    interface: "terminal",
    steps: [
      {
        id: "prom1-1", title: "PromQL basics", type: "code",
        description: "PromQL uses selectors to filter metrics and functions to process them.",
        language: "promql",
        code: `# ── INSTANT VECTORS: current snapshot ────────────────────
# All metrics with this name
http_requests_total

# Filter by label
http_requests_total{job="api-server"}
http_requests_total{status="500"}
http_requests_total{status=~"5.."}   # Regex match: all 5xx errors
http_requests_total{status!~"2.."}   # Not 2xx

# ── RANGE VECTORS: window of time ─────────────────────────
# Used inside functions like rate()
http_requests_total[5m]              # Last 5 minutes of data

# ── RATE: per-second rate over a time window ──────────────
rate(http_requests_total[5m])        # Requests per second (smooth)
irate(http_requests_total[5m])       # Instantaneous rate (spiky)

# Calculate error rate (errors / total)
rate(http_requests_total{status=~"5.."}[5m])
/
rate(http_requests_total[5m])

# ── AGGREGATION: collapse labels ──────────────────────────
sum(rate(http_requests_total[5m]))                    # Total RPS
sum by (status) (rate(http_requests_total[5m]))       # RPS per status
sum without (instance) (rate(http_requests_total[5m])) # Merge instances`,
        explanation: "rate() calculates per-second increase over a window. Always use rate() on counters (always-increasing metrics). Use delta() or deriv() for gauges.",
      },
      {
        id: "prom1-2", title: "SLO-style queries", type: "code",
        description: "Production alerting queries — error budget, latency percentiles.",
        language: "promql",
        code: `# ── ERROR RATE (key SLO metric) ───────────────────────────
# 5-minute error rate as a percentage
(
  sum(rate(http_requests_total{status=~"5.."}[5m]))
  /
  sum(rate(http_requests_total[5m]))
) * 100

# SLO check: is error rate below 1%?
(
  sum(rate(http_requests_total{status=~"5.."}[5m]))
  /
  sum(rate(http_requests_total[5m]))
) < 0.01

# ── LATENCY PERCENTILES (histogram) ───────────────────────
# P99 latency across all requests
histogram_quantile(0.99, 
  sum by (le) (rate(http_request_duration_seconds_bucket[5m]))
)

# P99 per service
histogram_quantile(0.99,
  sum by (service, le) (rate(http_request_duration_seconds_bucket[5m]))
)

# ── KUBERNETES RESOURCE USAGE ─────────────────────────────
# CPU usage per namespace (cores)
sum by (namespace) (
  rate(container_cpu_usage_seconds_total{container!=""}[5m])
)

# Memory usage per pod (MiB)
container_memory_working_set_bytes{container!=""}
/ 1048576

# ── AVAILABILITY (Uptime) ─────────────────────────────────
# Fraction of time service was up over 24h
avg_over_time(up{job="api-server"}[24h])`,
        explanation: "histogram_quantile() computes percentiles from histogram buckets. The 0.99 means 99th percentile — 99% of requests are faster than this. Always monitor P99, not just averages.",
      },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// DEVOPS - HELM
// ═══════════════════════════════════════════════════════

"helm": [
  {
    id: "helm-lab-1",
    title: "Deploy Your First Helm Chart",
    difficulty: "Beginner",
    duration: "25 min",
    tools: ["helm", "kubectl"],
    objective: "Install Helm, deploy a chart, customize values, upgrade and rollback",
    interface: "terminal",
    steps: [
      { id: "h1-1", title: "Install and verify Helm", type: "command",
        description: "Helm is the package manager for Kubernetes — like apt/npm but for K8s apps.",
        code: `helm version
helm repo add stable https://charts.helm.sh/stable
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm repo list`,
        explanation: "Helm repos are like package registries. Bitnami provides production-grade charts for 100+ applications. Charts are versioned packages containing K8s YAML templates." },
      { id: "h1-2", title: "Search and inspect a chart", type: "command",
        description: "Find a chart and understand what it will install before deploying.",
        code: `helm search repo nginx
helm show chart bitnami/nginx
helm show values bitnami/nginx | head -50`,
        explanation: "helm show values reveals all configurable options. Always review values before installing — understand what you're deploying." },
      { id: "h1-3", title: "Install nginx with custom values", type: "command",
        description: "Deploy nginx with custom configuration via --set or a values file.",
        code: `# Install with overrides
helm install my-nginx bitnami/nginx \
  --set replicaCount=2 \
  --set service.type=ClusterIP \
  --namespace web --create-namespace

helm list -n web
helm status my-nginx -n web`,
        expectedOutput: "NAME       NAMESPACE  STATUS    CHART          APP VERSION\nmy-nginx   web        deployed  nginx-15.x.x   1.25.x",
        explanation: "--set overrides specific values. For multiple changes, use a values.yaml file: helm install my-nginx bitnami/nginx -f custom-values.yaml" },
      { id: "h1-4", title: "Upgrade with new values", type: "command",
        description: "Scale up and change config with helm upgrade — zero-downtime.",
        code: `helm upgrade my-nginx bitnami/nginx \
  --set replicaCount=3 \
  --set service.type=NodePort \
  --namespace web

helm history my-nginx -n web`,
        explanation: "helm upgrade reuses existing values unless overridden. Add --reuse-values to keep all previous custom values and only change what you specify." },
      { id: "h1-5", title: "Rollback to previous version", type: "command",
        description: "Something went wrong? Roll back to any previous revision instantly.",
        code: `helm rollback my-nginx 1 --namespace web
helm status my-nginx -n web
helm history my-nginx -n web`,
        explanation: "Helm stores complete history of each release. Rollback is instant — Helm just re-applies the previous rendered manifests." },
    ],
  },
  {
    id: "helm-lab-2",
    title: "Create Your Own Helm Chart",
    difficulty: "Intermediate",
    duration: "35 min",
    tools: ["helm"],
    objective: "Scaffold a chart, write templates with conditionals, test with --dry-run",
    interface: "terminal",
    steps: [
      { id: "h2-1", title: "Scaffold a new chart", type: "command",
        description: "helm create generates a complete chart structure you can customize.",
        code: `helm create myapp
tree myapp/`,
        expectedOutput: "myapp/\n├── Chart.yaml        # Chart metadata\n├── values.yaml       # Default values\n├── templates/\n│   ├── deployment.yaml\n│   ├── service.yaml\n│   ├── ingress.yaml\n│   └── _helpers.tpl  # Template helpers\n└── charts/           # Sub-charts (dependencies)" },
      { id: "h2-2", title: "Customize Chart.yaml", type: "code",
        description: "Chart.yaml defines the chart's identity and dependencies.",
        language: "yaml",
        code: `# myapp/Chart.yaml
apiVersion: v2
name: myapp
description: My production web application
type: application
version: 1.0.0          # Chart version (bump when chart changes)
appVersion: "2.1.0"     # App version being packaged

dependencies:
  - name: redis
    version: "18.x.x"
    repository: https://charts.bitnami.com/bitnami
    condition: redis.enabled   # Only install if redis.enabled=true` },
      { id: "h2-3", title: "Write a deployment template", type: "code",
        description: "Templates use Go templating. Values from values.yaml are accessible via .Values.",
        language: "yaml",
        code: `# myapp/templates/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "myapp.fullname" . }}
  labels:
    {{- include "myapp.labels" . | nindent 4 }}
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels:
      {{- include "myapp.selectorLabels" . | nindent 6 }}
  template:
    metadata:
      labels:
        {{- include "myapp.selectorLabels" . | nindent 8 }}
    spec:
      containers:
      - name: {{ .Chart.Name }}
        image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
        ports:
        - containerPort: {{ .Values.service.port }}
        {{- if .Values.resources }}
        resources:
          {{- toYaml .Values.resources | nindent 10 }}
        {{- end }}
        {{- if .Values.env }}
        env:
          {{- range .Values.env }}
          - name: {{ .name }}
            value: {{ .value | quote }}
          {{- end }}
        {{- end }}` },
      { id: "h2-4", title: "Test with --dry-run", type: "command",
        description: "Preview rendered YAML before actually deploying to the cluster.",
        code: `# Dry run: render templates and validate but don't apply
helm install myapp-test ./myapp --dry-run --debug

# Lint the chart for errors
helm lint ./myapp

# Template: just render without installing
helm template myapp-test ./myapp | head -60`,
        explanation: "--dry-run sends templates to the API server for validation. --debug shows rendered templates. helm lint catches common mistakes. Always do this before real install." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// DEVOPS - JENKINS
// ═══════════════════════════════════════════════════════

"jenkins": [
  {
    id: "jenkins-lab-1",
    title: "Build a CI Pipeline with Jenkins",
    difficulty: "Intermediate",
    duration: "30 min",
    tools: ["jenkins", "docker"],
    objective: "Create a Jenkinsfile pipeline that builds, tests, and pushes a Docker image",
    interface: "terminal",
    steps: [
      { id: "j1-1", title: "Start Jenkins with Docker", type: "command",
        description: "Run Jenkins locally for practice — the official Docker image includes all tools.",
        code: `docker run -d --name jenkins \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins/jenkins:lts

# Get initial admin password
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword`,
        explanation: "Mounting /var/run/docker.sock lets Jenkins build Docker images inside the container — called Docker-in-Docker (DinD). jenkins_home volume persists config across restarts." },
      { id: "j1-2", title: "Write a Declarative Jenkinsfile", type: "code",
        description: "Jenkinsfile defines your entire pipeline as code — lives in your repo.",
        language: "groovy",
        code: `// Jenkinsfile — place in root of your repository
pipeline {
    agent { docker { image 'node:20-alpine' } }

    environment {
        APP_NAME    = 'myapp'
        DOCKER_CRED = credentials('docker-hub-creds')
        IMAGE_TAG   = "\${env.BUILD_NUMBER}"
    }

    options {
        timeout(time: 30, unit: 'MINUTES')
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'node --version && npm --version'
            }
        }

        stage('Install') {
            steps {
                sh 'npm ci --prefer-offline'   // Faster than npm install
            }
        }

        stage('Test') {
            steps {
                sh 'npm test -- --reporter junit --reporter-options output=results/junit.xml'
            }
            post {
                always {
                    junit 'results/junit.xml'   // Publish test results
                }
            }
        }

        stage('Build Docker Image') {
            when { branch 'main' }   // Only on main branch
            steps {
                script {
                    docker.build("\${APP_NAME}:\${IMAGE_TAG}")
                }
            }
        }

        stage('Push to Registry') {
            when { branch 'main' }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-creds') {
                        docker.image("\${APP_NAME}:\${IMAGE_TAG}").push()
                        docker.image("\${APP_NAME}:\${IMAGE_TAG}").push('latest')
                    }
                }
            }
        }
    }

    post {
        success { echo "Pipeline succeeded — image pushed: \${APP_NAME}:\${IMAGE_TAG}" }
        failure { echo "Pipeline FAILED — check logs above" }
        always  { cleanWs() }
    }
}`,
        explanation: "Declarative pipelines define WHAT to do (stages/steps). Scripted pipelines use Groovy for full flexibility. Use declarative unless you need advanced logic." },
      { id: "j1-3", title: "Configure credentials securely", type: "command",
        description: "Jenkins Credentials store secrets — never hardcode them in Jenkinsfile.",
        code: `# Via Jenkins UI: Manage Jenkins → Credentials → Add Credential
# Types:
# - Username/Password (docker hub, git)
# - Secret text (API keys)
# - SSH private key (server access)
# - Certificate

# In Jenkinsfile, use credentials() binding:
# credentials('docker-hub-creds') → sets DOCKER_CRED_USR and DOCKER_CRED_PSW
# Or use withCredentials block:
# withCredentials([string(credentialsId: 'api-key', variable: 'API_KEY')]) {
#     sh 'curl -H "Authorization: \$API_KEY" https://api.example.com'
# }

# Query jobs via Jenkins CLI
java -jar jenkins-cli.jar -s http://localhost:8080 -auth admin:$(cat password.txt) list-jobs`,
        explanation: "Credentials are encrypted in Jenkins' credential store and only exposed to pipelines that explicitly request them. They never appear in logs (Jenkins masks them)." },
      { id: "j1-4", title: "Trigger builds automatically", type: "code",
        description: "Configure Jenkins to build on every commit using webhooks.",
        language: "groovy",
        code: `// In Jenkinsfile: add triggers block
pipeline {
    triggers {
        // Poll SCM every 5 min (backup for webhooks)
        pollSCM('H/5 * * * *')

        // GitHub webhook: set in GitHub repo settings →
        // Webhooks → http://jenkins:8080/github-webhook/
        // GitLab: http://jenkins:8080/project/job-name

        // Cron: build nightly at 2am
        cron('H 2 * * *')
    }
    // ... rest of pipeline
}`,
        explanation: "Webhooks are instant (GitHub calls Jenkins on push). pollSCM is a fallback when webhooks aren't possible. Cron builds are useful for nightly integration tests or artifact cleanup." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// DEVOPS - ARGOCD
// ═══════════════════════════════════════════════════════

"argocd": [
  {
    id: "argocd-lab-1",
    title: "GitOps with ArgoCD",
    difficulty: "Intermediate",
    duration: "30 min",
    tools: ["argocd", "kubectl", "git"],
    objective: "Deploy ArgoCD, connect a Git repo, and sync an application automatically",
    interface: "terminal",
    steps: [
      { id: "a1-1", title: "Install ArgoCD", type: "command",
        description: "Deploy ArgoCD to your Kubernetes cluster.",
        code: `kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Wait for ArgoCD to be ready
kubectl wait --for=condition=Ready pod -l app.kubernetes.io/name=argocd-server -n argocd --timeout=120s

# Access the UI (port-forward)
kubectl port-forward svc/argocd-server -n argocd 8080:443 &

# Get initial admin password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`,
        explanation: "ArgoCD runs inside Kubernetes and watches Git repos. It continuously compares live cluster state to the desired state in Git, and syncs any drift." },
      { id: "a1-2", title: "Login and configure ArgoCD CLI", type: "command",
        description: "Connect the argocd CLI to your server.",
        code: `# Login
argocd login localhost:8080 --username admin --password $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d) --insecure

# Change password
argocd account update-password

# List apps (empty initially)
argocd app list` },
      { id: "a1-3", title: "Create an Application", type: "command",
        description: "Tell ArgoCD which Git repo + path to watch and deploy.",
        code: `argocd app create my-app \
  --repo https://github.com/argoproj/argocd-example-apps.git \
  --path guestbook \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace default \
  --sync-policy automated \
  --auto-prune \
  --self-heal

argocd app get my-app`,
        explanation: "--sync-policy automated syncs on every Git commit. --auto-prune deletes K8s resources removed from Git. --self-heal corrects manual kubectl changes (drift remediation)." },
      { id: "a1-4", title: "Sync and monitor", type: "command",
        description: "Trigger a manual sync and watch the deployment.",
        code: `# Manual sync
argocd app sync my-app

# Watch sync status
argocd app wait my-app --sync

# Get app status details
argocd app get my-app
argocd app history my-app

# Rollback to previous version
argocd app rollback my-app 1`,
        explanation: "ArgoCD maintains a history of syncs. Rollback points Git HEAD back to a previous commit's state. The Git repo IS the source of truth — rolling back Git is rolling back the app." },
      { id: "a1-5", title: "Create AppProject for RBAC", type: "code",
        description: "AppProjects restrict which repos/clusters/namespaces a team can use.",
        language: "yaml",
        code: `apiVersion: argoproj.io/v1alpha1
kind: AppProject
metadata:
  name: team-backend
  namespace: argocd
spec:
  description: Backend team project
  sourceRepos:
    - 'https://github.com/myorg/backend-*'   # Only these repos
  destinations:
    - namespace: backend-*                     # Only these namespaces
      server: https://kubernetes.default.svc
  clusterResourceWhitelist:
    - group: ''
      kind: Namespace
  namespaceResourceWhitelist:
    - group: 'apps'
      kind: Deployment
    - group: ''
      kind: Service`,
        explanation: "AppProjects enforce GitOps boundaries. Team A can't deploy to Team B's namespace. Source repos are whitelisted. This prevents privilege escalation via GitOps." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// DEVOPS - GRAFANA
// ═══════════════════════════════════════════════════════

"grafana": [
  {
    id: "grafana-lab-1",
    title: "Build a Production Dashboard in Grafana",
    difficulty: "Intermediate",
    duration: "30 min",
    tools: ["grafana", "prometheus"],
    objective: "Connect Grafana to Prometheus, build a dashboard with variables and alerts",
    interface: "terminal",
    steps: [
      { id: "g1-1", title: "Start Grafana + Prometheus stack", type: "command",
        description: "Run the complete monitoring stack with Docker Compose.",
        language: "yaml",
        code: `cat > docker-compose.yml << 'EOF'
version: '3.8'
services:
  prometheus:
    image: prom/prometheus:latest
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
    ports: ["9090:9090"]
    command: ['--config.file=/etc/prometheus/prometheus.yml', '--storage.tsdb.retention.time=15d']

  grafana:
    image: grafana/grafana:latest
    ports: ["3000:3000"]
    environment:
      GF_SECURITY_ADMIN_PASSWORD: admin123
      GF_USERS_ALLOW_SIGN_UP: "false"
    volumes:
      - grafana_data:/var/lib/grafana

  node-exporter:
    image: prom/node-exporter:latest
    ports: ["9100:9100"]

volumes:
  grafana_data:
EOF

cat > prometheus.yml << 'EOF'
global:
  scrape_interval: 15s
scrape_configs:
  - job_name: 'node'
    static_configs:
      - targets: ['node-exporter:9100']
EOF

docker compose up -d`,
        explanation: "This stack: Prometheus scrapes node-exporter metrics (CPU, memory, disk, network). Grafana visualizes Prometheus data. node-exporter exposes host OS metrics." },
      { id: "g1-2", title: "Add Prometheus data source", type: "command",
        description: "Connect Grafana to Prometheus via API — no manual UI clicking.",
        code: `# Add data source via Grafana API
curl -X POST http://admin:admin123@localhost:3000/api/datasources \
  -H 'Content-Type: application/json' \
  -d '{
    "name": "Prometheus",
    "type": "prometheus",
    "url": "http://prometheus:9090",
    "access": "proxy",
    "isDefault": true
  }'

# Verify
curl http://admin:admin123@localhost:3000/api/datasources`,
        explanation: "Grafana provisioning via API/YAML is the production approach — enables Infrastructure as Code. Avoid manual UI configuration that can't be reproduced or version-controlled." },
      { id: "g1-3", title: "Import a dashboard", type: "command",
        description: "Grafana.com has 1000+ community dashboards. Import by ID.",
        code: `# Import Node Exporter dashboard (ID: 1860)
curl -X POST http://admin:admin123@localhost:3000/api/dashboards/import \
  -H 'Content-Type: application/json' \
  -d '{
    "dashboard": {"id": null, "title": "Node Exporter"},
    "overwrite": true,
    "inputs": [{"name": "DS_PROMETHEUS", "type": "datasource", "pluginId": "prometheus", "value": "Prometheus"}],
    "folderId": 0
  }'

# Or import by Grafana.com ID
curl -X POST http://admin:admin123@localhost:3000/api/dashboards/import \
  -H 'Content-Type: application/json' \
  -d '{"dashboardId": 1860, "overwrite": true, "inputs": [{"name":"DS_PROMETHEUS","type":"datasource","value":"Prometheus"}]}'`,
        explanation: "Dashboard ID 1860 is the most popular Grafana dashboard — Node Exporter Full. Shows CPU, memory, disk, network for each server. Community dashboards save hours of work." },
      { id: "g1-4", title: "Create an alert rule", type: "command",
        description: "Alert when CPU usage stays above 80% for 5 minutes.",
        code: `# Create alert rule via API
curl -X POST http://admin:admin123@localhost:3000/api/v1/provisioning/alert-rules \
  -H 'Content-Type: application/json' \
  -d '{
    "title": "High CPU Usage",
    "condition": "C",
    "data": [
      {
        "refId": "A",
        "queryType": "",
        "relativeTimeRange": {"from": 300, "to": 0},
        "datasourceUid": "prometheus",
        "model": {
          "expr": "100 - (avg by(instance)(rate(node_cpu_seconds_total{mode=\"idle\"}[5m])) * 100)",
          "refId": "A"
        }
      },
      {
        "refId": "C",
        "queryType": "",
        "datasourceUid": "-100",
        "model": {
          "conditions": [{"evaluator": {"params": [80], "type": "gt"}, "operator": {"type": "and"}, "query": {"params": ["A"]}, "reducer": {"type": "last"}}],
          "type": "classic_conditions",
          "refId": "C"
        }
      }
    ],
    "for": "5m",
    "orgId": 1,
    "folderUID": "general",
    "ruleGroup": "infrastructure"
  }'`,
        explanation: "Grafana 9+ has unified alerting. Alert rules query data sources, evaluate conditions, and fire to notification channels (Slack, PagerDuty, email). 'for: 5m' means condition must be true for 5 min before firing." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// DEVOPS - ELK STACK
// ═══════════════════════════════════════════════════════

"elk-stack": [
  {
    id: "elk-lab-1",
    title: "Ship Logs to ELK Stack",
    difficulty: "Intermediate",
    duration: "35 min",
    tools: ["elasticsearch", "logstash", "kibana", "filebeat"],
    objective: "Set up ELK, ship nginx logs, parse them, and create a Kibana dashboard",
    interface: "terminal",
    steps: [
      { id: "e1-1", title: "Start the ELK stack", type: "code",
        description: "Deploy Elasticsearch, Logstash, and Kibana with Docker Compose.",
        language: "yaml",
        code: `cat > docker-compose.yml << 'COMPOSE'
version: '3.8'
services:
  elasticsearch:
    image: elasticsearch:8.11.0
    environment:
      - discovery.type=single-node
      - xpack.security.enabled=false
      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"
    ports: ["9200:9200"]
    volumes: [es_data:/usr/share/elasticsearch/data]

  logstash:
    image: logstash:8.11.0
    volumes:
      - ./logstash.conf:/usr/share/logstash/pipeline/logstash.conf
    depends_on: [elasticsearch]

  kibana:
    image: kibana:8.11.0
    ports: ["5601:5601"]
    environment:
      ELASTICSEARCH_HOSTS: "http://elasticsearch:9200"
    depends_on: [elasticsearch]

volumes:
  es_data:
COMPOSE` },
      { id: "e1-2", title: "Create Logstash pipeline", type: "code",
        description: "Logstash config: input → filter → output. Parse nginx access logs.",
        language: "ruby",
        code: `cat > logstash.conf << 'EOF'
input {
  beats {
    port => 5044   # Receive from Filebeat
  }
}

filter {
  # Parse nginx access log format
  grok {
    match => { "message" => "%{COMBINEDAPACHELOG}" }
  }

  # Parse timestamp
  date {
    match => [ "timestamp", "dd/MMM/yyyy:HH:mm:ss Z" ]
    target => "@timestamp"
  }

  # Convert numeric fields
  mutate {
    convert => {
      "response" => "integer"
      "bytes"    => "integer"
    }
  }

  # Add geo info from IP
  geoip {
    source => "clientip"
    target => "geoip"
  }

  # Remove raw message (already parsed)
  mutate { remove_field => ["message", "timestamp"] }
}

output {
  elasticsearch {
    hosts    => ["elasticsearch:9200"]
    index    => "nginx-logs-%{+YYYY.MM.dd}"   # Daily index rotation
  }
}
EOF
docker compose up -d`,
        explanation: "Logstash pipeline: input receives data, filter parses/enriches, output sends to Elasticsearch. grok uses regex patterns to extract structured fields from unstructured log lines." },
      { id: "e1-3", title: "Send logs with Filebeat", type: "command",
        description: "Filebeat is a lightweight shipper that tails log files and sends to Logstash.",
        code: `cat > filebeat.yml << 'EOF'
filebeat.inputs:
  - type: log
    enabled: true
    paths:
      - /var/log/nginx/access.log
    tags: ["nginx", "access"]

output.logstash:
  hosts: ["localhost:5044"]

processors:
  - add_host_metadata: {}
EOF

# Run filebeat (needs sudo for log access)
docker run -d \
  -v $(pwd)/filebeat.yml:/usr/share/filebeat/filebeat.yml:ro \
  -v /var/log/nginx:/var/log/nginx:ro \
  --name filebeat \
  --network host \
  elastic/filebeat:8.11.0 filebeat -e`,
        explanation: "Filebeat reads log files from disk, handles backpressure (slows down if Logstash is busy), and maintains a state file to track position — so no logs are lost or duplicated on restart." },
      { id: "e1-4", title: "Query Elasticsearch and build Kibana dashboard", type: "command",
        description: "Verify data is indexed, then create visualizations in Kibana.",
        code: `# Check data is indexed
curl -s localhost:9200/_cat/indices?v | grep nginx
curl -s localhost:9200/nginx-logs-*/_count

# Sample query: count 5xx errors in last hour
curl -X GET localhost:9200/nginx-logs-*/_search -H 'Content-Type: application/json' -d '{
  "query": {
    "bool": {
      "filter": [
        {"range": {"@timestamp": {"gte": "now-1h"}}},
        {"range": {"response": {"gte": 500}}}
      ]
    }
  },
  "aggs": {
    "errors_by_status": {"terms": {"field": "response"}}
  }
}'

# Open Kibana: http://localhost:5601
# Stack Management → Index Patterns → Create "nginx-logs-*"
# Analytics → Dashboard → Create → Add panels`,
        explanation: "In Kibana: create an index pattern matching 'nginx-logs-*'. Then build dashboards: bar chart of status codes, line chart of requests/min, map of client IPs, table of slowest URLs." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// DEVOPS - NGINX
// ═══════════════════════════════════════════════════════

"nginx": [
  {
    id: "nginx-lab-1",
    title: "Nginx as Reverse Proxy and Load Balancer",
    difficulty: "Intermediate",
    duration: "30 min",
    tools: ["nginx", "docker"],
    objective: "Configure Nginx as a reverse proxy with load balancing, SSL termination, and rate limiting",
    interface: "terminal",
    steps: [
      { id: "n1-1", title: "Run 3 backend app instances", type: "command",
        description: "Simulate a real-world scenario with multiple app servers behind Nginx.",
        code: `# Start 3 simple backend servers on different ports
docker run -d --name app1 -p 3001:80 -e HOSTNAME=app1 nginx:alpine
docker run -d --name app2 -p 3002:80 -e HOSTNAME=app2 nginx:alpine
docker run -d --name app3 -p 3003:80 -e HOSTNAME=app3 nginx:alpine

# Verify all 3 are running
docker ps | grep app
curl http://localhost:3001
curl http://localhost:3002
curl http://localhost:3003` },
      { id: "n1-2", title: "Configure reverse proxy + load balancer", type: "code",
        description: "Write an Nginx config that distributes traffic across all 3 backends.",
        language: "nginx",
        code: `cat > nginx.conf << 'EOF'
events { worker_connections 1024; }

http {
    # Define upstream server pool
    upstream backend {
        least_conn;   # Send to server with fewest active connections

        server localhost:3001 weight=3;  # Gets 3x more traffic (more powerful)
        server localhost:3002 weight=1;
        server localhost:3003 weight=1;

        # Health checks: remove server if 3 failures in 30s
        # server localhost:3003 max_fails=3 fail_timeout=30s;
    }

    # Rate limiting: 10 req/sec per IP
    limit_req_zone \$binary_remote_addr zone=api:10m rate=10r/s;

    server {
        listen 80;
        server_name localhost;

        # Rate limit all /api/ routes
        location /api/ {
            limit_req zone=api burst=20 nodelay;
            limit_req_status 429;

            proxy_pass         http://backend;
            proxy_set_header   Host              \$host;
            proxy_set_header   X-Real-IP         \$remote_addr;
            proxy_set_header   X-Forwarded-For   \$proxy_add_x_forwarded_for;
            proxy_set_header   X-Forwarded-Proto \$scheme;

            # Timeouts
            proxy_connect_timeout 5s;
            proxy_read_timeout    60s;
        }

        # Health check endpoint (bypass rate limit)
        location /health {
            access_log off;
            return 200 'OK';
            add_header Content-Type text/plain;
        }

        # Static files served directly (not proxied)
        location /static/ {
            root /var/www;
            expires 1y;
            add_header Cache-Control "public, immutable";
        }
    }
}
EOF` },
      { id: "n1-3", title: "Start Nginx and test load balancing", type: "command",
        description: "Start Nginx and verify traffic is distributed across backends.",
        code: `docker run -d --name nginx-lb \
  --network host \
  -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf:ro \
  nginx:alpine

# Test multiple requests — watch which backend responds
for i in {1..9}; do
  curl -s http://localhost:80/api/test | grep -i server
done

# Test rate limiting
for i in {1..15}; do
  curl -s -o /dev/null -w "%{http_code}\n" http://localhost/api/test
done
# Should see 200 for first 10-20, then 429 Too Many Requests`,
        explanation: "Nginx is extremely efficient — a single Nginx process can handle 10,000+ concurrent connections. It sits between clients and backends, providing: load balancing, SSL termination, caching, rate limiting, and connection pooling." },
      { id: "n1-4", title: "Add SSL with self-signed cert", type: "command",
        description: "Enable HTTPS — in production use Let's Encrypt with certbot.",
        code: `# Generate self-signed certificate (for testing only)
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ssl/nginx.key \
  -out ssl/nginx.crt \
  -subj "/C=IN/ST=KA/L=Bangalore/O=Test/CN=localhost"

# Test SSL
curl -k https://localhost/health   # -k skips cert verification for self-signed
openssl s_client -connect localhost:443 -servername localhost 2>/dev/null | head -20`,
        explanation: "In production: use certbot with Let's Encrypt for free auto-renewing certs. On AWS: use ACM (AWS Certificate Manager) + ALB — Nginx handles SSL termination on the LB, backends communicate plain HTTP internally." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// DEVOPS - NETWORKING
// ═══════════════════════════════════════════════════════

"networking": [
  {
    id: "net-lab-1",
    title: "Network Troubleshooting Toolkit",
    difficulty: "Intermediate",
    duration: "25 min",
    tools: ["curl", "dig", "ss", "tcpdump", "nc"],
    objective: "Systematically diagnose connectivity issues using the right tool at each layer",
    interface: "terminal",
    steps: [
      { id: "net1-1", title: "DNS resolution debugging", type: "command",
        description: "DNS is the first thing to check. Many 'connection refused' errors are actually DNS failures.",
        code: `# Full DNS resolution trace
dig +trace google.com

# Check which DNS server you're using
cat /etc/resolv.conf
systemd-resolve --status 2>/dev/null | head -20

# Test with specific DNS servers
dig @8.8.8.8 api.example.com      # Google DNS
dig @1.1.1.1 api.example.com      # Cloudflare DNS
dig @127.0.0.53 api.example.com   # systemd-resolved

# Check all record types
dig api.example.com A              # IPv4
dig api.example.com AAAA           # IPv6
dig api.example.com CNAME          # Alias
dig api.example.com MX             # Mail
dig api.example.com TXT            # Text (SPF, DKIM)

# Reverse DNS lookup
dig -x 8.8.8.8`,
        explanation: "dig +trace shows the full DNS resolution path: root → TLD → authoritative. If DNS fails at root, it's a local network issue. If it fails at TLD, the domain may not exist or have wrong NS records." },
      { id: "net1-2", title: "Port and connection testing", type: "command",
        description: "Verify ports are open and services are listening before debugging the app.",
        code: `# Check what's listening locally
ss -tlnp                          # TCP listening with process names
ss -tlnp sport :8080              # Specific port
ss -tnp state established         # All established connections
ss -s                             # Summary statistics

# Test if a remote port is open
nc -zv api.example.com 443        # TCP port test
nc -zv api.example.com 443 2>&1 | grep -E "open|refused|timeout"
nc -zvu api.example.com 53        # UDP port test (DNS)

# Timeout test (important for firewalls)
timeout 5 bash -c "cat < /dev/tcp/api.example.com/443" && echo "OPEN" || echo "CLOSED/TIMEOUT"

# HTTP test with full debug
curl -v --max-time 10 https://api.example.com/health 2>&1 | grep -E "< |> |\* "`,
        explanation: "ss is the modern replacement for netstat. nc (netcat) is the Swiss Army knife of networking — use it to test ports, transfer files, or even create simple servers (nc -l 8080)." },
      { id: "net1-3", title: "Packet capture with tcpdump", type: "command",
        description: "When all else fails, capture the actual packets to see what's happening.",
        code: `# Capture all traffic on eth0
sudo tcpdump -i eth0 -n

# Capture traffic to/from a specific host
sudo tcpdump -i any -n host api.example.com

# Capture HTTP traffic (port 80)
sudo tcpdump -i any -n port 80 -A

# Capture HTTPS (see TLS handshake, not content)
sudo tcpdump -i any -n port 443

# Capture and save to file for analysis in Wireshark
sudo tcpdump -i eth0 -w /tmp/capture.pcap
# Transfer and open in Wireshark

# Filter by protocol
sudo tcpdump -i any 'icmp'                          # Ping traffic
sudo tcpdump -i any 'tcp[tcpflags] & tcp-syn != 0' # SYN packets only
sudo tcpdump -i any 'tcp[tcpflags] & tcp-rst != 0' # RST (refused connections)`,
        explanation: "TCPDump captures raw packets at the network interface level — the ground truth. RST packets mean the server actively refused the connection. Timeout (no RST) usually means firewall is silently dropping packets." },
      { id: "net1-4", title: "TLS certificate debugging", type: "command",
        description: "Certificate errors are common in production. Know how to diagnose them fast.",
        code: `# Inspect certificate from a live server
echo | openssl s_client -connect api.example.com:443 -servername api.example.com 2>/dev/null | openssl x509 -noout -text | grep -E "Subject:|DNS:|Not Before|Not After"

# Check certificate expiry only (quick check)
echo | openssl s_client -connect api.example.com:443 2>/dev/null | openssl x509 -noout -dates

# Verify certificate chain
echo | openssl s_client -connect api.example.com:443 -showcerts 2>/dev/null | grep -E "subject|issuer"

# Test specific TLS versions
openssl s_client -connect api.example.com:443 -tls1_2
openssl s_client -connect api.example.com:443 -tls1_3

# Check cert from file
openssl x509 -in cert.pem -text -noout
openssl verify -CAfile ca.pem cert.pem`,
        explanation: "Certificate debugging order: 1) Is it expired? 2) Does the CN/SAN match the hostname? 3) Is the full chain trusted? 4) Is the correct TLS version supported? The openssl commands above answer each question." },
    ],
  },
],

// ═══ CLOUD: AWS IAM ═══
};

export function getLabsForTech(tech: string): Lab[] {
  return labs_devops[tech] || [];
}
