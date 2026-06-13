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

export const allLabs: TechLabs = {

// ═══════════════════════════════════════════════════════
// DOCKER
// ═══════════════════════════════════════════════════════
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
"postgresql": [
  {
    id: "pg-lab-1",
    title: "PostgreSQL Essentials: Schema and CRUD",
    difficulty: "Beginner",
    duration: "25 min",
    tools: ["psql", "PostgreSQL"],
    objective: "Design a database schema, insert data, and write queries including JOINs",
    interface: "sql-console",
    steps: [
      {
        id: "pg1-1", title: "Create schema", type: "sql",
        description: "Design and create a simple e-commerce database schema.",
        language: "sql",
        code: `-- Create tables with proper constraints and indexes
CREATE TABLE users (
    id          BIGSERIAL PRIMARY KEY,
    email       TEXT UNIQUE NOT NULL,
    name        TEXT NOT NULL,
    plan        TEXT NOT NULL DEFAULT 'free' CHECK (plan IN ('free', 'pro', 'enterprise')),
    created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE products (
    id          BIGSERIAL PRIMARY KEY,
    name        TEXT NOT NULL,
    price       NUMERIC(10,2) NOT NULL CHECK (price > 0),
    category    TEXT NOT NULL,
    stock       INTEGER NOT NULL DEFAULT 0 CHECK (stock >= 0)
);

CREATE TABLE orders (
    id          BIGSERIAL PRIMARY KEY,
    user_id     BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    total       NUMERIC(12,2) NOT NULL,
    status      TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending','paid','shipped','delivered','cancelled')),
    created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE order_items (
    id          BIGSERIAL PRIMARY KEY,
    order_id    BIGINT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    product_id  BIGINT NOT NULL REFERENCES products(id),
    quantity    INTEGER NOT NULL CHECK (quantity > 0),
    price_each  NUMERIC(10,2) NOT NULL
);

-- Indexes for common queries
CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);`,
        explanation: "BIGSERIAL = auto-incrementing bigint. TIMESTAMPTZ stores timezone info — always use this over TIMESTAMP. CHECK constraints enforce business rules at database level.",
      },
      {
        id: "pg1-2", title: "Insert sample data", type: "sql",
        description: "Populate the tables with realistic test data.",
        language: "sql",
        code: `-- Insert users
INSERT INTO users (email, name, plan) VALUES
    ('alice@example.com', 'Alice Johnson', 'enterprise'),
    ('bob@example.com',   'Bob Smith',    'pro'),
    ('charlie@example.com','Charlie Lee', 'free'),
    ('diana@example.com', 'Diana Kumar',  'pro'),
    ('eve@example.com',   'Eve Patel',    'enterprise');

-- Insert products
INSERT INTO products (name, price, category, stock) VALUES
    ('Laptop Pro',       89999, 'Electronics', 50),
    ('Wireless Mouse',    2499, 'Electronics', 200),
    ('Desk Lamp',         1299, 'Furniture',   75),
    ('Notebook Pack',      499, 'Stationery',  500),
    ('Coffee Maker',     6999, 'Kitchen',     30),
    ('Mechanical Keyboard', 7999, 'Electronics', 100);

-- Insert orders with items
INSERT INTO orders (user_id, total, status) VALUES (1, 92498, 'delivered');
INSERT INTO order_items (order_id, product_id, quantity, price_each) VALUES
    (1, 1, 1, 89999),   -- 1 Laptop
    (1, 2, 1, 2499);    -- 1 Mouse

INSERT INTO orders (user_id, total, status) VALUES (2, 9298, 'shipped');
INSERT INTO order_items (order_id, product_id, quantity, price_each) VALUES
    (2, 5, 1, 6999),    -- 1 Coffee Maker
    (2, 4, 5, 499);     -- 5 Notebook Packs

INSERT INTO orders (user_id, total, status) VALUES (1, 7999, 'pending');
INSERT INTO order_items (order_id, product_id, quantity, price_each) VALUES
    (3, 6, 1, 7999);    -- 1 Keyboard`,
      },
      {
        id: "pg1-3", title: "Query with JOINs", type: "sql",
        description: "Write queries that combine data from multiple tables.",
        language: "sql",
        code: `-- All orders with customer name and order details
SELECT
    u.name              AS customer,
    o.id                AS order_id,
    o.status,
    o.total,
    o.created_at::date  AS order_date
FROM orders o
JOIN users u ON o.user_id = u.id
ORDER BY o.created_at DESC;

-- Product breakdown per order
SELECT
    o.id    AS order_id,
    u.name  AS customer,
    p.name  AS product,
    oi.quantity,
    oi.price_each,
    oi.quantity * oi.price_each AS line_total
FROM order_items oi
JOIN orders o    ON oi.order_id = o.id
JOIN users u     ON o.user_id = u.id
JOIN products p  ON oi.product_id = p.id
ORDER BY o.id, line_total DESC;

-- Customer summary: orders, total spend
SELECT
    u.name,
    u.plan,
    COUNT(o.id)         AS total_orders,
    SUM(o.total)        AS total_spent,
    AVG(o.total)        AS avg_order_value,
    MAX(o.created_at)   AS last_order
FROM users u
LEFT JOIN orders o ON u.id = o.user_id   -- Include users with no orders
GROUP BY u.id, u.name, u.plan
ORDER BY total_spent DESC NULLS LAST;`,
        explanation: "LEFT JOIN keeps all rows from the left table even without matches. NULLS LAST sorts NULL values to the bottom. Always alias columns for readability.",
      },
      {
        id: "pg1-4", title: "Window functions", type: "sql",
        description: "Powerful analytics without GROUP BY collapsing rows.",
        language: "sql",
        code: `-- Rank products by revenue within each category
SELECT
    p.name,
    p.category,
    p.price,
    SUM(oi.quantity * oi.price_each) AS total_revenue,
    RANK() OVER (
        PARTITION BY p.category
        ORDER BY SUM(oi.quantity * oi.price_each) DESC
    ) AS rank_in_category,
    SUM(SUM(oi.quantity * oi.price_each)) OVER (
        PARTITION BY p.category
    ) AS category_total
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.id, p.name, p.category, p.price
ORDER BY p.category, rank_in_category;`,
        explanation: "PARTITION BY divides rows into groups (like GROUP BY but without collapsing). RANK() within each partition is independent. Window functions always follow OVER().",
      },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// SQL
// ═══════════════════════════════════════════════════════
"sql": [
  {
    id: "sql-lab-1",
    title: "SQL From Zero: SELECT, JOIN, Aggregate",
    difficulty: "Beginner",
    duration: "30 min",
    tools: ["SQL"],
    objective: "Master the core SQL operations used in 95% of real-world queries",
    interface: "sql-console",
    steps: [
      {
        id: "sql1-1", title: "Basic SELECT and filtering", type: "sql",
        description: "Retrieve specific columns and rows using WHERE conditions.",
        language: "sql",
        code: `-- Basic SELECT: choose columns from a table
SELECT id, email, name FROM users;

-- Filter with WHERE
SELECT * FROM users WHERE plan = 'enterprise';

-- Multiple conditions
SELECT * FROM orders
WHERE status = 'pending'
  AND total > 1000;

-- IN operator (instead of multiple OR conditions)
SELECT * FROM orders
WHERE status IN ('pending', 'paid');

-- Pattern matching (% = any chars, _ = one char)
SELECT * FROM users WHERE email LIKE '%@example.com';

-- NULL handling (use IS NULL, not = NULL)
SELECT * FROM products WHERE stock IS NOT NULL;
SELECT name, COALESCE(description, 'No description') FROM products;

-- Sorting and limiting
SELECT name, price FROM products
ORDER BY price DESC
LIMIT 3;`,
        explanation: "WHERE filters rows before they're returned. LIMIT is applied last. NULL is not equal to anything — always use IS NULL / IS NOT NULL.",
      },
      {
        id: "sql1-2", title: "Aggregate functions", type: "sql",
        description: "Summarize data with COUNT, SUM, AVG, MIN, MAX and GROUP BY.",
        language: "sql",
        code: `-- Count all orders
SELECT COUNT(*) AS total_orders FROM orders;

-- Average, total, min, max
SELECT
    COUNT(*)       AS orders,
    SUM(total)     AS revenue,
    AVG(total)     AS avg_order,
    MIN(total)     AS smallest,
    MAX(total)     AS largest
FROM orders
WHERE status != 'cancelled';

-- Group by category: revenue per category
SELECT
    p.category,
    COUNT(DISTINCT oi.order_id) AS num_orders,
    SUM(oi.quantity)            AS units_sold,
    SUM(oi.quantity * oi.price_each) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.category
ORDER BY revenue DESC;

-- HAVING: filter groups (not rows)
-- Find categories with more than 1 order
SELECT p.category, COUNT(DISTINCT oi.order_id) AS orders
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.category
HAVING COUNT(DISTINCT oi.order_id) > 1;`,
        hint: "WHERE filters rows before grouping. HAVING filters groups after grouping. You can't use aggregate functions in WHERE.",
        explanation: "Query execution order: FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT. This order determines what you can reference where.",
      },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// JAVA
// ═══════════════════════════════════════════════════════
"java": [
  {
    id: "java-lab-1",
    title: "Java Basics: Variables, Control Flow, Methods",
    difficulty: "Beginner",
    duration: "20 min",
    tools: ["java", "javac"],
    objective: "Write and run a Java program covering core syntax — types, loops, methods, OOP",
    interface: "code-editor",
    steps: [
      {
        id: "j1-1", title: "Create and run HelloWorld", type: "code",
        description: "The classic first program. Notice Java requires a class, a main method, and matching filename.",
        language: "java",
        code: `public class HelloWorld {
    public static void main(String[] args) {
        // Print to console
        System.out.println("Hello, World!");
        
        // Variables
        int age = 20;
        double gpa = 8.5;
        String name = "Alice";
        boolean isActive = true;
        
        // String formatting
        System.out.printf("Name: %s, Age: %d, GPA: %.2f%n", name, age, gpa);
        
        // String concatenation
        System.out.println("Student: " + name + " (GPA: " + gpa + ")");
        
        // Math operations
        int a = 17, b = 5;
        System.out.println("17 / 5 = " + (a / b));       // Integer division: 3
        System.out.println("17 % 5 = " + (a % b));       // Modulo: 2
        System.out.println("17.0 / 5 = " + (17.0 / b)); // Float division: 3.4
    }
}`,
        explanation: "Java is strongly typed — every variable has a declared type. main() is the entry point. System.out.println adds a newline; System.out.print does not.",
      },
      {
        id: "j1-2", title: "Control flow: if, for, while", type: "code",
        description: "Java's control flow is similar to C/C++ — curly braces, semicolons.",
        language: "java",
        code: `public class ControlFlow {
    public static void main(String[] args) {
        // If-else
        int score = 85;
        String grade;
        if (score >= 90)      grade = "A";
        else if (score >= 80) grade = "B";
        else if (score >= 70) grade = "C";
        else                  grade = "F";
        System.out.println("Grade: " + grade);  // B
        
        // For loop: print FizzBuzz
        System.out.print("FizzBuzz: ");
        for (int i = 1; i <= 20; i++) {
            if (i % 15 == 0)      System.out.print("FizzBuzz ");
            else if (i % 3 == 0)  System.out.print("Fizz ");
            else if (i % 5 == 0)  System.out.print("Buzz ");
            else                  System.out.print(i + " ");
        }
        System.out.println();
        
        // Arrays
        int[] numbers = {5, 3, 8, 1, 9, 2, 7};
        int max = numbers[0];
        int sum = 0;
        for (int num : numbers) {   // Enhanced for loop
            if (num > max) max = num;
            sum += num;
        }
        System.out.println("Max: " + max + ", Sum: " + sum + ", Avg: " + (double)sum/numbers.length);
    }
}`,
      },
      {
        id: "j1-3", title: "Classes and Objects", type: "code",
        description: "Define a class with fields, constructors, methods — the core of OOP.",
        language: "java",
        code: `class BankAccount {
    // Fields
    private String owner;
    private double balance;
    private int transactions;
    
    // Constructor
    public BankAccount(String owner, double initialBalance) {
        this.owner = owner;
        this.balance = initialBalance;
        this.transactions = 0;
    }
    
    // Methods
    public void deposit(double amount) {
        if (amount <= 0) throw new IllegalArgumentException("Amount must be positive");
        balance += amount;
        transactions++;
        System.out.printf("Deposited %.2f → Balance: %.2f%n", amount, balance);
    }
    
    public boolean withdraw(double amount) {
        if (amount > balance) {
            System.out.println("Insufficient funds");
            return false;
        }
        balance -= amount;
        transactions++;
        System.out.printf("Withdrew %.2f → Balance: %.2f%n", amount, balance);
        return true;
    }
    
    @Override
    public String toString() {
        return String.format("Account[owner=%s, balance=%.2f, txns=%d]", owner, balance, transactions);
    }
}

public class OOPDemo {
    public static void main(String[] args) {
        BankAccount alice = new BankAccount("Alice", 10000);
        alice.deposit(5000);
        alice.withdraw(2000);
        alice.withdraw(20000);  // Fails
        System.out.println(alice);
    }
}`,
      },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// C PROGRAMMING
// ═══════════════════════════════════════════════════════
"c-programming": [
  {
    id: "c-lab-1",
    title: "C Pointers and Memory — The Core of C",
    difficulty: "Intermediate",
    duration: "30 min",
    tools: ["gcc", "valgrind"],
    objective: "Understand pointers, pass-by-reference, and dynamic memory allocation",
    interface: "code-editor",
    steps: [
      {
        id: "c1-1", title: "Pointer basics", type: "code",
        description: "A pointer stores a memory address. This is C's most unique and powerful feature.",
        language: "c",
        code: `#include <stdio.h>

int main() {
    int x = 42;
    int *ptr = &x;     // ptr stores ADDRESS of x (&x = address-of x)
    
    printf("Value of x:        %d\\n",  x);
    printf("Address of x:      %p\\n",  (void*)&x);
    printf("Value of ptr:      %p\\n",  (void*)ptr);  // Same as &x
    printf("Dereferenced ptr:  %d\\n",  *ptr);         // *ptr = value AT that address
    
    // Modify x through the pointer
    *ptr = 100;    // Dereference and assign
    printf("x after *ptr=100: %d\\n", x);  // x is now 100!
    
    // Pointer arithmetic
    int arr[] = {10, 20, 30, 40, 50};
    int *p = arr;   // Points to arr[0]
    
    for (int i = 0; i < 5; i++) {
        printf("arr[%d] = %d (address: %p)\\n", i, *(p+i), (void*)(p+i));
    }
    // Notice each address is 4 bytes apart (size of int)
    
    return 0;
}`,
        explanation: "& = address-of (gives you the pointer). * = dereference (follow the pointer). p+1 moves 4 bytes forward for an int array — pointer arithmetic is aware of the type size.",
      },
      {
        id: "c1-2", title: "Pass by reference with pointers", type: "code",
        description: "C passes everything by value. To modify a variable, pass a pointer to it.",
        language: "c",
        code: `#include <stdio.h>
#include <stdlib.h>

// WRONG: this swap doesn't work (local copies)
void wrong_swap(int a, int b) {
    int temp = a; a = b; b = temp;
}

// CORRECT: pass pointers, modify through them
void swap(int *a, int *b) {
    int temp = *a;  // Save value at address a
    *a = *b;        // Write value at address b into address a
    *b = temp;      // Write saved value into address b
}

// Return multiple values via output parameters
void divide(int numerator, int denominator, int *quotient, int *remainder) {
    *quotient  = numerator / denominator;
    *remainder = numerator % denominator;
}

int main() {
    int x = 10, y = 20;
    
    wrong_swap(x, y);
    printf("After wrong_swap: x=%d, y=%d\\n", x, y);  // Unchanged!
    
    swap(&x, &y);    // Pass addresses
    printf("After swap:       x=%d, y=%d\\n", x, y);  // x=20, y=10
    
    // Multiple return values
    int q, r;
    divide(17, 5, &q, &r);
    printf("17 / 5 = %d remainder %d\\n", q, r);  // 3 remainder 2
    
    return 0;
}`,
      },
      {
        id: "c1-3", title: "Dynamic memory allocation", type: "code",
        description: "malloc/free for manual memory management — power with responsibility.",
        language: "c",
        code: `#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Dynamic array
int* create_array(int size, int init_value) {
    int *arr = (int*)malloc(size * sizeof(int));
    if (arr == NULL) {
        fprintf(stderr, "malloc failed!\\n");
        exit(1);
    }
    for (int i = 0; i < size; i++) arr[i] = init_value;
    return arr;   // Caller MUST free this
}

int main() {
    // Create dynamic array
    int n = 5;
    int *arr = create_array(n, 0);
    
    // Fill with squares
    for (int i = 0; i < n; i++) arr[i] = i * i;
    
    printf("Array: ");
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\\n");  // 0 1 4 9 16
    
    // Resize with realloc
    n = 8;
    arr = (int*)realloc(arr, n * sizeof(int));
    for (int i = 5; i < n; i++) arr[i] = i * i;
    
    printf("After realloc: ");
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\\n");  // 0 1 4 9 16 25 36 49
    
    // MUST free — no garbage collector in C
    free(arr);
    arr = NULL;   // Prevent dangling pointer
    
    // Dynamic string
    char *name = (char*)malloc(50 * sizeof(char));
    strcpy(name, "Alice");
    printf("Name: %s\\n", name);
    strcat(name, " Smith");
    printf("Full name: %s\\n", name);
    free(name);
    
    return 0;
}`,
        hint: "Every malloc needs a free. Use valgrind to detect memory leaks: valgrind --leak-check=full ./program",
        explanation: "Memory leak: allocate but never free. Dangling pointer: access after free. Buffer overflow: write past allocated size. Use valgrind or AddressSanitizer to find these.",
      },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// C++
// ═══════════════════════════════════════════════════════
"cpp": [
  {
    id: "cpp-lab-1",
    title: "STL: Mastering the Standard Template Library",
    difficulty: "Intermediate",
    duration: "30 min",
    tools: ["g++", "C++17"],
    objective: "Use vector, map, set, priority_queue, and algorithms to solve real problems",
    interface: "code-editor",
    steps: [
      {
        id: "cpp1-1", title: "vector and sorting", type: "code",
        description: "vector is the most-used STL container. Master it completely.",
        language: "cpp",
        code: `#include <bits/stdc++.h>
using namespace std;

int main() {
    // Create and populate vector
    vector<int> nums = {5, 2, 8, 1, 9, 3, 7, 4, 6};
    
    // STL algorithms
    sort(nums.begin(), nums.end());       // Ascending
    cout << "Sorted: ";
    for (int n : nums) cout << n << " "; // 1 2 3 4 5 6 7 8 9
    cout << "\\n";
    
    // Common operations
    cout << "Min: " << *min_element(nums.begin(), nums.end()) << "\\n";
    cout << "Max: " << *max_element(nums.begin(), nums.end()) << "\\n";
    cout << "Sum: " << accumulate(nums.begin(), nums.end(), 0) << "\\n";
    
    // Binary search (on sorted vector)
    int target = 7;
    auto it = lower_bound(nums.begin(), nums.end(), target);
    cout << "Position of " << target << ": " << (it - nums.begin()) << "\\n";
    cout << "Found: " << (binary_search(nums.begin(), nums.end(), target) ? "yes" : "no") << "\\n";
    
    // Vector of pairs: sort by second element
    vector<pair<string,int>> scores = {{"Alice",95}, {"Bob",87}, {"Charlie",92}};
    sort(scores.begin(), scores.end(), [](const auto& a, const auto& b){
        return a.second > b.second;  // Sort by score descending
    });
    
    cout << "\\nLeaderboard:\\n";
    for (int i = 0; i < scores.size(); i++) {
        cout << i+1 << ". " << scores[i].first << ": " << scores[i].second << "\\n";
    }
    
    return 0;
}`,
        explanation: "bits/stdc++.h includes everything (for competitive programming). In production, include only what you need. Lambda [](auto& a, auto& b){ return ...; } is an inline comparator.",
      },
      {
        id: "cpp1-2", title: "map, set, and unordered variants", type: "code",
        description: "Choose the right associative container for your use case.",
        language: "cpp",
        code: `#include <bits/stdc++.h>
using namespace std;

int main() {
    // map: sorted, O(log n) operations
    map<string, int> wordCount;
    string text = "the quick brown fox jumps over the lazy dog the";
    istringstream iss(text);
    string word;
    while (iss >> word) wordCount[word]++;  // auto-initializes to 0
    
    cout << "Word frequencies (sorted):\\n";
    for (auto& [word, count] : wordCount)  // C++17 structured bindings
        cout << "  " << word << ": " << count << "\\n";
    
    // unordered_map: hash, O(1) average — faster for large datasets
    unordered_map<string, int> umap;
    umap["key1"] = 42;
    umap["key2"] = 99;
    cout << "\\numap lookup: " << umap["key1"] << "\\n";
    
    // set: sorted unique elements
    set<int> primes = {2, 3, 5, 7, 11, 13};
    primes.insert(17);
    primes.insert(5);  // Duplicate ignored
    cout << "\\nPrimes: ";
    for (int p : primes) cout << p << " ";
    
    // Find and erase
    if (primes.count(7)) {
        primes.erase(7);
        cout << "\\nRemoved 7. Size: " << primes.size() << "\\n";
    }
    
    // priority_queue: max-heap by default
    priority_queue<int> maxHeap;
    for (int x : {3,1,4,1,5,9,2,6}) maxHeap.push(x);
    
    cout << "\\nTop 3 largest: ";
    for (int i = 0; i < 3; i++) {
        cout << maxHeap.top() << " ";
        maxHeap.pop();
    }
    cout << "\\n";
    
    return 0;
}`,
      },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// SHELL SCRIPTING
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
"aws-iam": [
  { id: "iam-lab-1", title: "IAM Users, Roles, and Policies", difficulty: "Intermediate", duration: "25 min",
    tools: ["aws-cli"], objective: "Create users, groups, roles and write least-privilege policies",
    interface: "terminal",
    steps: [
      { id: "iam1", title: "Create an IAM user with CLI", type: "command",
        description: "Create a developer user, add to a group, and generate access keys.",
        code: `aws iam create-user --user-name dev-alice
aws iam create-group --group-name developers
aws iam add-user-to-group --user-name dev-alice --group-name developers
aws iam list-users --query 'Users[*].[UserName,CreateDate]' --output table`,
        explanation: "Never create IAM users for services — use IAM roles. IAM users are for humans. Enable MFA for all IAM users with console access." },
      { id: "iam2", title: "Write a least-privilege policy", type: "code",
        description: "Grant only S3 read access to a specific bucket — principle of least privilege.",
        language: "json",
        code: `cat > s3-readonly-policy.json << 'EOF'
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Action": ["s3:GetObject","s3:ListBucket"],
    "Resource": ["arn:aws:s3:::my-app-data","arn:aws:s3:::my-app-data/*"]
  }]
}
EOF
aws iam create-policy --policy-name S3ReadOnly --policy-document file://s3-readonly-policy.json`,
        explanation: "Least privilege: grant only minimum needed. Use conditions to restrict further. Always test with IAM Policy Simulator before attaching to users." },
    ],
  },
],

// ═══ CLOUD: AWS EC2 ═══
"aws-ec2": [
  { id: "ec2-lab-1", title: "Launch and Configure EC2", difficulty: "Beginner", duration: "20 min",
    tools: ["aws-cli"], objective: "Launch EC2, connect via SSM, install software with user data",
    interface: "terminal",
    steps: [
      { id: "ec21", title: "Launch an EC2 instance", type: "command",
        description: "Launch Amazon Linux 2023 instance using the AWS CLI.",
        code: `AMI=$(aws ec2 describe-images --owners amazon \
  --filters "Name=name,Values=al2023-ami-*-x86_64" \
  --query 'sort_by(Images,&CreationDate)[-1].ImageId' --output text)

aws ec2 run-instances \
  --image-id $AMI --instance-type t3.micro \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=web-server}]' \
  --query 'Instances[0].InstanceId' --output text`,
        explanation: "Always tag instances: Name, Environment, Owner, Project. Use SSM Session Manager instead of SSH — no key pairs, no port 22, all sessions logged." },
      { id: "ec22", title: "Bootstrap with user data", type: "command",
        description: "User data script runs at first boot to install software automatically.",
        code: `cat > userdata.sh << 'EOF'
#!/bin/bash
yum update -y
yum install -y nginx
systemctl start nginx
systemctl enable nginx
echo "<h1>Hello from $(hostname)</h1>" > /usr/share/nginx/html/index.html
EOF

aws ec2 run-instances --image-id $AMI --instance-type t3.micro --user-data file://userdata.sh`,
        explanation: "User data runs as root at first boot — perfect for installing packages, configuring services, pulling app code. For complex bootstrapping, use Ansible or Systems Manager." },
    ],
  },
],

// ═══ CLOUD: AWS S3 ═══
"aws-s3": [
  { id: "s3-lab-1", title: "S3: Buckets, Security, and Lifecycle", difficulty: "Beginner", duration: "20 min",
    tools: ["aws-cli"], objective: "Create secure S3 buckets, upload files, configure lifecycle rules",
    interface: "terminal",
    steps: [
      { id: "s31", title: "Create and secure a bucket", type: "command",
        description: "Create a bucket with versioning, encryption, and public access blocked.",
        code: `BUCKET="myapp-$(aws sts get-caller-identity --query Account --output text)"
aws s3api create-bucket --bucket $BUCKET --region ap-south-1 \
  --create-bucket-configuration LocationConstraint=ap-south-1
aws s3api put-public-access-block --bucket $BUCKET \
  --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"
aws s3api put-bucket-versioning --bucket $BUCKET --versioning-configuration Status=Enabled
aws s3api put-bucket-encryption --bucket $BUCKET \
  --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'`,
        explanation: "Block public access at account level for all new buckets. Enable versioning to recover deleted files. Server-side encryption protects data at rest." },
      { id: "s32", title: "Upload and share files", type: "command",
        description: "Copy files to S3 and generate time-limited presigned URLs.",
        code: `echo "Hello S3" > test.txt
aws s3 cp test.txt s3://$BUCKET/data/test.txt
aws s3 sync ./local/ s3://$BUCKET/uploads/ --exclude "*.tmp"
aws s3 ls s3://$BUCKET/ --recursive --human-readable
# Share privately for 1 hour
aws s3 presign s3://$BUCKET/data/test.txt --expires-in 3600`,
        explanation: "s3 sync only transfers changed files. Presigned URLs let you share private objects without changing bucket permissions — URL valid for specified duration then expires." },
    ],
  },
],

// ═══ CLOUD: AWS VPC ═══
"aws-vpc": [
  { id: "vpc-lab-1", title: "Build a Production VPC", difficulty: "Intermediate", duration: "30 min",
    tools: ["aws-cli"], objective: "Create a 3-tier VPC: public, private, and data subnets",
    interface: "terminal",
    steps: [
      { id: "vpc1", title: "Create VPC and subnets", type: "command",
        description: "Build isolated network with public subnets for LBs and private for apps.",
        code: `VPC=$(aws ec2 create-vpc --cidr-block 10.0.0.0/16 --query 'Vpc.VpcId' --output text)
aws ec2 modify-vpc-attribute --vpc-id $VPC --enable-dns-hostnames
PUB=$(aws ec2 create-subnet --vpc-id $VPC --cidr-block 10.0.1.0/24 --availability-zone ap-south-1a --query 'Subnet.SubnetId' --output text)
PRIV=$(aws ec2 create-subnet --vpc-id $VPC --cidr-block 10.0.11.0/24 --availability-zone ap-south-1a --query 'Subnet.SubnetId' --output text)
echo "VPC: $VPC | Public: $PUB | Private: $PRIV"`,
        explanation: "3-tier architecture: Public (internet-facing LBs), Private App (applications), Private Data (databases). Span 2+ AZs for high availability. Use 10.0.0.0/16 for VPC to give 65K IPs." },
      { id: "vpc2", title: "Internet Gateway and NAT", type: "command",
        description: "Connect public subnets to internet. Private subnets get outbound via NAT.",
        code: `IGW=$(aws ec2 create-internet-gateway --query 'InternetGateway.InternetGatewayId' --output text)
aws ec2 attach-internet-gateway --vpc-id $VPC --internet-gateway-id $IGW
PUB_RT=$(aws ec2 create-route-table --vpc-id $VPC --query 'RouteTable.RouteTableId' --output text)
aws ec2 create-route --route-table-id $PUB_RT --destination-cidr-block 0.0.0.0/0 --gateway-id $IGW
aws ec2 associate-route-table --subnet-id $PUB --route-table-id $PUB_RT`,
        explanation: "Internet Gateway: bidirectional internet access (public subnets). NAT Gateway: outbound-only (private subnets for updates/patches). NAT Gateway costs $0.045/hr — turn off in dev/test environments." },
    ],
  },
],

// ═══ DATABASES: MYSQL ═══
"mysql": [
  { id: "mysql-lab-1", title: "MySQL: Schema Design and EXPLAIN", difficulty: "Intermediate", duration: "25 min",
    tools: ["mysql"], objective: "Design tables with proper indexes, write optimized queries, analyze with EXPLAIN",
    interface: "sql-console",
    steps: [
      { id: "my1", title: "Create optimized schema", type: "sql",
        description: "MySQL-specific schema with proper data types, indexes, and constraints.",
        language: "sql",
        code: `CREATE TABLE users (
    id         BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    email      VARCHAR(255) NOT NULL,
    name       VARCHAR(100) NOT NULL,
    status     ENUM('active','inactive') DEFAULT 'active',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_email (email),
    KEY idx_status_created (status, created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users (email, name) VALUES ('alice@example.com', 'Alice'), ('bob@example.com', 'Bob');
SELECT * FROM users;`,
        explanation: "Always use utf8mb4 (not utf8) for full Unicode + emoji. AUTO_INCREMENT for PKs. ON UPDATE CURRENT_TIMESTAMP auto-updates timestamps. Composite indexes: equality columns first." },
      { id: "my2", title: "EXPLAIN query analysis", type: "sql",
        description: "EXPLAIN reveals how MySQL executes queries — find missing indexes.",
        language: "sql",
        code: `-- This shows the execution plan
EXPLAIN SELECT * FROM users WHERE status = 'active' ORDER BY created_at DESC LIMIT 10;
-- type=range or ref = good (index used)
-- type=ALL = bad (full table scan)
-- key=NULL = no index used!

-- Slow query log
-- SET GLOBAL slow_query_log = 1;
-- SET GLOBAL long_query_time = 1;

-- Show all indexes on a table
SHOW INDEX FROM users;`,
        explanation: "type=ALL means MySQL reads every row — dangerous on large tables. type=ref means index used. Extra='Using filesort' means extra sort step needed. Add indexes on frequently filtered/sorted columns." },
    ],
  },
],

// ═══ DATABASES: REDIS ═══
"redis": [
  { id: "redis-lab-1", title: "Redis: Caching, Rate Limiting, Pub/Sub", difficulty: "Intermediate", duration: "30 min",
    tools: ["redis-cli"], objective: "Implement cache-aside pattern, atomic rate limiter, and pub/sub",
    interface: "terminal",
    steps: [
      { id: "r1", title: "Explore all data types", type: "command",
        description: "Redis has 5 core data structures — each optimized for specific use cases.",
        code: `docker run -d --name redis -p 6379:6379 redis:7-alpine
redis-cli

SET user:1:name "Alice"
SETEX session:abc 3600 "user_data"
INCR page_views

HSET user:1 name "Alice" age 30
HGETALL user:1

RPUSH queue task1 task2 task3
LPOP queue

SADD tags python devops k8s
SMEMBERS tags

ZADD leaderboard 1500 alice 1200 bob
ZRANGE leaderboard 0 -1 WITHSCORES REV`,
        explanation: "String: counter/cache. Hash: object. List: queue. Set: unique tags. Sorted Set: leaderboard. Choose the right type — don't store everything as strings." },
      { id: "r2", title: "Cache-aside pattern in Python", type: "code",
        description: "The most common caching pattern: check cache first, miss → load DB → cache it.",
        language: "python",
        code: `import redis, json, time

r = redis.Redis(host='localhost', decode_responses=True)

def get_user(user_id: str) -> dict:
    cache_key = f"user:{user_id}"
    
    # 1. Check cache
    cached = r.get(cache_key)
    if cached:
        print(f"Cache HIT for {user_id}")
        return json.loads(cached)
    
    # 2. Cache miss: load from database (simulated)
    print(f"Cache MISS for {user_id} — loading from DB")
    time.sleep(0.1)  # Simulate DB query latency
    user = {"id": user_id, "name": "Alice", "email": "alice@example.com"}
    
    # 3. Store in cache with 5-minute TTL
    r.setex(cache_key, 300, json.dumps(user))
    return user

# Test
user = get_user("1")  # Cache MISS
user = get_user("1")  # Cache HIT (no DB query!)
print(r.ttl("user:1"), "seconds remaining")`,
        explanation: "Cache-aside: app manages the cache. Write-through: write to cache AND DB. Cache TTL prevents stale data. Cache invalidation (when data changes) is the hard part — delete cache key on update." },
    ],
  },
],

// ═══ DATABASES: MONGODB ═══
"mongodb": [
  { id: "mongo-lab-1", title: "MongoDB: Documents, Aggregation, Indexes", difficulty: "Intermediate", duration: "30 min",
    tools: ["mongosh"], objective: "Work with documents, run aggregation pipelines, optimize with indexes",
    interface: "terminal",
    steps: [
      { id: "mg1", title: "Insert and query documents", type: "command",
        description: "MongoDB stores flexible JSON documents — no rigid schema required.",
        code: `docker run -d --name mongodb -p 27017:27017 mongo:7
mongosh

use ecommerce

db.products.insertMany([
  { name: "Laptop", price: 89999, category: "Electronics", tags: ["portable","work"] },
  { name: "Mouse", price: 2499, category: "Electronics", specs: { dpi: 1600 } },
  { name: "Desk", price: 15999, category: "Furniture", adjustable: true }
])

// Query with filter
db.products.find({ category: "Electronics", price: { $lt: 50000 } })
db.products.find({ tags: "work" })           // Array contains
db.products.find({ "specs.dpi": { $gt: 1000 } })  // Nested field`,
        explanation: "Documents can have different fields — specs exists on Mouse, tags on Laptop. Query nested fields with dot notation. Array queries check if array CONTAINS the value." },
      { id: "mg2", title: "Aggregation pipeline", type: "command",
        description: "MongoDB aggregation is like SQL GROUP BY + JOINs, but more flexible.",
        code: `db.orders.aggregate([
  { $match: { status: "completed" } },
  { $group: {
      _id: "$category",
      revenue: { $sum: "$amount" },
      count: { $count: {} }
  }},
  { $sort: { revenue: -1 } },
  { $limit: 5 }
])

// Explain query for optimization
db.products.find({ category: "Electronics" }).explain("executionStats")
// Look for: "stage": "IXSCAN" (good) vs "COLLSCAN" (full scan, bad)

// Create index to fix COLLSCAN
db.products.createIndex({ category: 1, price: -1 })`,
        explanation: "COLLSCAN = full collection scan = slow. IXSCAN = index scan = fast. The aggregation stages run in order — match early to reduce documents. Always explain() slow queries." },
    ],
  },
],

// ═══ DATABASES: CASSANDRA ═══
"cassandra": [
  { id: "cass-lab-1", title: "Cassandra: Data Modeling and CQL", difficulty: "Intermediate", duration: "30 min",
    tools: ["cqlsh", "nodetool"], objective: "Design tables for your access patterns, insert data, write CQL queries",
    interface: "terminal",
    steps: [
      { id: "cas1", title: "Start Cassandra and connect", type: "command",
        description: "Start a single-node Cassandra for development practice.",
        code: `docker run -d --name cassandra -p 9042:9042 cassandra:4.1
sleep 30   # Wait for startup
cqlsh localhost 9042

CREATE KEYSPACE myapp WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
USE myapp;

nodetool status    # Check cluster health (UN = Up/Normal)`,
        explanation: "Cassandra needs 30-60 seconds to start. Production uses NetworkTopologyStrategy with RF=3. nodetool is Cassandra's admin tool — like kubectl for K8s." },
      { id: "cas2", title: "Model tables around access patterns", type: "command",
        description: "In Cassandra, design the table around your queries — opposite of SQL normalization.",
        code: `-- Access pattern: "Get all messages in a conversation, newest first"
CREATE TABLE messages_by_conversation (
    conversation_id UUID,
    message_time    TIMESTAMP,
    message_id      UUID,
    sender_id       UUID,
    content         TEXT,
    PRIMARY KEY (conversation_id, message_time, message_id)
) WITH CLUSTERING ORDER BY (message_time DESC, message_id ASC)
  AND default_time_to_live = 2592000;   -- Auto-delete after 30 days

-- Insert and query
INSERT INTO messages_by_conversation (conversation_id, message_time, message_id, sender_id, content)
VALUES (uuid(), toTimestamp(now()), uuid(), uuid(), 'Hello!');

SELECT * FROM messages_by_conversation WHERE conversation_id = ? LIMIT 50;`,
        explanation: "Cassandra requires full partition key in WHERE clause. conversation_id is the partition key — all messages for a conversation go to one node. Denormalize heavily — no JOINs in Cassandra!" },
    ],
  },
],

// ═══ DATABASES: DYNAMODB ═══
"dynamodb": [
  { id: "ddb-lab-1", title: "DynamoDB: Single Table Design", difficulty: "Advanced", duration: "30 min",
    tools: ["aws-cli", "python"], objective: "Design a single-table DynamoDB schema that supports multiple access patterns",
    interface: "terminal",
    steps: [
      { id: "ddb1", title: "Create table and load data", type: "command",
        description: "DynamoDB single table design: ALL entities in ONE table using prefixed keys.",
        code: `# Create table with generic PK/SK
aws dynamodb create-table \
  --table-name AppTable \
  --attribute-definitions AttributeName=PK,AttributeType=S AttributeName=SK,AttributeType=S \
  --key-schema AttributeName=PK,KeyType=HASH AttributeName=SK,KeyType=RANGE \
  --billing-mode PAY_PER_REQUEST

# Insert user profile
aws dynamodb put-item --table-name AppTable --item '{"PK":{"S":"USER#alice"},"SK":{"S":"PROFILE"},"name":{"S":"Alice"},"email":{"S":"alice@example.com"}}'

# Insert user's order
aws dynamodb put-item --table-name AppTable --item '{"PK":{"S":"USER#alice"},"SK":{"S":"ORDER#2024-01-15#001"},"total":{"N":"1500"},"status":{"S":"paid"}}'

# Query: get all data for a user (profile + all orders in one request!)
aws dynamodb query --table-name AppTable --key-condition-expression "PK = :pk" --expression-attribute-values '{":pk":{"S":"USER#alice"}}'`,
        explanation: "Single table design: USER#alice as PK retrieves ALL user data in one query. SK prefixes separate entity types. This replaces SQL JOINs with a single highly-efficient DynamoDB query." },
    ],
  },
],

// ═══ DATABASES: ELASTICSEARCH ═══
"elasticsearch": [
  { id: "es-lab-1", title: "Elasticsearch: Search and Analytics", difficulty: "Intermediate", duration: "30 min",
    tools: ["elasticsearch", "curl"], objective: "Index documents, write search queries, create aggregations",
    interface: "terminal",
    steps: [
      { id: "es1", title: "Start Elasticsearch and index data", type: "command",
        description: "Start a single-node Elasticsearch and index some documents.",
        code: `docker run -d --name elasticsearch \
  -e "discovery.type=single-node" -e "xpack.security.enabled=false" \
  -p 9200:9200 elasticsearch:8.11.0

sleep 30
curl -s localhost:9200/_cluster/health?pretty

# Index documents
curl -X POST localhost:9200/products/_doc -H 'Content-Type: application/json' \
  -d '{"name":"Laptop Pro","price":89999,"category":"Electronics","in_stock":true}'
curl -X POST localhost:9200/products/_doc -H 'Content-Type: application/json' \
  -d '{"name":"Wireless Mouse","price":2499,"category":"Electronics","in_stock":true}'
curl -X POST localhost:9200/products/_doc -H 'Content-Type: application/json' \
  -d '{"name":"Standing Desk","price":24999,"category":"Furniture","in_stock":false}'
curl -X POST localhost:9200/products/_refresh`,
        explanation: "Elasticsearch is near-real-time: documents appear in search after 1-second refresh (configurable). Set refresh_interval=-1 during bulk indexing for better performance." },
      { id: "es2", title: "Search and aggregate", type: "command",
        description: "Full-text search, filters, and aggregations — the core Elasticsearch operations.",
        code: `# Full-text search
curl -X GET localhost:9200/products/_search -H 'Content-Type: application/json' -d '{
  "query": {"match": {"name": "wireless laptop"}}
}'

# Bool query: filter + full-text
curl -X GET localhost:9200/products/_search -H 'Content-Type: application/json' -d '{
  "query": {"bool": {
    "must": [{"match": {"category": "Electronics"}}],
    "filter": [{"range": {"price": {"lte": 50000}}}, {"term": {"in_stock": true}}]
  }},
  "sort": [{"price": "asc"}]
}'

# Aggregation: revenue by category
curl -X GET localhost:9200/products/_search -H 'Content-Type: application/json' -d '{
  "size": 0,
  "aggs": {"by_category": {"terms": {"field": "category.keyword"},
    "aggs": {"avg_price": {"avg": {"field": "price"}}}}}
}'`,
        explanation: "must: affects relevance score. filter: must match but no scoring (faster, cached). Use filter for exact matches (status, date, tags). Use must for full-text queries." },
    ],
  },
],

// ═══ DATABASES: ORACLE ═══
"oracle": [
  { id: "ora-lab-1", title: "Oracle PL/SQL Fundamentals", difficulty: "Advanced", duration: "35 min",
    tools: ["sqlplus", "oracle"], objective: "Write PL/SQL procedures, use cursors, handle exceptions",
    interface: "sql-console",
    steps: [
      { id: "ora1", title: "Create tables and PL/SQL block", type: "sql",
        description: "Oracle-specific: PL/SQL blocks, DUAL table, sequences, and DATE functions.",
        language: "sql",
        code: `-- Oracle-specific: use DUAL for expressions
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS') FROM DUAL;

-- Create sequence (Oracle's auto-increment)
CREATE SEQUENCE emp_seq START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE TABLE employees (
    id         NUMBER DEFAULT emp_seq.NEXTVAL PRIMARY KEY,
    name       VARCHAR2(100) NOT NULL,
    salary     NUMBER(10,2),
    dept       VARCHAR2(50),
    hire_date  DATE DEFAULT SYSDATE
);

INSERT INTO employees (name, salary, dept) VALUES ('Alice', 85000, 'Engineering');
INSERT INTO employees (name, salary, dept) VALUES ('Bob', 72000, 'Marketing');
COMMIT;

SELECT * FROM employees;`,
        explanation: "Oracle uses DUAL (dummy table) for expressions without a real table. Sequences replace MySQL's AUTO_INCREMENT. DATE in Oracle includes time. Always COMMIT after DML — Oracle doesn't auto-commit." },
      { id: "ora2", title: "Write a PL/SQL procedure", type: "sql",
        description: "PL/SQL adds procedural logic to SQL — variables, conditionals, loops, exceptions.",
        language: "sql",
        code: `-- PL/SQL anonymous block
SET SERVEROUTPUT ON;

DECLARE
    v_count    NUMBER;
    v_avg_sal  NUMBER;
BEGIN
    SELECT COUNT(*), AVG(salary)
    INTO v_count, v_avg_sal
    FROM employees;
    
    DBMS_OUTPUT.PUT_LINE('Employees: ' || v_count);
    DBMS_OUTPUT.PUT_LINE('Avg Salary: ' || ROUND(v_avg_sal, 2));
    
    IF v_avg_sal > 80000 THEN
        DBMS_OUTPUT.PUT_LINE('High salary company!');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/`,
        explanation: "PL/SQL blocks: DECLARE (variables), BEGIN (logic), EXCEPTION (error handling), END. SELECT INTO fetches one row — raises NO_DATA_FOUND if 0 rows, TOO_MANY_ROWS if multiple. WHEN OTHERS catches all other errors." },
    ],
  },
],

// ═══ AI: OPENAI LAB ═══
"openai": [
  { id: "openai-lab-1", title: "OpenAI API: Chat, Functions, and Vision", difficulty: "Intermediate", duration: "30 min",
    tools: ["python", "openai"], objective: "Call GPT-4o-mini, use function calling for structured output, analyze images",
    interface: "code-editor",
    steps: [
      { id: "ai1", title: "Basic chat completion", type: "code",
        description: "Your first OpenAI API call — understand the request and response structure.",
        language: "python",
        code: `from openai import OpenAI
client = OpenAI()  # Uses OPENAI_API_KEY env var

response = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[
        {"role": "system", "content": "You are a helpful DevOps expert. Be concise and practical."},
        {"role": "user", "content": "What is a Kubernetes Pod? Give a 3-bullet summary."}
    ],
    max_tokens=200,
    temperature=0.7
)

print("Answer:", response.choices[0].message.content)
print(f"Tokens: " + str(response.usage.prompt_tokens) + " in + " + str(response.usage.completion_tokens) + " out")
cost = (response.usage.prompt_tokens * 0.00015 + response.usage.completion_tokens * 0.0006) / 1000
print(f"Cost: {cost:.6f}")`,
        explanation: "gpt-4o-mini: cheapest ($0.15/1M input). temperature=0: deterministic. temperature=1: creative. Track token usage — costs scale with volume." },
      { id: "ai2", title: "Function calling for structured output", type: "code",
        description: "Force GPT to return JSON matching your exact schema — more reliable than asking in the prompt.",
        language: "python",
        code: `from openai import OpenAI
import json
client = OpenAI()

tools = [{"type": "function", "function": {
    "name": "extract_incident_info",
    "description": "Extract structured info from an incident report",
    "parameters": {
        "type": "object",
        "properties": {
            "severity": {"type": "string", "enum": ["P1","P2","P3","P4"]},
            "services": {"type": "array", "items": {"type": "string"}},
            "root_cause": {"type": "string"},
            "users_impacted": {"type": "integer"}
        },
        "required": ["severity", "services", "root_cause"]
    }
}}]

incident = "At 14:30, payment service returned 500 errors. DB connections exhausted. ~2000 users affected. Fixed by increasing pool size."

response = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[{"role":"user","content":f"Extract info from: {incident}"}],
    tools=tools,
    tool_choice={"type":"function","name":"extract_incident_info"}
)

result = json.loads(response.choices[0].message.tool_calls[0].function.arguments)
print(json.dumps(result, indent=2))`,
        explanation: "tool_choice forces a specific function call, guaranteeing structured output. Better than asking 'respond in JSON' which the model may not follow consistently." },
    ],
  },
],

// ═══ AI: PROMPT ENGINEERING ═══
"prompt-engineering": [
  { id: "pe-lab-1", title: "Prompting Techniques That Actually Work", difficulty: "Beginner", duration: "25 min",
    tools: ["python", "anthropic"], objective: "Compare zero-shot, few-shot, CoT, and structured output — see the difference",
    interface: "code-editor",
    steps: [
      { id: "pe1", title: "Zero-shot vs Few-shot", type: "code",
        description: "Adding examples (few-shot) dramatically improves output consistency.",
        language: "python",
        code: `import anthropic
client = anthropic.Anthropic()

def ask(prompt):
    r = client.messages.create(model="claude-haiku-4-5-20251001", max_tokens=200,
        messages=[{"role":"user","content":prompt}])
    return r.content[0].text

review = "Product is great but delivery was slow and packaging was damaged"

print("ZERO-SHOT (just ask):")
print(ask(f"What is the sentiment of this review? {review}"))

print("\nFEW-SHOT (with examples):")
print(ask(f"""Classify review as POSITIVE, NEGATIVE, or MIXED.

"Amazing product, fast shipping!" → POSITIVE
"Terrible quality, broke in a day" → NEGATIVE  
"Good product but arrived late" → MIXED

"{review}" →"""))

print("\nCHAIN-OF-THOUGHT:")
print(ask(f"""Analyze this review step-by-step:
1. What does the customer like?
2. What are their complaints?
3. Overall sentiment?

Review: {review}"""))`,
        explanation: "Few-shot examples constrain the output format and improve accuracy. CoT (chain-of-thought) makes the model reason explicitly before concluding. Always test multiple approaches on your specific task." },
    ],
  },
],

// ═══ AI: LANGCHAIN LAB ═══
"langchain": [
  { id: "lc-lab-1", title: "LangChain: RAG in 50 Lines", difficulty: "Intermediate", duration: "25 min",
    tools: ["python", "langchain"], objective: "Build a complete RAG pipeline: load → chunk → embed → retrieve → answer",
    interface: "code-editor",
    steps: [
      { id: "lc1", title: "Complete RAG pipeline", type: "code",
        description: "Full RAG in one script — from documents to answers.",
        language: "python",
        code: `# pip install langchain langchain-openai langchain-community chromadb
from langchain.document_loaders import TextLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_openai import OpenAIEmbeddings, ChatOpenAI
from langchain_community.vectorstores import Chroma
from langchain.chains import RetrievalQA

# 1. Load document
with open("devops-guide.txt", "w") as f:
    f.write("Kubernetes is a container orchestration platform. Pods are the smallest deployable unit. Deployments manage replica sets. Services expose pods via stable DNS names. ConfigMaps store config. Secrets store sensitive data. HPA autoscales pods based on CPU/memory.")

docs = TextLoader("devops-guide.txt").load()

# 2. Split into chunks
chunks = RecursiveCharacterTextSplitter(chunk_size=200, chunk_overlap=20).split_documents(docs)
print(f"Split into {len(chunks)} chunks")

# 3. Embed and store
vectorstore = Chroma.from_documents(chunks, OpenAIEmbeddings(model="text-embedding-3-small"))

# 4. Create RAG chain
qa = RetrievalQA.from_chain_type(
    llm=ChatOpenAI(model="gpt-4o-mini"),
    retriever=vectorstore.as_retriever(search_kwargs={"k": 3}),
    return_source_documents=True
)

# 5. Ask questions
result = qa.invoke({"query": "What is a Kubernetes Pod?"})
print("Answer:", result["result"])
print("Sources:", len(result["source_documents"]), "chunks retrieved")`,
        explanation: "This is the complete RAG loop. In production: use a persistent vector store (Chroma with disk/Pinecone), add reranking, implement chat history, and cache embeddings." },
    ],
  },
],

// ═══ AI: RAG LAB ═══
"rag": [
  { id: "rag-lab-1", title: "Production RAG: Hybrid Search + Reranking", difficulty: "Advanced", duration: "30 min",
    tools: ["python"], objective: "Build RAG with hybrid search and cross-encoder reranking for 30% better accuracy",
    interface: "code-editor",
    steps: [
      { id: "rag1", title: "Hybrid search pipeline", type: "code",
        description: "Combine semantic search (dense) and keyword search (sparse) for better retrieval.",
        language: "python",
        code: `# pip install langchain langchain-openai rank-bm25 sentence-transformers chromadb
from langchain_openai import OpenAIEmbeddings
from langchain_community.vectorstores import Chroma
from langchain_community.retrievers import BM25Retriever
from langchain.retrievers import EnsembleRetriever
from sentence_transformers import CrossEncoder

# Setup
docs = load_your_documents()  # List of LangChain Documents
embeddings = OpenAIEmbeddings(model="text-embedding-3-small")

# Dense retriever (semantic)
dense = Chroma.from_documents(docs, embeddings).as_retriever(search_kwargs={"k": 10})

# Sparse retriever (BM25 keyword)
sparse = BM25Retriever.from_documents(docs, k=10)

# Hybrid: combine both
hybrid = EnsembleRetriever(retrievers=[dense, sparse], weights=[0.6, 0.4])

# Reranker: more accurate second-stage scoring
reranker = CrossEncoder("cross-encoder/ms-marco-MiniLM-L-6-v2")

def retrieve(query: str, k=5):
    candidates = hybrid.invoke(query)[:20]  # Get 20 candidates
    scores = reranker.predict([(query, d.page_content) for d in candidates])
    ranked = sorted(zip(scores, candidates), reverse=True)
    return [doc for _, doc in ranked[:k]]   # Return top-k

results = retrieve("how to debug kubernetes pod crashes?")
print(f"Retrieved {len(results)} relevant chunks")`,
        explanation: "Two-stage: fast retrieval (20 candidates) → accurate reranking (top 5). Cross-encoder is 10x slower but 30% more accurate than bi-encoder. This pipeline handles both exact keyword and semantic queries." },
    ],
  },
],

// ═══ AI: AI AGENTS ═══
"ai-agents": [
  { id: "agents-lab-1", title: "Build an Autonomous DevOps Agent", difficulty: "Advanced", duration: "35 min",
    tools: ["python", "anthropic"], objective: "Create an agent that uses tools to diagnose infrastructure issues",
    interface: "code-editor",
    steps: [
      { id: "ag1", title: "Define tools and run the agent loop", type: "code",
        description: "Tools give the AI capabilities. The loop: think → act → observe → repeat.",
        language: "python",
        code: `import anthropic, subprocess, json
client = anthropic.Anthropic()

tools = [
    {"name": "run_command", "description": "Execute a bash diagnostic command",
     "input_schema": {"type": "object", "properties": {
         "command": {"type": "string"}}, "required": ["command"]}},
    {"name": "check_kubernetes", "description": "Check K8s resource status",
     "input_schema": {"type": "object", "properties": {
         "resource": {"type": "string", "enum": ["pods","deployments","events"]},
         "namespace": {"type": "string", "default": "default"}}, "required": ["resource"]}},
]

def execute(name, inputs):
    if name == "run_command":
        r = subprocess.run(inputs["command"], shell=True, capture_output=True, text=True, timeout=10)
        return r.stdout + r.stderr or "(no output)"
    elif name == "check_kubernetes":
        r = subprocess.run(f"kubectl get {inputs['resource']} -n {inputs.get('namespace','default')}",
                          shell=True, capture_output=True, text=True)
        return r.stdout + r.stderr

def agent(task: str, max_steps=10):
    messages = [{"role": "user", "content": task}]
    for _ in range(max_steps):
        r = client.messages.create(model="claude-sonnet-4-6", max_tokens=2048,
            tools=tools, messages=messages,
            system="You are a DevOps expert. Use tools to investigate issues. Think step by step.")
        messages.append({"role": "assistant", "content": r.content})
        if r.stop_reason == "end_turn":
            return next(b.text for b in r.content if hasattr(b,"text"))
        results = [{"type":"tool_result","tool_use_id":b.id,"content":execute(b.name,b.input)}
                   for b in r.content if b.type=="tool_use"]
        messages.append({"role":"user","content":results})

print(agent("The API is slow. Check what's consuming the most CPU and memory on this system."))`,
        explanation: "The agent loop is simple: call API → if tool_use, execute tools and send results back → repeat until end_turn. The model decides which tools to call based on what it observes." },
    ],
  },
],

// ═══ AI: AI FUNDAMENTALS ═══
"ai-fundamentals": [
  { id: "aif-lab-1", title: "Anthropic Claude API Complete Guide", difficulty: "Beginner", duration: "25 min",
    tools: ["python", "anthropic"], objective: "Master Claude API: basic calls, streaming, vision, tool use, cost tracking",
    interface: "code-editor",
    steps: [
      { id: "aif1", title: "Core API patterns", type: "code",
        description: "All the patterns you need for production Claude applications.",
        language: "python",
        code: `import anthropic, base64
client = anthropic.Anthropic()

# 1. Basic call
r = client.messages.create(
    model="claude-haiku-4-5-20251001",
    max_tokens=500,
    system="You are a helpful DevOps expert.",
    messages=[{"role":"user","content":"What is Docker in one paragraph?"}]
)
print("Answer:", r.content[0].text)
print(f"Cost: ~\${(r.usage.input_tokens*0.00025 + r.usage.output_tokens*0.00125)/1000:.6f}")

# 2. Multi-turn conversation
messages = []
for question in ["What is Kubernetes?", "How does it differ from Docker Swarm?"]:
    messages.append({"role":"user","content":question})
    r = client.messages.create(model="claude-haiku-4-5-20251001", max_tokens=200, messages=messages)
    reply = r.content[0].text
    messages.append({"role":"assistant","content":reply})
    print(f"Q: {question}\nA: {reply[:100]}...\n")

# 3. Streaming (don't wait for full response)
with client.messages.stream(
    model="claude-haiku-4-5-20251001", max_tokens=200,
    messages=[{"role":"user","content":"List 5 Linux commands for DevOps"}]
) as stream:
    for chunk in stream.text_stream:
        print(chunk, end="", flush=True)`,
        explanation: "Use haiku for development (cheapest). Upgrade to sonnet for production quality. Always stream long responses for better UX. Track costs from usage.input_tokens and usage.output_tokens." },
    ],
  },
],

// ═══ AI: LLMOPS ═══
"llmops": [
  { id: "llmops-lab-1", title: "LLMOps: Evaluate and Monitor AI Systems", difficulty: "Advanced", duration: "30 min",
    tools: ["python"], objective: "Build evaluation pipeline, track costs, implement guardrails",
    interface: "code-editor",
    steps: [
      { id: "llm1", title: "Automated evaluation pipeline", type: "code",
        description: "Run automated evals to catch regressions before deploying prompt changes.",
        language: "python",
        code: `import anthropic
from dataclasses import dataclass

client = anthropic.Anthropic()

@dataclass
class EvalCase:
    name: str
    input: str
    must_contain: list[str]
    must_not_contain: list[str] = None

def run_evals(system_prompt: str, cases: list[EvalCase], model="claude-haiku-4-5-20251001"):
    results = []
    total_cost = 0.0
    
    for case in cases:
        r = client.messages.create(model=model, max_tokens=500,
            system=system_prompt, messages=[{"role":"user","content":case.input}])
        
        output = r.content[0].text
        total_cost += (r.usage.input_tokens * 0.00025 + r.usage.output_tokens * 0.00125) / 1000
        
        keyword_pass = all(kw.lower() in output.lower() for kw in case.must_contain)
        ban_pass = not any(w.lower() in output.lower() for w in (case.must_not_contain or []))
        passed = keyword_pass and ban_pass
        
        results.append({"case": case.name, "passed": passed})
        print(f"{'✅' if passed else '❌'} {case.name}")
    
    pass_rate = sum(r['passed'] for r in results) / len(results) * 100
    print(f"\nPass rate: {pass_rate:.0f}% | Cost: \${total_cost:.4f}")
    return results

SYSTEM = "You are a helpful DevOps expert. Be accurate, concise, and include code examples."

cases = [
    EvalCase("Docker basics", "What is Docker?", ["container","image"], ["wrong","incorrect"]),
    EvalCase("K8s pod", "What is a Kubernetes Pod?", ["container","pod","namespace"]),
    EvalCase("No hallucination", "What is the latest Kubernetes version?", ["version","kubernetes"]),
]

run_evals(SYSTEM, cases)`,
        explanation: "Run evals on every prompt change. Compare old vs new with identical test cases. If pass rate drops >5%, investigate which cases broke. Track cost per eval to budget testing." },
    ],
  },
],

// ═══ DATA: PANDAS ═══
"pandas": [
  { id: "pd-lab-1", title: "Pandas: Real Data Analysis Workflow", difficulty: "Intermediate", duration: "30 min",
    tools: ["python", "pandas"], objective: "Load, clean, transform, analyze real data and generate insights",
    interface: "code-editor",
    steps: [
      { id: "pd1", title: "Load and profile data", type: "code",
        description: "Always start by understanding your data before analyzing it.",
        language: "python",
        code: `import pandas as pd
import numpy as np

# Create realistic sales dataset
np.random.seed(42)
df = pd.DataFrame({
    'date': pd.date_range('2024-01-01', periods=1000, freq='h'),
    'product': np.random.choice(['Laptop','Mouse','Keyboard','Monitor'], 1000),
    'category': np.random.choice(['Electronics','Accessories'], 1000),
    'quantity': np.random.randint(1, 10, 1000),
    'price': np.random.choice([89999, 2499, 4999, 45999], 1000),
    'region': np.random.choice(['North','South','East','West'], 1000),
    'returned': np.random.choice([True, False], 1000, p=[0.05, 0.95])
})
# Introduce some missing values
df.loc[np.random.choice(1000, 50), 'quantity'] = np.nan

print("Shape:", df.shape)
print("\nDtypes:\n", df.dtypes)
print("\nMissing values:\n", df.isnull().sum())
print("\nSample:\n", df.head())
print("\nStats:\n", df.describe())`,
        explanation: "Profile first: shape (rows/cols), dtypes (number vs string), missing values, and basic stats. This tells you data quality issues before wasting time on bad analysis." },
      { id: "pd2", title: "Clean and analyze", type: "code",
        description: "Handle missing data and generate business insights with groupby.",
        language: "python",
        code: `# Handle missing values
df['quantity'] = df['quantity'].fillna(df.groupby('product')['quantity'].transform('median'))
df['revenue'] = df['quantity'] * df['price']

# Time-based analysis
df['month'] = df['date'].dt.month
df['hour'] = df['date'].dt.hour
df['weekday'] = df['date'].dt.day_name()

print("=== REVENUE BY PRODUCT ===")
by_product = df.groupby('product').agg(
    revenue=('revenue','sum'),
    units=('quantity','sum'),
    orders=('product','count'),
    return_rate=('returned','mean')
).sort_values('revenue', ascending=False)
print(by_product.round(2))

print("\n=== PEAK HOURS ===")
print(df.groupby('hour')['revenue'].mean().nlargest(5))

print("\n=== REGIONAL PERFORMANCE ===")
print(df.pivot_table(values='revenue', index='region', columns='category', aggfunc='sum').round(0))`,
        explanation: "fillna with group median is smarter than overall median. agg() with named aggregations is readable. pivot_table creates cross-tabulations. nlargest() is faster than sort_values().head()." },
    ],
  },
],

// ═══ DATA: EXCEL ═══
"excel": [
  { id: "excel-lab-1", title: "Excel: VLOOKUP, Pivot Tables, Dashboard", difficulty: "Beginner", duration: "20 min",
    tools: ["excel"], objective: "Master the three most valuable Excel skills for data analysis",
    interface: "none",
    steps: [
      { id: "ex1", title: "VLOOKUP and XLOOKUP", type: "info",
        description: "The most-used Excel functions — look up values across tables.",
        code: `-- VLOOKUP syntax:
=VLOOKUP(lookup_value, table_array, col_index_num, [range_lookup])

-- Example: Find employee salary from salary table
=VLOOKUP(A2, SalaryTable!A:C, 3, FALSE)
-- A2: Employee ID to look up
-- SalaryTable!A:C: Where to search (first column = ID, third = Salary)
-- 3: Return 3rd column
-- FALSE: Exact match (always use FALSE!)

-- XLOOKUP (Excel 365) - better alternative:
=XLOOKUP(A2, SalaryTable!A:A, SalaryTable!C:C, "Not Found")
-- Simpler syntax, no column counting
-- Returns "Not Found" if no match

-- INDEX+MATCH (works in all Excel versions):
=INDEX(SalaryTable!C:C, MATCH(A2, SalaryTable!A:A, 0))`,
        explanation: "VLOOKUP limitation: can only look right. Use XLOOKUP or INDEX/MATCH for flexibility. The most common error: forgetting FALSE at the end (FALSE=exact match, TRUE=approximate)." },
      { id: "ex2", title: "PivotTable for instant summaries", type: "info",
        description: "Turn thousands of rows into insights in 60 seconds.",
        code: `Steps to create a PivotTable:
1. Click any cell in your data
2. Insert → PivotTable → New Worksheet (OK)
3. Drag fields to areas:
   ROWS:    What to group by (Product, Region)
   COLUMNS: Optional cross-tab (Month, Year)
   VALUES:  What to calculate (Sum of Sales)
   FILTERS: Top-level filter (Year, Department)

Useful features:
  - Values As → % of Grand Total (instant market share)
  - Group dates by Month/Quarter (right-click date → Group)
  - Slicers: Insert → Slicer (interactive filter buttons)
  - Calculated Field: Analyze → Fields → Profit Margin = Revenue - Cost

PivotChart:
  - Click PivotTable → Insert → PivotChart
  - Chart updates when you change PivotTable filters`,
        explanation: "PivotTables don't modify source data — safe to experiment. Refresh with right-click → Refresh when data changes. Master PivotTables and you can answer 80% of business analysis questions." },
    ],
  },
],

// ═══ DATA: POWER BI ═══
"power-bi": [
  { id: "pbi-lab-1", title: "Power BI: DAX and Dashboard Design", difficulty: "Intermediate", duration: "30 min",
    tools: ["power-bi-desktop"], objective: "Write DAX measures, create relationships, build an interactive dashboard",
    interface: "none",
    steps: [
      { id: "pbi1", title: "Essential DAX measures", type: "code",
        description: "DAX is Power BI's formula language — master these patterns for any dashboard.",
        language: "sql",
        code: `-- Basic aggregation measures
Total Revenue = SUM(Sales[Amount])
Total Orders = COUNTROWS(Sales)
Avg Order Value = DIVIDE([Total Revenue], [Total Orders], 0)

-- Time intelligence (requires a proper Date table!)
Revenue MTD = TOTALMTD([Total Revenue], 'Date'[Date])
Revenue YTD = TOTALYTD([Total Revenue], 'Date'[Date])
Revenue LY = CALCULATE([Total Revenue], SAMEPERIODLASTYEAR('Date'[Date]))
YoY Growth % = DIVIDE([Total Revenue] - [Revenue LY], [Revenue LY])

-- Conditional measures
High Value Orders = CALCULATE([Total Orders], Sales[Amount] > 10000)

-- Using CALCULATE (most powerful DAX function)
-- Modifies the filter context
North Revenue = CALCULATE([Total Revenue], Geography[Region] = "North")

-- Rank products by revenue
Product Rank = RANKX(ALL('Product'), [Total Revenue], , DESC)

-- Variables for readability
Profit Margin =
VAR Revenue = [Total Revenue]
VAR Cost = SUM(Sales[Cost])
RETURN DIVIDE(Revenue - Cost, Revenue, 0)`,
        explanation: "CALCULATE is the heart of DAX — it changes the filter context. Time intelligence functions require a marked Date table with continuous dates. DIVIDE handles division by zero gracefully." },
      { id: "pbi2", title: "Dashboard design principles", type: "info",
        description: "Apply these 5 rules to create dashboards executives actually use.",
        code: `5 Rules for Effective Power BI Dashboards:

1. ONE KEY MESSAGE per dashboard
   Bad:  "Sales Dashboard" (everything)
   Good: "Which regions need intervention this quarter?"

2. MOST IMPORTANT METRIC → TOP LEFT
   Eyes track top-left first. Put your KPIs there.
   Card visuals for: Revenue, Orders, Growth %, Target %

3. CONSISTENT COLORS
   Green = good/positive, Red = bad/negative, Blue = neutral
   Never use rainbow colors — one color family per chart

4. MAXIMIZE DATA-INK RATIO
   Remove: gridlines, borders, background colors
   Keep: only what carries information
   White space is your friend

5. SLICERS ARE FREE REAL ESTATE
   Date slicer (Timeline): filter everything by date
   Region slicer: connected to all visuals at once
   Sync slicers across pages: View → Sync Slicers`,
        explanation: "Most dashboards fail not because of wrong data but poor design. Executives stop using dashboards that are cluttered or require too much work to extract insight." },
    ],
  },
],

// ═══ DATA: TABLEAU ═══
"tableau": [
  { id: "tab-lab-1", title: "Tableau: Charts, Filters, and LOD", difficulty: "Intermediate", duration: "30 min",
    tools: ["tableau-desktop"], objective: "Build calculated fields, use LOD expressions, create interactive dashboards",
    interface: "none",
    steps: [
      { id: "tab1", title: "Calculated fields", type: "code",
        description: "Tableau's formula language for custom metrics and categorizations.",
        language: "sql",
        code: `// Basic calculations
Revenue = [Quantity] * [Unit Price]
Profit Margin = [Profit] / [Revenue]
Days Since Order = DATEDIFF('day', [Order Date], TODAY())

// Conditional (IF/ELSE)
Customer Tier =
IF [Revenue] > 100000 THEN "Platinum"
ELSEIF [Revenue] > 50000 THEN "Gold"
ELSEIF [Revenue] > 10000 THEN "Silver"
ELSE "Bronze" END

// String manipulation
Full Name = UPPER([First Name]) + " " + UPPER([Last Name])
Email Domain = MID([Email], FIND("@", [Email]) + 1, LEN([Email]))

// LOD (Level of Detail) expressions
// FIXED: compute at specific granularity regardless of view
Customer Lifetime Value = {FIXED [Customer ID]: SUM([Revenue])}

// Revenue as % of customer's total
Revenue Share = [Revenue] / {FIXED [Customer ID]: SUM([Revenue])}

// INCLUDE: add detail
Avg Customer Revenue Per Region = {INCLUDE [Customer ID]: AVG(SUM([Revenue]))}`,
        explanation: "LOD expressions are Tableau's superpower. FIXED ignores the current view's granularity. Use it for: % of total, customer averages, cohort analysis. Test with Explain Data to verify calculations." },
    ],
  },
],

// ═══ SECURITY: NETWORK SECURITY ═══
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
"aws-rds": [
  { id: "rds-lab-1", title: "AWS RDS: Deploy and Manage PostgreSQL", difficulty: "Intermediate", duration: "25 min",
    tools: ["aws-cli", "psql"], objective: "Launch RDS PostgreSQL, configure security, connect, create snapshots",
    interface: "terminal",
    steps: [
      { id: "rds1", title: "Launch an RDS instance", type: "command",
        description: "Create a production-grade RDS PostgreSQL instance with Multi-AZ.",
        code: `aws rds create-db-instance \
  --db-instance-identifier prod-postgres \
  --db-instance-class db.t3.medium \
  --engine postgres \
  --engine-version 16.1 \
  --master-username dbadmin \
  --master-user-password "$(openssl rand -base64 16)" \
  --allocated-storage 100 \
  --storage-type gp3 \
  --multi-az \
  --no-publicly-accessible \
  --backup-retention-period 7 \
  --deletion-protection

aws rds wait db-instance-available --db-instance-identifier prod-postgres
aws rds describe-db-instances --db-instance-identifier prod-postgres   --query 'DBInstances[0].[DBInstanceStatus,Endpoint.Address,MultiAZ]'`,
        explanation: "Multi-AZ: standby replica in another AZ, automatic failover in 1-2 min. no-publicly-accessible: only reachable from within VPC. deletion-protection prevents accidental deletion. backup-retention: 7 days of automated backups." },
      { id: "rds2", title: "Connect and manage database", type: "command",
        description: "Connect via psql, create databases, and monitor performance.",
        code: `ENDPOINT=$(aws rds describe-db-instances --db-instance-identifier prod-postgres --query 'DBInstances[0].Endpoint.Address' --output text)
psql -h $ENDPOINT -U dbadmin -d postgres

CREATE DATABASE myapp;
CREATE USER appuser WITH PASSWORD 'strong-password-here';
GRANT ALL PRIVILEGES ON DATABASE myapp TO appuser;

# Monitor
aws rds describe-db-log-files --db-instance-identifier prod-postgres
aws cloudwatch get-metric-statistics   --namespace AWS/RDS --metric-name DatabaseConnections   --dimensions Name=DBInstanceIdentifier,Value=prod-postgres   --start-time $(date -u -d '1 hour ago' +%Y-%m-%dT%H:%M:%SZ)   --end-time $(date -u +%Y-%m-%dT%H:%M:%SZ)   --period 60 --statistics Maximum`,
        explanation: "Never use master user for application connections. Create a dedicated app user with minimal privileges. Monitor: DatabaseConnections, CPUUtilization, FreeStorageSpace, ReadLatency, WriteLatency." },
    ],
  },
],

// ═══ CLOUD: AWS LAMBDA ═══
"aws-lambda": [
  { id: "lambda-lab-1", title: "AWS Lambda: Serverless Functions", difficulty: "Intermediate", duration: "25 min",
    tools: ["aws-cli", "python"], objective: "Deploy a Lambda function, trigger it, handle events, monitor logs",
    interface: "terminal",
    steps: [
      { id: "lam1", title: "Create and deploy a Lambda function", type: "command",
        description: "Deploy a Python Lambda that processes S3 events.",
        code: `cat > lambda_function.py << 'EOF'
import json
import boto3

def lambda_handler(event, context):
    print(f"Event: {json.dumps(event)}")
    
    # Process S3 event
    for record in event.get('Records', []):
        bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        print(f"Processing: s3://{bucket}/{key}")
    
    return {'statusCode': 200, 'body': json.dumps('OK')}
EOF

zip function.zip lambda_function.py

aws lambda create-function   --function-name process-uploads   --runtime python3.12   --role arn:aws:iam::ACCOUNT:role/LambdaBasicRole   --handler lambda_function.lambda_handler   --zip-file fileb://function.zip   --timeout 30   --memory-size 256   --environment "Variables={LOG_LEVEL=INFO}"`,
        explanation: "Lambda auto-scales: 0 to 10,000 concurrent executions. Pricing: pay only when running (no idle cost). timeout: max 15 minutes. memory-size: more memory = more CPU (vCPU scales linearly with memory)." },
      { id: "lam2", title: "Invoke and monitor Lambda", type: "command",
        description: "Test the function, check logs, set up alarms.",
        code: `# Invoke directly
aws lambda invoke   --function-name process-uploads   --payload '{"Records":[{"s3":{"bucket":{"name":"my-bucket"},"object":{"key":"test.csv"}}}]}'   --cli-binary-format raw-in-base64-out   output.json
cat output.json

# Check logs
aws logs tail /aws/lambda/process-uploads --follow --since 5m

# Monitor errors
aws cloudwatch get-metric-statistics   --namespace AWS/Lambda   --metric-name Errors   --dimensions Name=FunctionName,Value=process-uploads   --start-time $(date -u -d '1 hour ago' +%Y-%m-%dT%H:%M:%SZ)   --end-time $(date -u +%Y-%m-%dT%H:%M:%SZ)   --period 60 --statistics Sum`,
        explanation: "Lambda logs go to CloudWatch Logs automatically. Key metrics: Duration (latency), Errors (failures), Throttles (concurrent limit hit), ConcurrentExecutions. Set alarms on Errors > 0 for production functions." },
    ],
  },
],

// ═══ CLOUD: AWS EKS ═══
"aws-eks": [
  { id: "eks-lab-1", title: "AWS EKS: Managed Kubernetes", difficulty: "Advanced", duration: "35 min",
    tools: ["aws-cli", "kubectl", "eksctl"], objective: "Create EKS cluster, deploy workloads, configure autoscaling",
    interface: "terminal",
    steps: [
      { id: "eks1", title: "Create EKS cluster with eksctl", type: "command",
        description: "eksctl is the official CLI for creating EKS clusters — simplifies the process significantly.",
        code: `cat > cluster.yaml << 'EOF'
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig
metadata:
  name: prod-cluster
  region: ap-south-1
  version: "1.30"

managedNodeGroups:
  - name: workers
    instanceType: t3.medium
    desiredCapacity: 2
    minSize: 1
    maxSize: 10
    privateNetworking: true
    labels: {role: worker}
    tags:
      Environment: production

addons:
  - name: vpc-cni
  - name: coredns
  - name: kube-proxy
  - name: aws-ebs-csi-driver
EOF

eksctl create cluster -f cluster.yaml
aws eks update-kubeconfig --name prod-cluster --region ap-south-1`,
        explanation: "eksctl creates VPC, subnets, IAM roles, and the cluster. privateNetworking: nodes in private subnets (no public IP). Managed node groups handle OS patching and node replacement automatically." },
      { id: "eks2", title: "Deploy and autoscale", type: "command",
        description: "Deploy an app with HPA for CPU-based autoscaling.",
        code: `kubectl apply -f - <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webapp
spec:
  replicas: 2
  selector:
    matchLabels: {app: webapp}
  template:
    metadata:
      labels: {app: webapp}
    spec:
      containers:
      - name: webapp
        image: nginx:alpine
        resources:
          requests: {cpu: "100m", memory: "128Mi"}
          limits:   {cpu: "200m", memory: "256Mi"}
---
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: webapp-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: webapp
  minReplicas: 2
  maxReplicas: 20
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70
EOF
kubectl get hpa`,
        explanation: "HPA scales pods based on CPU/memory metrics. Resource requests are required for HPA to work — it compares actual usage to requested CPU%. Cluster Autoscaler or Karpenter scales nodes when pods can't be scheduled." },
    ],
  },
],

// ═══ CLOUD: CLOUDFORMATION ═══
"cloudformation": [
  { id: "cfn-lab-1", title: "CloudFormation: Infrastructure as YAML", difficulty: "Intermediate", duration: "25 min",
    tools: ["aws-cli"], objective: "Write a CloudFormation template, deploy a stack, update and rollback",
    interface: "terminal",
    steps: [
      { id: "cfn1", title: "Write and deploy a stack", type: "command",
        description: "Create an EC2 with security group using CloudFormation.",
        code: `cat > template.yaml << 'EOF'
AWSTemplateFormatVersion: '2010-09-09'
Parameters:
  EnvironmentName:
    Type: String
    Default: dev
    AllowedValues: [dev, staging, prod]

Resources:
  WebSecurityGroup:
    Type: AWS::EC2::SecurityGroup
    Properties:
      GroupDescription: !Sub "\${EnvironmentName} web server SG"
      SecurityGroupIngress:
        - IpProtocol: tcp
          FromPort: 80
          ToPort: 80
          CidrIp: 0.0.0.0/0
      Tags:
        - Key: Name
          Value: !Sub "\${EnvironmentName}-web-sg"

Outputs:
  SecurityGroupId:
    Value: !Ref WebSecurityGroup
    Export:
      Name: !Sub "\${EnvironmentName}-WebSG"
EOF

aws cloudformation deploy   --template-file template.yaml   --stack-name my-web-stack   --parameter-overrides EnvironmentName=dev

aws cloudformation describe-stacks --stack-name my-web-stack   --query 'Stacks[0].Outputs'`,
        explanation: "!Sub substitutes variables. !Ref returns the resource's ID. Outputs can be imported by other stacks. CloudFormation maintains state and handles rollback on failure automatically." },
    ],
  },
],

// ═══ CLOUD: AZURE VMS ═══
"azure-vms": [
  { id: "azvm-lab-1", title: "Azure VMs: Deploy and Manage", difficulty: "Intermediate", duration: "25 min",
    tools: ["az-cli"], objective: "Create a VM, connect via Bastion, install software, create a custom image",
    interface: "terminal",
    steps: [
      { id: "azvm1", title: "Create VM with Azure CLI", type: "command",
        description: "Deploy a Ubuntu VM with managed identity — no passwords or keys stored.",
        code: `az group create --name prod-rg --location eastus

az vm create   --resource-group prod-rg   --name web-vm-01   --image Ubuntu2204   --size Standard_D2s_v3   --admin-username azureuser   --generate-ssh-keys   --assign-identity '[system]'   --no-wait

az vm list --resource-group prod-rg --output table
az vm show --resource-group prod-rg --name web-vm-01 --query '{status:powerState,ip:publicIps}'`,
        explanation: "assign-identity '[system]' creates a system-assigned managed identity — the VM can access Azure services without storing credentials. generate-ssh-keys creates keys if they don't exist." },
    ],
  },
],

// ═══ CLOUD: GKE ═══
"gke": [
  { id: "gke-lab-1", title: "GKE Autopilot: Managed Kubernetes on GCP", difficulty: "Intermediate", duration: "25 min",
    tools: ["gcloud", "kubectl"], objective: "Create GKE Autopilot cluster, deploy workloads, use Workload Identity",
    interface: "terminal",
    steps: [
      { id: "gke1", title: "Create GKE Autopilot cluster", type: "command",
        description: "Autopilot: fully managed nodes, pay per pod, automatic security hardening.",
        code: `gcloud container clusters create-auto prod-cluster   --region asia-south1   --release-channel regular   --enable-master-authorized-networks   --master-authorized-networks "$(curl -s ifconfig.me)/32"

gcloud container clusters get-credentials prod-cluster --region asia-south1
kubectl get nodes`,
        explanation: "GKE Autopilot: Google manages nodes (OS patching, node provisioning, scaling). You only pay for pod resources. Standard clusters give more control but require managing node pools." },
    ],
  },
],

// ═══ CLOUD: BIGQUERY ═══
"bigquery": [
  { id: "bq-lab-1", title: "BigQuery: Serverless Analytics at Scale", difficulty: "Intermediate", duration: "25 min",
    tools: ["bq", "gcloud"], objective: "Query public datasets, write optimized SQL, create partitioned tables",
    interface: "terminal",
    steps: [
      { id: "bq1", title: "Query public BigQuery datasets", type: "command",
        description: "BigQuery has petabytes of public data — great for learning without loading your own.",
        code: `# Query GitHub data (public dataset)
bq query --use_legacy_sql=false '
SELECT
  repo_name,
  COUNT(*) AS pushes,
  COUNT(DISTINCT actor.login) AS contributors
FROM bigquery-public-data.github_repos.commits
WHERE author.date > "2023-01-01"
GROUP BY repo_name
ORDER BY pushes DESC
LIMIT 10'

# Check bytes processed BEFORE running (cost control)
bq query --dry_run --use_legacy_sql=false 'SELECT COUNT(*) FROM bigquery-public-data.github_repos.commits'`,
        explanation: "BigQuery charges per bytes scanned ($5/TB). --dry_run shows bytes without running query. Use partitioned tables and WHERE on partition column to reduce scan. SELECT * on large tables = expensive mistake." },
    ],
  },
],

// ═══ CLOUD: COST OPTIMIZATION ═══
"cost-optimization": [
  { id: "co-lab-1", title: "AWS Cost Analysis and Optimization", difficulty: "Intermediate", duration: "25 min",
    tools: ["aws-cli"], objective: "Find idle resources, analyze spend, apply savings plans",
    interface: "terminal",
    steps: [
      { id: "co1", title: "Find waste with AWS tools", type: "command",
        description: "Identify unattached EBS volumes, unused EIPs, idle load balancers.",
        code: `# Unattached EBS volumes (you pay even when not attached!)
aws ec2 describe-volumes   --filters Name=status,Values=available   --query 'Volumes[*].[VolumeId,Size,VolumeType,CreateTime]'   --output table

# Unassociated Elastic IPs ($0.005/hr when not attached = $3.60/month)
aws ec2 describe-addresses   --query 'Addresses[?AssociationId==null].[AllocationId,PublicIp]'   --output table

# Compute Optimizer recommendations
aws compute-optimizer get-ec2-instance-recommendations   --filters name=Finding,values=OVER_PROVISIONED   --query 'instanceRecommendations[*].[instanceArn,finding,recommendationOptions[0].instanceType]'   --output table

# Cost by service this month
aws ce get-cost-and-usage   --time-period Start=$(date -u +%Y-%m-01),End=$(date -u +%Y-%m-%d)   --granularity MONTHLY --metrics BlendedCost   --group-by Type=DIMENSION,Key=SERVICE`,
        explanation: "Typical quick wins: delete unattached EBS (easy), release unused EIPs (easy), right-size over-provisioned EC2 (saves 20-40%), stop dev instances outside business hours (saves 65%)." },
    ],
  },
],

// ═══ CLOUD: OTHER AZURE ═══
"azure-vnets": [
  { id: "vnet-lab-1", title: "Azure VNets: Network Architecture", difficulty: "Intermediate", duration: "20 min",
    tools: ["az-cli"], objective: "Build a hub-spoke VNet topology with peering and NSGs",
    interface: "terminal",
    steps: [
      { id: "vnet1", title: "Create VNet with subnets", type: "command",
        description: "Build a production VNet with public and private subnets.",
        code: `az network vnet create --name prod-vnet --resource-group prod-rg --address-prefix 10.0.0.0/16
az network vnet subnet create --vnet-name prod-vnet --resource-group prod-rg --name web-subnet --address-prefix 10.0.1.0/24
az network vnet subnet create --vnet-name prod-vnet --resource-group prod-rg --name app-subnet --address-prefix 10.0.2.0/24
az network nsg create --name web-nsg --resource-group prod-rg
az network nsg rule create --nsg-name web-nsg --resource-group prod-rg --name allow-https --priority 100 --protocol Tcp --destination-port-ranges 443`,
        explanation: "NSG (Network Security Group) is like AWS Security Group — stateful firewall at subnet or NIC level. Azure NSG rules have priorities (lower = higher priority). 100 is high priority." },
    ],
  },
],
"azure-entra": [
  { id: "entra-lab-1", title: "Azure Entra ID: Identity and RBAC", difficulty: "Intermediate", duration: "20 min",
    tools: ["az-cli"], objective: "Configure managed identities, assign RBAC roles, create service principals",
    interface: "terminal",
    steps: [
      { id: "entra1", title: "Assign RBAC roles", type: "command",
        description: "Azure RBAC: who can do what on which resource.",
        code: `az role assignment create   --assignee user@company.com   --role "Contributor"   --scope "/subscriptions/SUB-ID/resourceGroups/prod-rg"

az role assignment create   --assignee user@company.com   --role "Storage Blob Data Reader"   --scope "/subscriptions/SUB-ID/resourceGroups/prod-rg/providers/Microsoft.Storage/storageAccounts/mystorageaccount"

az role assignment list --assignee user@company.com --output table`,
        explanation: "Azure RBAC scope: management group → subscription → resource group → resource. Narrower scope = less access. Use built-in roles first. Create custom roles only when built-ins don't fit." },
    ],
  },
],
"azure-aks": [
  { id: "aks-lab-1", title: "Azure AKS: Managed Kubernetes", difficulty: "Advanced", duration: "30 min",
    tools: ["az-cli", "kubectl"], objective: "Create AKS cluster, deploy workloads, configure KEDA autoscaling",
    interface: "terminal",
    steps: [
      { id: "aks1", title: "Create AKS cluster", type: "command",
        description: "Deploy AKS with OIDC, Workload Identity, and auto-upgrades enabled.",
        code: `az aks create   --resource-group prod-rg   --name prod-aks   --node-count 3   --node-vm-size Standard_D4s_v5   --enable-oidc-issuer   --enable-workload-identity   --enable-cluster-autoscaler   --min-count 1 --max-count 10   --auto-upgrade-channel rapid   --network-plugin azure

az aks get-credentials --resource-group prod-rg --name prod-aks
kubectl get nodes`,
        explanation: "Workload Identity: pods authenticate to Azure services via OIDC (no credentials in pods). auto-upgrade-channel: AKS auto-patches Kubernetes version. Cluster autoscaler: scales node count based on pending pods." },
    ],
  },
],
"azure-devops": [
  { id: "ado-lab-1", title: "Azure DevOps: CI/CD Pipelines", difficulty: "Intermediate", duration: "30 min",
    tools: ["azure-devops", "yaml"], objective: "Create a YAML pipeline with stages, environments, and approvals",
    interface: "none",
    steps: [
      { id: "ado1", title: "Write a multi-stage pipeline", type: "code",
        description: "Azure DevOps YAML pipeline with build → test → deploy stages.",
        language: "yaml",
        code: `trigger:
  branches:
    include: [main, develop]

pool:
  vmImage: ubuntu-latest

variables:
  DOCKER_REGISTRY: myregistry.azurecr.io
  IMAGE_NAME: myapp
  IMAGE_TAG: $(Build.BuildId)

stages:
- stage: Build
  jobs:
  - job: BuildTest
    steps:
    - task: NodeTool@0
      inputs: {versionSpec: '20.x'}
    - script: npm ci && npm test
    - task: Docker@2
      inputs:
        containerRegistry: ACR-Connection
        repository: $(IMAGE_NAME)
        command: buildAndPush
        tags: $(IMAGE_TAG)

- stage: DeployStaging
  dependsOn: Build
  condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/main'))
  jobs:
  - deployment: Deploy
    environment: staging    # Configure approvals in Environments UI
    strategy:
      runOnce:
        deploy:
          steps:
          - task: HelmDeploy@0
            inputs:
              kubernetesServiceEndpoint: aks-staging
              command: upgrade
              chartName: myapp
              releaseName: myapp
              overrideValues: image.tag=$(IMAGE_TAG)`,
        explanation: "condition: only deploy to staging from main branch. Environments: configure required approvals so production needs 2 approvers. dependsOn: ensures stages run in order." },
    ],
  },
],
"cloud-run": [
  { id: "cr-lab-1", title: "Google Cloud Run: Serverless Containers", difficulty: "Intermediate", duration: "20 min",
    tools: ["gcloud", "docker"], objective: "Deploy a containerized app to Cloud Run with auto-scaling",
    interface: "terminal",
    steps: [
      { id: "cr1", title: "Deploy to Cloud Run", type: "command",
        description: "Cloud Run: serverless containers — auto-scales to 0, pay per request.",
        code: `# Build and push to Artifact Registry
gcloud auth configure-docker asia-south1-docker.pkg.dev
docker build -t asia-south1-docker.pkg.dev/PROJECT/repo/myapp:latest .
docker push asia-south1-docker.pkg.dev/PROJECT/repo/myapp:latest

# Deploy to Cloud Run
gcloud run deploy myapp   --image asia-south1-docker.pkg.dev/PROJECT/repo/myapp:latest   --region asia-south1   --allow-unauthenticated   --min-instances 0   --max-instances 100   --memory 512Mi   --cpu 1   --concurrency 80

gcloud run services describe myapp --region asia-south1`,
        explanation: "min-instances 0: scales to zero (no traffic = no cost). concurrency 80: one instance handles 80 concurrent requests. Cloud Run is perfect for APIs, webhooks, batch jobs — anything containerizable." },
    ],
  },
],
"cloud-security": [
  { id: "cs-lab-1", title: "Cloud Security Posture Management", difficulty: "Advanced", duration: "25 min",
    tools: ["aws-cli", "prowler"], objective: "Audit cloud security with automated CSPM tools and fix findings",
    interface: "terminal",
    steps: [
      { id: "csec1", title: "Run security audit with Prowler", type: "command",
        description: "Prowler is the most popular open-source CSPM tool — scans AWS, Azure, GCP.",
        code: `# Install Prowler
pip install prowler

# Run all checks (takes 10-30 min)
prowler aws --output-formats json html

# Run only specific services
prowler aws -s s3 iam guardduty

# CIS benchmark only
prowler aws --compliance cis_level2_aws

# Quick critical findings summary
prowler aws --output-formats json | python3 -c "
import json,sys
data=[json.loads(l) for l in sys.stdin if l.strip()]
critical=[d for d in data if d.get('Status')=='FAIL' and d.get('Severity')=='critical']
print(f'Critical findings: {len(critical)}')
for c in critical[:5]:
    print(f'  [{c["ServiceName"]}] {c["CheckTitle"]}')"`,
        explanation: "CSPM = Cloud Security Posture Management. Prowler checks 300+ AWS security controls: public S3 buckets, open security groups, unencrypted volumes, missing MFA, CloudTrail disabled, etc." },
    ],
  },
],
"landing-zones": [
  { id: "lz-lab-1", title: "AWS Landing Zone with Control Tower", difficulty: "Advanced", duration: "30 min",
    tools: ["aws-cli"], objective: "Understand multi-account strategy and set up AWS Organizations with SCPs",
    interface: "terminal",
    steps: [
      { id: "lz1", title: "Set up AWS Organizations", type: "command",
        description: "Create an organization and apply Service Control Policies for governance.",
        code: `aws organizations create-organization --feature-set ALL

# Create OUs (Organizational Units)
ROOT_ID=$(aws organizations list-roots --query 'Roots[0].Id' --output text)
aws organizations create-organizational-unit --parent-id $ROOT_ID --name Production
aws organizations create-organizational-unit --parent-id $ROOT_ID --name Sandbox

# Apply SCP: restrict to specific regions only
cat > region-restriction.json << 'EOF'
{"Version":"2012-10-17","Statement":[{
  "Effect":"Deny",
  "NotAction":["iam:*","organizations:*","support:*"],
  "Resource":"*",
  "Condition":{"StringNotEquals":{"aws:RequestedRegion":["ap-south-1","us-east-1"]}}
}]}
EOF

SCP_ID=$(aws organizations create-policy --name RegionRestriction --type SERVICE_CONTROL_POLICY --content file://region-restriction.json --query 'Policy.PolicySummary.Id' --output text)

PROD_OU=$(aws organizations list-children --parent-id $ROOT_ID --child-type ORGANIZATIONAL_UNIT --query 'Children[?Name==Production].Id' --output text)
aws organizations attach-policy --policy-id $SCP_ID --target-id $PROD_OU`,
        explanation: "SCPs set maximum permissions for all accounts in an OU. Even the root user can't exceed SCP limits. Key SCPs: restrict regions, prevent leaving org, require MFA, prevent disabling CloudTrail, prevent deleting security services." },
    ],
  },
],
"route53": [
  { id: "r53-lab-1", title: "Route53: DNS and Traffic Routing", difficulty: "Intermediate", duration: "20 min",
    tools: ["aws-cli"], objective: "Create hosted zones, DNS records, health checks, and weighted routing",
    interface: "terminal",
    steps: [
      { id: "r531", title: "Create hosted zone and records", type: "command",
        description: "Create a hosted zone and configure various record types.",
        code: `ZONE_ID=$(aws route53 create-hosted-zone   --name example.com   --caller-reference "$(date +%s)"   --query 'HostedZone.Id' --output text | cut -d'/' -f3)

# A record
aws route53 change-resource-record-sets   --hosted-zone-id $ZONE_ID   --change-batch '{"Changes":[{"Action":"UPSERT","ResourceRecordSet":{"Name":"api.example.com","Type":"A","TTL":300,"ResourceRecords":[{"Value":"203.0.113.1"}]}}]}'

# MX record for email
aws route53 change-resource-record-sets   --hosted-zone-id $ZONE_ID   --change-batch '{"Changes":[{"Action":"UPSERT","ResourceRecordSet":{"Name":"example.com","Type":"MX","TTL":300,"ResourceRecords":[{"Value":"10 mail.example.com"}]}}]}'

aws route53 list-resource-record-sets --hosted-zone-id $ZONE_ID`,
        explanation: "Route53 ALIAS records are free and resolve instantly (unlike CNAMEs). Always use ALIAS for: ALB/NLB, CloudFront distributions, S3 website endpoints. CNAME can't be used at domain apex (example.com) — use ALIAS." },
    ],
  },
],

// ═══ SECURITY: SECURITY FUNDAMENTALS ═══
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

// Get labs for a technology
export function getLabsForTech(academy: string, tech: string): Lab[] {
  return allLabs[tech] || [];
}
