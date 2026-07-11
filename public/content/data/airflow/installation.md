# Apache Airflow — Getting Set Up

## Fastest start: Docker Compose (the officially recommended way to try Airflow)

```bash
# Download the official docker-compose.yaml from the Apache Airflow project
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/stable/docker-compose.yaml'

mkdir -p ./dags ./logs ./plugins ./config
echo -e "AIRFLOW_UID=$(id -u)" > .env    # avoids permission issues on Linux

docker compose up airflow-init   # one-time initialization
docker compose up                # starts the webserver, scheduler, and other services
```

Access the web UI at `localhost:8080` (default credentials are set during `airflow-init` — check the compose file/output for the specifics of your version, since this has changed across Airflow releases). This is the officially documented, recommended path for trying Airflow locally, and it closely mirrors how Airflow actually runs in production (multiple coordinated services), unlike a bare pip install running everything in one process.

## Local pip install (works, but a heavier setup for a full production-like environment)

```bash
python3 -m venv airflow-env
source airflow-env/bin/activate

export AIRFLOW_HOME=~/airflow
AIRFLOW_VERSION=2.9.0   # check the current stable version before installing
PYTHON_VERSION="$(python3 --version | cut -d' ' -f2 | cut -d'.' -f1-2)"
CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"

pip install "apache-airflow==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"
```

**The constraints file matters — don't skip it.** Airflow has a large, specific set of dependency version requirements; installing without the matching constraints file is a common, real source of dependency conflicts that the constraints file exists specifically to prevent. This isn't optional best practice, it's the officially documented, correct installation method.

```bash
airflow db migrate          # initialize the metadata database
airflow users create --username admin --password admin --firstname A --lastname B --role Admin --email admin@example.com
airflow webserver --port 8080 &
airflow scheduler &
```

## Your first DAG file

```python
# ~/airflow/dags/hello_world.py
from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

def say_hello():
    print("Hello from Airflow")

with DAG("hello_world", start_date=datetime(2024, 1, 1), schedule="@daily", catchup=False) as dag:
    task = PythonOperator(task_id="say_hello", python_callable=say_hello)
```

Airflow automatically picks up any `.py` file in its configured `dags/` folder — no separate registration step needed beyond placing the file correctly and waiting for the scheduler to pick it up (this can take a minute or two by default, a common source of "why isn't my new DAG showing up yet" confusion for people expecting it instantly).
