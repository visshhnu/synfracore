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

};

// Get labs for a technology
export function getLabsForTech(academy: string, tech: string): Lab[] {
  return allLabs[tech] || [];
}
