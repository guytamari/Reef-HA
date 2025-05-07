# Hello World Web Application

This project demonstrates a complete CI/CD pipeline for deploying a "Hello World" web application using AWS, Terraform, and GitHub Actions.

## Architecture

- **Application**: Simple Flask web application serving "Hello World"
- **Infrastructure**: AWS ECS, ECR, ALB, ACM, and VPC
- **CI/CD**: GitHub Actions for automated deployment
- **Infrastructure as Code**: Terraform for AWS resource provisioning

## Prerequisites

1. AWS Account with appropriate permissions
2. GitHub Account
3. Domain name (for HTTPS)

## Setup Instructions

### 1. AWS Credentials

1. Create an IAM user with the following permissions:

   - AmazonECR-FullAccess
   - AmazonECS-FullAccess
   - AmazonVPCFullAccess
   - AmazonRoute53FullAccess
   - AmazonCertificateManagerFullAccess
   - AmazonElasticLoadBalancingFullAccess

2. Generate access keys for the IAM user

### 2. GitHub Repository Setup

1. Fork this repository
2. Add the following secrets to your repository:
   - `AWS_ACCESS_KEY_ID`: Your AWS access key
   - `AWS_SECRET_ACCESS_KEY`: Your AWS secret key

### 3. Domain Setup

1. Register a domain name (if you don't have one)
2. Create a hosted zone in Route 53
3. Update the `domain_name` variable in `terraform/variables.tf`

## Deployment

The application will automatically deploy when you push to the main branch. The pipeline will:

1. Build and push the Docker image to ECR
2. Initialize and apply Terraform configuration
3. Deploy the application to ECS

## Accessing the Application

Once deployed, you can access the application at:

```
https://your-domain-name
```

## Infrastructure Details

- **VPC**: Custom VPC with public and private subnets
- **ECS**: Fargate cluster with service
- **ALB**: Application Load Balancer with HTTPS
- **ACM**: SSL/TLS certificate
- **ECR**: Container registry for the application

## Cleanup

To destroy the infrastructure:

1. Navigate to the terraform directory
2. Run `terraform destroy`

## Security Considerations

- All sensitive data is stored in GitHub Secrets
- HTTPS is enforced through ACM
- Private subnets for ECS tasks
- Security groups restrict access

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request
