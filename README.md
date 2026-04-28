# Blue-Green Deployment on AWS — Advanced

Zero-downtime deployment using ECS Fargate, ALB, CloudWatch, and Terraform.

## Tools Used

- AWS ECS Fargate — runs containers without managing servers
- AWS ALB — routes traffic between Blue and Green
- AWS ECR — stores Docker images
- AWS CloudWatch — monitors errors and performance
- Terraform — infrastructure as code
- GitHub Actions — CI/CD pipeline

## How It Works

1. Blue service runs v1 and receives 100% traffic
2. Green service deploys v2 in parallel
3. ALB switches traffic from Blue to Green in seconds
4. Zero downtime — users never notice the update

## Screenshots

### ECS Cluster
![ECS](docs/Screenshot%20from%202026-04-28%2019-02-40.png)

### Load Balancer
![ALB](docs/Screenshot%20from%202026-04-28%2019-05-30.png)

### CloudWatch Monitoring
![CloudWatch](docs/Screenshot%20from%202026-04-28%2019-06-35.png)

### Live Demo
![Demo](docs/Screenshot%20from%202026-04-28%2019-07-52.png)
