# AWS S3 -- Portfolio Projects

---

## Project 1: Static Site with CloudFront CDN and CI/CD

**Level:** Beginner | **Time:** 1 day | **GitHub:** `aws-static-site-cloudfront`

React/HTML site on S3 distributed via CloudFront with GitHub Actions auto-deployment.

```hcl
resource "aws_s3_bucket_public_access_block" "website" {
  bucket                  = aws_s3_bucket.website.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_cloudfront_distribution" "website" {
  origin {
    domain_name            = aws_s3_bucket.website.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.website.id
  }
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    viewer_protocol_policy = "redirect-to-https"
    default_ttl            = 3600
  }
  custom_error_response {
    error_code         = 404
    response_code      = 200
    response_page_path = "/index.html"
  }
}
```

```yaml
# GitHub Actions deploy
- name: Deploy to S3
  run: aws s3 sync ./dist/ s3://$BUCKET_NAME --delete
- name: Invalidate CloudFront
  run: aws cloudfront create-invalidation --distribution-id $CF_ID --paths "/*"
```

**Steps:** S3 + CloudFront via Terraform, GitHub Actions pipeline, custom domain, measure CDN speedup

---

## Project 2: S3 Event Processing Pipeline

**Level:** Intermediate | **Time:** 2 days | **GitHub:** `aws-s3-data-pipeline`

CSV upload triggers Lambda, validates data, routes to processed or errors bucket.

```python
def lambda_handler(event, context):
    bucket = event["Records"][0]["s3"]["bucket"]["name"]
    key    = event["Records"][0]["s3"]["object"]["key"]

    content = s3.get_object(Bucket=bucket, Key=key)["Body"].read().decode()
    reader = csv.DictReader(io.StringIO(content))

    valid, errors = [], []
    for i, row in enumerate(reader, 1):
        if not row.get("email") or "@" not in row["email"]:
            errors.append({"row": i, "error": "Invalid email"})
            continue
        valid.append(row)

    s3.put_object(Bucket=bucket, Key=key.replace("raw/", "processed/"),
                  Body=json.dumps(valid))
    if errors:
        s3.put_object(Bucket=bucket, Key=key.replace("raw/", "errors/"),
                      Body=json.dumps(errors))
        sns.publish(TopicArn=SNS_ARN, Message=f"{len(errors)} rows failed validation in {key}")
```

**Steps:** 3 buckets (raw/processed/errors), S3 event notification, test with valid + invalid CSV

---

## Portfolio Checklist
- [ ] All S3 buckets have public access blocked
- [ ] Server-side encryption enabled
- [ ] Versioning on critical data buckets
- [ ] S3 Lifecycle rules to manage costs
