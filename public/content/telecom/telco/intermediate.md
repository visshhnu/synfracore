k elements. What software version is running on base station 4532? What parameters are configured? CMDB (Configuration Management Database) answers this.

- **Performance Management** — collect KPIs from network elements. Call drop rate, packet loss, throughput, latency per site. Feeds dashboards for NOC engineers.

- **Inventory Management** — what hardware exists, where, connected to what. UTM manages this for RAN, GPON, Transmission domains.

- **Provisioning** — activate new services automatically. New SIM card activated → OSS configures the network to allow that SIM to connect.


#### BSS — Business Support Systems

BSS manages the **customer and revenue side** of the telco.


- **CRM** — customer records, service history, complaints, churn prediction

- **Billing and Revenue Management** — rate every voice minute, SMS, data MB. Generate bills. Process payments. Handle disputes.

- **Order Management** — new service activation, plan changes, porting numbers, cancellations

- **Product Catalogue** — all available tariff plans, bundles, add-ons


**💡 Key Point**The OSS/BSS integration is where most telco IT projects happen. When a customer complains about call drops, the BSS CRM team needs to correlate with OSS fault management data. These integrations are complex and expensive — this is where DevOps automation delivers massive value.


## 🖥️ TeMIP — HPE Telecom Management Platform›


#### What is TeMIP?

TeMIP (Telecommunications Management Platform) is HPE's fault management solution for telecom networks. It is a **Manager of Managers (MoM)** — it sits above individual Element Management Systems (EMS) and consolidates alarms from all of them into a single view. A major telco might have Nokia, Ericsson, Huawei, and ZTE equipment — TeMIP receives alarms from all of them through Access Modules and presents a unified view to NOC operators.


#### vTeMIP — the virtualised version

vTeMIP is the cloud-native version that runs on Kubernetes/OpenShift. It is a microservices architecture:


| Component | What it does | Technology |
|---|---|---|
| TNS | TeMIP Naming Service — lookup service for all managed network entities. Gives every network element a unique name. Distributes and replicates name data for HA. | Distributed database |
| ACS FM | Alarm Collection Server — subscribes to alarm collections on Operation Contexts (OCs). Multiplexes multiple sources to single subscriptions. Reduces load on each OC. | Java microservice |
| TWS | TeMIP Web Services — N
