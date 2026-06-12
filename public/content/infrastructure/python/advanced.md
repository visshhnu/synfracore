# Python for DevOps — Advanced

## Infrastructure Automation Frameworks

```python
# Pulumi — Infrastructure as Code in Python
import pulumi
import pulumi_aws as aws

# VPC
vpc = aws.ec2.Vpc("prod-vpc",
    cidr_block="10.0.0.0/16",
    enable_dns_hostnames=True,
    tags={"Name": "prod-vpc", "ManagedBy": "pulumi"}
)

# Public subnets
public_subnets = []
for i, az in enumerate(["us-east-1a", "us-east-1b"]):
    subnet = aws.ec2.Subnet(f"public-{i}",
        vpc_id=vpc.id,
        cidr_block=f"10.0.{i}.0/24",
        availability_zone=az,
        map_public_ip_on_launch=True,
    )
    public_subnets.append(subnet)

# EKS cluster
eks_cluster = aws.eks.Cluster("prod-eks",
    role_arn=eks_role.arn,
    vpc_config=aws.eks.ClusterVpcConfigArgs(
        subnet_ids=[s.id for s in public_subnets],
    ),
    version="1.30",
)

# Export values for other stacks
pulumi.export("vpc_id", vpc.id)
pulumi.export("cluster_name", eks_cluster.name)
pulumi.export("kubeconfig", eks_cluster.certificate_authority.apply(
    lambda ca: generate_kubeconfig(eks_cluster.endpoint, ca.data, eks_cluster.name)
))
```

## Async DevOps Scripts

```python
# Parallel operations on many servers using asyncio
import asyncio
import asyncssh
from dataclasses import dataclass

@dataclass
class ServerResult:
    host: str
    success: bool
    output: str
    error: str = ""

async def run_on_server(host: str, command: str, key_path: str) -> ServerResult:
    try:
        async with asyncssh.connect(
            host,
            username='ec2-user',
            client_keys=[key_path],
            known_hosts=None,
            connect_timeout=10,
        ) as conn:
            result = await conn.run(command, timeout=60)
            return ServerResult(host, True, result.stdout)
    except Exception as e:
        return ServerResult(host, False, "", str(e))

async def run_on_all(hosts: list[str], command: str, concurrency: int = 10) -> list[ServerResult]:
    semaphore = asyncio.Semaphore(concurrency)

    async def run_with_limit(host):
        async with semaphore:
            return await run_on_server(host, command, "~/.ssh/prod.pem")

    return await asyncio.gather(*[run_with_limit(h) for h in hosts])

# Run a command on 500 servers concurrently
hosts = ["10.0.0." + str(i) for i in range(1, 501)]
results = asyncio.run(run_on_all(hosts, "df -h /", concurrency=50))

failed = [r for r in results if not r.success]
if failed:
    print(f"Failed on {len(failed)} servers:")
    for r in failed:
        print(f"  {r.host}: {r.error}")
```

## Monitoring and Observability in Python

```python
# OpenTelemetry — structured observability
from opentelemetry import trace, metrics
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.metrics import MeterProvider
from opentelemetry.exporter.otlp.proto.grpc.trace_exporter import OTLPSpanExporter
from opentelemetry.instrumentation.requests import RequestsInstrumentor
from opentelemetry.instrumentation.flask import FlaskInstrumentor
import time, functools

# Auto-instrument HTTP requests
RequestsInstrumentor().instrument()
FlaskInstrumentor().instrument_app(app)

# Custom metrics
meter = metrics.get_meter(__name__)
request_counter = meter.create_counter("http_requests_total")
latency_histogram = meter.create_histogram(
    "http_request_duration_seconds",
    unit="s",
)

def observe_request(func):
    """Decorator to auto-instrument functions with traces + metrics."""
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        tracer = trace.get_tracer(__name__)
        with tracer.start_as_current_span(func.__name__) as span:
            start = time.perf_counter()
            try:
                result = func(*args, **kwargs)
                span.set_status(trace.StatusCode.OK)
                request_counter.add(1, {"status": "success", "function": func.__name__})
                return result
            except Exception as e:
                span.record_exception(e)
                span.set_status(trace.StatusCode.ERROR)
                request_counter.add(1, {"status": "error", "function": func.__name__})
                raise
            finally:
                duration = time.perf_counter() - start
                latency_histogram.record(duration, {"function": func.__name__})
    return wrapper

@observe_request
def deploy_service(service_name: str, version: str):
    # Automatic tracing and metrics!
    ...
```
