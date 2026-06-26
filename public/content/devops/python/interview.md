# Python DevOps Interview Q&A

**Q: How do you use boto3 to list EC2 instances?**
```python
import boto3
ec2 = boto3.client('ec2', region_name='us-east-1')
response = ec2.describe_instances(Filters=[{'Name': 'instance-state-name', 'Values': ['running']}])
for reservation in response['Reservations']:
    for instance in reservation['Instances']:
        print(f"{instance['InstanceId']}: {instance['PrivateIpAddress']}")
```

**Q: How do you make a REST API call in Python?**
```python
import requests
response = requests.get('https://api.example.com/data', 
    headers={'Authorization': f'Bearer {token}'},
    timeout=30)
response.raise_for_status()  # raise exception for 4xx/5xx
data = response.json()
```

**Q: How do you read and write files in Python?**
```python
# Read
with open('config.yaml', 'r') as f:
    content = f.read()
# Write
with open('output.txt', 'w') as f:
    f.write(content)
# YAML/JSON
import yaml, json
config = yaml.safe_load(open('config.yaml'))
data = json.loads(open('data.json').read())
```

**Q: How do you run shell commands from Python?**
```python
import subprocess
result = subprocess.run(['kubectl', 'get', 'pods', '-n', 'production'],
    capture_output=True, text=True, check=True)
print(result.stdout)
```

**Q: How do you handle exceptions in production Python scripts?**
```python
import logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

try:
    result = deploy_application()
    logger.info(f"Deploy succeeded: {result}")
except DeploymentError as e:
    logger.error(f"Deploy failed: {e}")
    send_alert(str(e))  # Slack/PagerDuty
    raise SystemExit(1)
finally:
    cleanup()
```
