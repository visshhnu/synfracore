# ELK Stack — Installation Guide

ELK = Elasticsearch + Logstash + Kibana. For most use cases, you'll also add Filebeat (log shipper).

## Option 1: Docker Compose (Recommended for Learning)

```bash
mkdir elk-stack && cd elk-stack

cat > docker-compose.yml << 'EOF'
version: "3.8"
services:
  elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:8.12.0
    environment:
      - discovery.type=single-node
      - ES_JAVA_OPTS=-Xms512m -Xmx512m
      - xpack.security.enabled=false    # Disable auth for dev
    ports: ["9200:9200"]
    volumes:
      - es-data:/usr/share/elasticsearch/data

  kibana:
    image: docker.elastic.co/kibana/kibana:8.12.0
    ports: ["5601:5601"]
    environment:
      ELASTICSEARCH_HOSTS: http://elasticsearch:9200
    depends_on: [elasticsearch]

  logstash:
    image: docker.elastic.co/logstash/logstash:8.12.0
    ports: ["5044:5044", "5000:5000/tcp", "5000:5000/udp", "9600:9600"]
    volumes:
      - ./logstash.conf:/usr/share/logstash/pipeline/logstash.conf
    depends_on: [elasticsearch]

volumes:
  es-data:
EOF

# Create a basic Logstash pipeline
cat > logstash.conf << 'EOF'
input {
  tcp {
    port => 5000
    codec => json_lines
  }
}

filter {
  date {
    match => ["timestamp", "ISO8601"]
  }
}

output {
  elasticsearch {
    hosts => ["elasticsearch:9200"]
    index => "logs-%{+YYYY.MM.dd}"
  }
  stdout { codec => rubydebug }
}
EOF

docker compose up -d

# Wait ~60 seconds for Elasticsearch to start
curl http://localhost:9200   # Should return cluster info JSON
```

Open Kibana at http://localhost:5601

## Option 2: Install on Ubuntu (Production)

```bash
# Install Elasticsearch
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | \
  sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] \
  https://artifacts.elastic.co/packages/8.x/apt stable main" | \
  sudo tee /etc/apt/sources.list.d/elastic-8.x.list

sudo apt update
sudo apt install elasticsearch kibana logstash -y

sudo systemctl enable --now elasticsearch
sudo systemctl enable --now kibana
sudo systemctl enable --now logstash
```

## Install Filebeat (Log Shipper — On Your App Servers)

```bash
sudo apt install filebeat -y

# Configure Filebeat to ship nginx logs to Elasticsearch
sudo tee /etc/filebeat/filebeat.yml << 'EOF'
filebeat.inputs:
  - type: filestream
    id: nginx-access
    enabled: true
    paths:
      - /var/log/nginx/access.log
    tags: ["nginx", "access"]

  - type: filestream
    id: nginx-error
    enabled: true
    paths:
      - /var/log/nginx/error.log
    tags: ["nginx", "error"]

output.elasticsearch:
  hosts: ["http://elasticsearch-host:9200"]
  index: "filebeat-%{[agent.version]}-%{+yyyy.MM.dd}"
EOF

sudo systemctl enable --now filebeat
```

## Verify It's Working

```bash
# Elasticsearch
curl http://localhost:9200/_cluster/health?pretty
# "status": "green" or "yellow" (single node = yellow, normal)

curl http://localhost:9200/_cat/indices?v
# Shows all indices including your logs

# Send a test log via TCP
echo '{"message": "test log", "level": "info", "service": "myapp"}' | nc localhost 5000

# Check in Kibana:
# Stack Management → Index Management → you should see logs-xxxx
# Discover → Create data view → search for your logs
```

## Next Steps

ELK is running and ingesting logs. Go to **Fundamentals** to learn Elasticsearch queries, Kibana dashboards, and Logstash filter pipelines.
