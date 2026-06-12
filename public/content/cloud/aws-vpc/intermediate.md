# AWS VPC — Intermediate

## VPC Flow Logs

```bash
# Enable flow logs — capture all network traffic metadata
aws ec2 create-flow-logs \
    --resource-ids vpc-12345678 \
    --resource-type VPC \
    --traffic-type ALL \
    --log-destination-type s3 \
    --log-destination arn:aws:s3:::my-vpc-flow-logs/vpc/ \
    --log-format '${version} ${account-id} ${interface-id} ${srcaddr} ${dstaddr} ${srcport} ${dstport} ${protocol} ${packets} ${bytes} ${start} ${end} ${action} ${log-status} ${vpc-id} ${subnet-id} ${instance-id}'

# Query flow logs with Athena
CREATE EXTERNAL TABLE IF NOT EXISTS vpc_flow_logs (
  version int, accountid string, interfaceid string,
  srcaddr string, dstaddr string, srcport int, dstport int,
  protocol bigint, packets bigint, bytes bigint,
  start bigint, `end` bigint, action string, logstatus string
)
PARTITIONED BY (dt string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ' '
LOCATION 's3://my-vpc-flow-logs/vpc/';

-- Find top talkers
SELECT srcaddr, dstaddr, SUM(bytes)/1048576 as MB
FROM vpc_flow_logs
WHERE dt = '2024/01/15' AND action = 'ACCEPT'
GROUP BY srcaddr, dstaddr
ORDER BY MB DESC LIMIT 20;

-- Find rejected traffic (potential security issue)
SELECT srcaddr, dstport, COUNT(*) as attempts
FROM vpc_flow_logs
WHERE action = 'REJECT' AND dt = '2024/01/15'
GROUP BY srcaddr, dstport
HAVING COUNT(*) > 100
ORDER BY attempts DESC;
```

## PrivateLink

```hcl
# Share services between VPCs without VPC peering or internet
# More secure: only specific service is exposed, not entire VPC

# Provider side: Create NLB + Endpoint Service
resource "aws_lb" "internal" {
  internal           = true
  load_balancer_type = "network"
  subnets            = var.private_subnets
}

resource "aws_vpc_endpoint_service" "my_service" {
  acceptance_required        = true  # Must accept connection requests
  network_load_balancer_arns = [aws_lb.internal.arn]

  allowed_principals = [
    "arn:aws:iam::CONSUMER_ACCOUNT_ID:root"
  ]
}

# Consumer side: Create Interface Endpoint
resource "aws_vpc_endpoint" "service" {
  vpc_id              = var.consumer_vpc_id
  service_name        = aws_vpc_endpoint_service.my_service.service_name
  vpc_endpoint_type   = "Interface"
  subnet_ids          = var.consumer_private_subnets
  security_group_ids  = [aws_security_group.endpoint.id]
  private_dns_enabled = true  # service.region.vpce.amazonaws.com resolves to private IP
}

# Consumer now connects to the service via private DNS
# No internet, no VPC peering, no routing complexity
```

## Transit Gateway Advanced

```hcl
# Hub-and-spoke network topology
resource "aws_ec2_transit_gateway" "main" {
  description                     = "Central transit hub"
  default_route_table_association = "disable"  # Manage route tables manually
  default_route_table_propagation = "disable"
  dns_support                     = "enable"
  vpn_ecmp_support                = "enable"
  auto_accept_shared_attachments  = "disable"
}

# Attach each VPC
resource "aws_ec2_transit_gateway_vpc_attachment" "prod" {
  transit_gateway_id = aws_ec2_transit_gateway.main.id
  vpc_id             = aws_vpc.prod.id
  subnet_ids         = aws_subnet.prod_private[*].id

  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
}

# Separate route tables for prod/non-prod isolation
resource "aws_ec2_transit_gateway_route_table" "prod" {
  transit_gateway_id = aws_ec2_transit_gateway.main.id
  tags = { Name = "prod-rt" }
}

# Prod VPCs can talk to each other but not dev
resource "aws_ec2_transit_gateway_route_table_association" "prod" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.prod.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.prod.id
}

# Allow prod VPCs to reach shared services (monitoring, logging)
resource "aws_ec2_transit_gateway_route_table_propagation" "shared_to_prod" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.shared.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.prod.id
}
```
