# Google Cloud Run Certification Guide

## Primary Certification

**Google Cloud Professional Cloud Developer**

*Format*: 50-60 MCQ | 2 hours | 70%+ | $200 USD

## Related Certifications

- Google Associate Cloud Engineer

## Key Exam Topics

- Cloud Run: serverless containers; scales to zero; pay per request (100ms billing)
- Cloud Run Services vs Jobs: Services (HTTP requests) vs Jobs (one-off tasks)
- Traffic splitting: deploy new revision → split traffic % for canary or blue-green
- Concurrency: max concurrent requests per container instance (default 80, max 1000)
- Cold starts: 0 min instances = scales to zero (cost-efficient but adds latency)
- VPC Connector: access private VPC resources (Cloud SQL, Redis, internal services)
- Cloud Run vs Cloud Functions vs GKE: choose based on complexity and scale

## Must-Know CLI Commands

```bash
gcloud run deploy myservice --image gcr.io/PROJECT/myapp:latest --platform managed --region us-central1 --allow-unauthenticated
gcloud run services update-traffic myservice --to-revisions REVISION=50,LATEST=50
gcloud run services describe myservice --format="value(status.url)"
gcloud run jobs create my-job --image gcr.io/PROJECT/batch:latest --tasks 100 --max-retries 3
gcloud run jobs execute my-job --wait
```

## Exam Tips

- IAM authentication: Cloud Run invoker role — or --allow-unauthenticated for public
- Environment variables and secrets: use Secret Manager (--set-secrets), not env vars
- Binary Authorization: ensure only trusted images can be deployed
- Cloud Run min-instances: set > 0 to eliminate cold starts (costs $$)

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
PRIMARY EXAM: Google Cloud Professional Cloud Developer

TOP TOPICS:
  Cloud Run: serverless containers; scales to zero; pay per request (100ms billing
  Cloud Run Services vs Jobs: Services (HTTP requests) vs Jobs (one-off tasks)
  Traffic splitting: deploy new revision → split traffic % for canary or blue-gree
  Concurrency: max concurrent requests per container instance (default 80, max 100
```
