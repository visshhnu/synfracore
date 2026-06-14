# Linux — Getting Started Guide

## You Probably Already Have Linux Access

Linux is the OS running nearly all cloud servers, containers, and DevOps tools. Here's how to get a Linux environment on any machine:

## Option 1: WSL2 on Windows (Fastest Setup)

Windows Subsystem for Linux runs a real Linux kernel inside Windows.

```powershell
# Open PowerShell as Administrator
wsl --install
# Restart your PC

# After restart, Ubuntu opens automatically
# Create a username and password when prompted

# Verify
wsl --list --verbose
```

You now have Ubuntu with a full Linux terminal. Open it anytime from the Start Menu as "Ubuntu".

## Option 2: macOS Terminal (Already Linux-like)

macOS is Unix-based. The Terminal app gives you most Linux commands. Install Homebrew first:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

For a full Linux experience on Mac, use multipass:
```bash
brew install multipass
multipass launch --name myvm --cpus 2 --memory 2G --disk 10G
multipass shell myvm     # Opens Ubuntu shell
```

## Option 3: Free Cloud VM (Real Production Linux)

### AWS Free Tier (12 months free)
1. Create account at aws.amazon.com
2. Go to EC2 → Launch Instance
3. Choose: Ubuntu 22.04 LTS
4. Instance type: t2.micro (free tier)
5. Create a key pair (.pem file)
6. Launch

```bash
# SSH to your EC2 instance (Linux/Mac)
chmod 400 my-key.pem
ssh -i my-key.pem ubuntu@YOUR-EC2-PUBLIC-IP

# Windows: use PuTTY or Windows Terminal with .pem file
```

### Oracle Cloud (Always Free — no credit card expiry)
Oracle offers 2 AMD VMs free forever:
1. Create account at cloud.oracle.com
2. Create Compute Instance → Oracle Linux or Ubuntu
3. Download the SSH key

### Google Cloud ($300 free credit for 90 days)
```bash
gcloud compute instances create my-vm --machine-type=e2-micro   --image-family=ubuntu-2204-lts --image-project=ubuntu-os-cloud
gcloud compute ssh my-vm
```

## Option 4: Local VM with VirtualBox (Fully Offline)

1. Download VirtualBox from virtualbox.org (free)
2. Download Ubuntu 22.04 ISO from ubuntu.com
3. Create new VM: 2 CPU, 4GB RAM, 20GB disk
4. Attach the ISO and install Ubuntu

## Essential First Commands to Run

```bash
# Who am I and where am I?
whoami          # your username
pwd             # current directory
hostname        # machine name
uname -r        # Linux kernel version
cat /etc/os-release  # OS details

# System resources
free -h         # RAM usage
df -h           # Disk usage
nproc           # CPU count
top             # Live process monitor (q to quit)

# Navigation
ls -la          # List files (with hidden files and permissions)
cd /var/log     # Change to /var/log directory
cd ~            # Go to home directory
cd -            # Go to previous directory

# Update packages (Ubuntu/Debian)
sudo apt update && sudo apt upgrade -y
```

## The Linux Filesystem — Know These Directories

```
/               root of the filesystem
├── home/       user home directories (/home/ubuntu, /home/john)
├── etc/        configuration files (nginx.conf, sshd_config, crontab)
├── var/        variable data: logs (/var/log), databases, caches
├── usr/        installed programs (/usr/bin, /usr/local/bin)
├── tmp/        temporary files (cleared on reboot)
├── proc/       virtual filesystem — kernel and process info
└── opt/        optional third-party software
```

## Next Steps

You have Linux access. Go to the **Fundamentals** section to start learning the core commands used daily in DevOps work.
