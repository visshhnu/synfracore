# Google BigQuery Certification Guide

## Primary Certification

**Google Cloud Professional Data Engineer**

*Format*: 50-60 MCQ | 2 hours | 70%+ | $200 USD

## Related Certifications

- Google Associate Cloud Engineer
- dbt Analytics Engineer

## Key Exam Topics

- BigQuery architecture: serverless, columnar storage (Dremel), separate compute+storage
- Partitioning: PARTITION BY DATE — prune partitions to scan less data (cost!)
- Clustering: organize data within partitions by column values (filter/group performance)
- Slots: units of compute; on-demand (auto-scale) vs reservations (flat-rate, predictable)
- BigQuery ML: train ML models in SQL without moving data to separate service
- Authorized views: share query results without sharing underlying table
- Streaming inserts vs batch load: streaming instant but $0.01/200MB; batch free

## Must-Know CLI Commands

```bash
bq query --use_legacy_sql=false --dry_run "SELECT * FROM mydataset.mytable WHERE DATE(ts) = CURRENT_DATE()"
bq load --source_format=NEWLINE_DELIMITED_JSON --autodetect mydataset.mytable gs://bucket/*.json
bq mk --table --time_partitioning_field=created_at --clustering_fields=region,service mydataset.events schema.json
bq extract --destination_format=CSV mydataset.mytable gs://bucket/export-*.csv
bq show --format=prettyjson mydataset.mytable
```

## Exam Tips

- Cost = data scanned: always SELECT needed columns, always filter on partition column
- Clustering is free but reduces scan if filtering/grouping on cluster columns
- INFORMATION_SCHEMA: query metadata about jobs, tables, partitions, reservations
- BigQuery Omni: query AWS S3 / Azure Blob without copying data to GCP

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
PRIMARY EXAM: Google Cloud Professional Data Engineer

TOP TOPICS:
  BigQuery architecture: serverless, columnar storage (Dremel), separate compute+s
  Partitioning: PARTITION BY DATE — prune partitions to scan less data (cost!)
  Clustering: organize data within partitions by column values (filter/group perfo
  Slots: units of compute; on-demand (auto-scale) vs reservations (flat-rate, pred
```
