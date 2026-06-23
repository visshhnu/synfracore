# AWS RDS & Databases Certification Guide

## Primary Certification

**AWS Certified Database Specialty (DBS-C01)**

*Format*: 65 questions | 180 minutes | 750/1000 | $300 USD (DB Specialty)

## Related Certifications

- AWS Solutions Architect (databases are 10-15% of SAA)
- AWS DevOps Engineer Professional

## Key Exam Topics

- Multi-AZ vs Read Replicas: HA vs performance (Multi-AZ = sync standby, no reads)
- Aurora: 6-copy replication across 3 AZs, up to 15 read replicas, 5x faster than MySQL
- Aurora Global Database: cross-region replication < 1 second RPO
- Aurora Serverless v2: auto-scales capacity in fine-grained increments
- RDS Proxy: connection pooling for Lambda/containers, reduce DB connection overhead
- Backup: automated (1-35 days retention) + manual snapshots (kept until deleted)
- Encryption: enable at creation (cannot add later); use KMS CMK for cross-account

## Must-Know CLI Commands

```bash
aws rds describe-db-instances
aws rds create-db-instance --db-instance-identifier mydb --engine mysql --db-instance-class db.t3.medium --master-username admin --master-user-password secret --allocated-storage 20
aws rds create-db-snapshot --db-instance-identifier mydb --db-snapshot-identifier mydb-snap-20240115
aws rds restore-db-instance-from-db-snapshot --db-instance-identifier mydb-restored --db-snapshot-identifier mydb-snap-20240115
aws rds create-db-instance-read-replica --db-instance-identifier mydb-replica --source-db-instance-identifier mydb
```

## Exam Tips

- Multi-AZ failover: automatic, ~60-120 seconds; DNS updates to standby
- Read Replica: manual promotion (takes time); useful for disaster recovery too
- Aurora failover: ~30 seconds (faster than RDS) — promotes existing replica
- RDS Proxy: group Lambda concurrency connections → prevents "too many connections"

## Study Plan

**Week 1-2**: Read official docs + overview/fundamentals sections in this platform
**Week 3-4**: Hands-on labs (AWS free tier / Azure sandbox / GCP free tier)
**Week 5**: Practice exams (TutorialsDojo, ExamTopics, Whizlabs)
**Final days**: Review weak areas + cheatsheet

## Free Study Resources

- AWS: aws.amazon.com/training — free digital courses
- Azure: learn.microsoft.com — Microsoft Learn (free + sandbox labs)
- GCP: cloud.google.com/training — free courses + Qwiklabs credits
- TutorialsDojo: cheat sheets for all exams (best value paid resource)

## Revision Notes
```
PRIMARY EXAM: AWS Certified Database Specialty (DBS-C01)

TOP TOPICS:
  Multi-AZ vs Read Replicas: HA vs performance (Multi-AZ = sync standby, no reads)
  Aurora: 6-copy replication across 3 AZs, up to 15 read replicas, 5x faster than 
  Aurora Global Database: cross-region replication < 1 second RPO
  Aurora Serverless v2: auto-scales capacity in fine-grained increments
```
