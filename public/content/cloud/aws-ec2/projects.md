# AWS EC2 -- Portfolio Projects

---

## Project 1: HA Web Server with ALB and Auto Scaling

**Level:** Beginner | **Time:** 1-2 days | **GitHub:** `aws-ha-webserver`

ALB distributing traffic across EC2 in 2 AZs with Auto Scaling at 70% CPU threshold.

```hcl
resource "aws_launch_template" "web" {
  name_prefix   = "web-lt-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum install -y nginx
    systemctl start nginx
    echo "<h1>Hello from $(hostname)</h1>" > /usr/share/nginx/html/index.html
    EOF
  )
}

resource "aws_autoscaling_group" "web" {
  min_size             = 2
  max_size             = 10
  desired_capacity     = 2
  vpc_zone_identifier  = module.vpc.private_subnets
  target_group_arns    = [aws_lb_target_group.web.arn]
  health_check_type    = "ELB"
  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_policy" "cpu" {
  name                   = "cpu-tracking"
  autoscaling_group_name = aws_autoscaling_group.web.name
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 70.0
  }
}
```

**Steps:** VPC with private subnets, ALB in public, test with stress command, verify auto-scaling

---

## Project 2: Golden AMI Pipeline with EC2 Image Builder

**Level:** Intermediate | **Time:** 2 days | **GitHub:** `aws-golden-ami-pipeline`

Automated golden AMI with pre-installed packages, hardening, and multi-region distribution.

```hcl
resource "aws_imagebuilder_image_recipe" "web" {
  name         = "web-server-ubuntu22"
  version      = "1.0.0"
  parent_image = "arn:aws:imagebuilder:ap-south-1:aws:image/ubuntu-server-22-lts-x86/x.x.x"

  component {
    component_arn = aws_imagebuilder_component.hardening.arn
  }
}
```

**Steps:** Image Builder pipeline, component scripts, weekly schedule, SNS on completion, update ASG

---

## Portfolio Checklist
- [ ] All infrastructure in Terraform (no console clicks)
- [ ] EC2 in private subnets (no direct internet access)
- [ ] Access via Systems Manager Session Manager (no SSH keys)
- [ ] Auto Scaling tested with load test
- [ ] CloudWatch alarms: CPU, disk, unhealthy hosts
