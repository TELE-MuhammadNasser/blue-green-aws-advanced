

# Blue-Green Deployment on AWS — Advanced

Zero-downtime deployment using ECS Fargate, ALB, CloudWatch, and Terraform.

## Architecture

| Component | Technology |
|-----------|-----------|
| Compute | AWS ECS Fargate |
| Load Balancer | AWS ALB |
| Container Registry | AWS ECR |
| Monitoring | AWS CloudWatch |
| Infrastructure | Terraform |
| CI/CD | GitHub Actions |
| Network | Custom VPC + Subnets |

## How It Works

1. Blue service runs v1 and receives 100% traffic
2. Green service deploys v2 in parallel
3. ALB switches traffic from Blue to Green in seconds
4. Zero downtime — users never notice the update

## Screenshots

### ECS Cluster — Blue & Green Services Running
![ECS Cluster](docs/Screenshot%20from%202026-04-28%2019-02-40.png)

### Blue Service — Health & Metrics
![Blue Service](docs/Screenshot%20from%202026-04-28%2019-03-24.png)

### Green Service — Healthy & Active
![Green Service](docs/Screenshot%20from%202026-04-28%2019-03-52.png)

### Application Load Balancer — Traffic Switched to Green
![ALB](docs/Screenshot%20from%202026-04-28%2019-05-30.png)

### CloudWatch Alarm — Error Monitoring
![CloudWatch](docs/Screenshot%20from%202026-04-28%2019-06-35.png)

### Live Demo — Blue-Green Switch
![Demo](docs/Screenshot%20from%202026-04-28%2019-07-52.png)

## Project Structure
blue-green-aws-advanced/
├── app/
│   ├── app.js
│   └── Dockerfile
├── terraform/
│   ├── provider.tf
│   ├── variables.tf
│   ├── backend.tf
│   ├── vpc.tf
│   ├── security.tf
│   ├── ecr.tf
│   ├── alb.tf
│   ├── ecs.tf
│   ├── cloudwatch.tf
│   └── outputs.tf
├── scripts/
│   └── deploy.sh
└── .github/
└── workflows/
└── deploy.yml
## Quick Start

```bash
# Create S3 backend
aws s3api create-bucket --bucket bg-advanced-tfstate --region eu-west-1 \
  --create-bucket-configuration LocationConstraint=eu-west-1

# Deploy infrastructure
cd terraform
terraform init
terraform apply

# Switch traffic to Green
bash scripts/deploy.sh v2
```
