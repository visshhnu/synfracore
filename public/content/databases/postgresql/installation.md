# PostgreSQL — Installation Guide

## Option 1: Docker (Fastest)

```bash
# Run PostgreSQL
docker run -d \
  --name postgres \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -e POSTGRES_DB=myapp \
  -p 5432:5432 \
  -v postgres-data:/var/lib/postgresql/data \
  postgres:16-alpine

# Connect with psql
docker exec -it postgres psql -U postgres -d myapp

# Or connect from your host
psql -h localhost -U postgres -d myapp
# Password: mysecretpassword
```

## Option 2: Install on Ubuntu

```bash
# Add PostgreSQL official repo (latest versions)
sudo apt install -y postgresql-common
sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh

# Install PostgreSQL 16
sudo apt install -y postgresql-16

# Start and enable
sudo systemctl enable --now postgresql
sudo systemctl status postgresql

# Connect (PostgreSQL creates a 'postgres' system user)
sudo -u postgres psql

# Inside psql:
\l          -- list databases
\c myapp    -- connect to a database
\dt         -- list tables
\q          -- quit
```

## Option 3: macOS

```bash
# Option A: Homebrew
brew install postgresql@16
brew services start postgresql@16
psql postgres

# Option B: Postgres.app (GUI — easiest on Mac)
# Download from postgresapp.com
# Drag to Applications, Open, Initialize
# Add to PATH: /Applications/Postgres.app/Contents/Versions/latest/bin
psql
```

## Option 4: Windows

```bash
# Download installer from postgresql.org/download/windows
# Run the installer (installs PostgreSQL + pgAdmin GUI)
# Remember the password you set for 'postgres' user
# Open SQL Shell (psql) or pgAdmin from Start Menu
```

## First Steps After Install

```sql
-- Connect as postgres superuser
sudo -u postgres psql   -- Linux
psql -U postgres        -- Mac/Windows

-- Create a database and user for your app
CREATE DATABASE myapp;
CREATE USER myuser WITH ENCRYPTED PASSWORD 'mypassword';
GRANT ALL PRIVILEGES ON DATABASE myapp TO myuser;

-- Connect as the new user
\c myapp myuser

-- Create your first table
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    email TEXT UNIQUE NOT NULL,
    name TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

INSERT INTO users (email, name) VALUES ('alice@example.com', 'Alice');
SELECT * FROM users;
```

## Install pgAdmin (GUI Tool)

```bash
# Ubuntu
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | \
  sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] \
  https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" \
  > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt install pgadmin4

# macOS: brew install --cask pgadmin4
# Windows: included in the installer
```

## Connection String Format

```
postgresql://username:password@host:port/database

# Examples:
postgresql://myuser:mypassword@localhost:5432/myapp
postgresql://myuser:mypassword@db.example.com:5432/production

# Python (psycopg2)
conn = psycopg2.connect("postgresql://myuser:mypassword@localhost/myapp")

# Node.js (pg)
const pool = new Pool({ connectionString: 'postgresql://myuser:mypassword@localhost/myapp' })
```

## Next Steps

PostgreSQL is running. Go to **Fundamentals** to learn SQL, indexes, and psql commands used daily.
