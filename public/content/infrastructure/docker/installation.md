# Docker — Installation Guide

## Install Docker Desktop (Mac & Windows)

### macOS
1. Go to **docker.com/products/docker-desktop**
2. Click "Download for Mac" — choose Apple Silicon (M1/M2/M3) or Intel
3. Open the downloaded `.dmg` file and drag Docker to Applications
4. Open Docker from Applications — it appears in your menu bar
5. Wait for Docker to start (whale icon stops animating)

```bash
# Verify installation
docker --version          # Docker version 25.x.x
docker compose version    # Docker Compose version v2.x.x
docker run hello-world    # Pulls and runs a test container
```

### Windows
1. **Requirement:** Windows 10/11 with WSL2 enabled
2. Enable WSL2: Open PowerShell as Administrator → `wsl --install` → restart
3. Download Docker Desktop from docker.com
4. Run the installer, ensure "Use WSL2" is checked
5. Start Docker Desktop from Start Menu

```powershell
# Verify in PowerShell
docker --version
docker run hello-world
```

## Install Docker Engine (Linux — Ubuntu/Debian)

```bash
# Remove old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# Install using the convenience script (quickest)
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Add your user to docker group (avoid typing sudo every time)
sudo usermod -aG docker $USER

# Log out and log back in, then verify
docker run hello-world
```

## Install Docker Engine (Linux — Amazon Linux / RHEL / CentOS)

```bash
sudo yum update -y
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
docker --version
```

## Verify Everything Works

```bash
# 1. Check daemon is running
docker info

# 2. Run a real container
docker run -d -p 8080:80 --name test nginx
curl http://localhost:8080   # Should return nginx HTML
docker stop test && docker rm test

# 3. Check compose works
mkdir test-compose && cd test-compose
cat > docker-compose.yml << 'EOF'
services:
  web:
    image: nginx
    ports: ["8081:80"]
EOF
docker compose up -d
curl http://localhost:8081
docker compose down
```

## Common Installation Issues

**"Cannot connect to Docker daemon"**
```bash
sudo systemctl start docker
# Or on Mac: open Docker Desktop application
```

**"Permission denied" on Linux**
```bash
sudo usermod -aG docker $USER
newgrp docker   # Apply group without logging out
```

**Docker Desktop slow on Mac (Apple Silicon)**
Enable "Use Rosetta for x86_64/amd64 emulation" in Docker Desktop settings > General.

**WSL2 not found on Windows**
```powershell
wsl --install
# Restart PC, then try Docker Desktop again
```

## What's Installed

After successful installation you have:
- **Docker Engine** — the container runtime (daemon)
- **Docker CLI** — `docker` command
- **Docker Compose** — multi-container orchestration (`docker compose`)
- **Docker Desktop** (Mac/Windows) — GUI + resource management

## Next Steps

Go to the **Fundamentals** section to learn your first Docker commands.
