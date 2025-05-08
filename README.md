# DevOps Home Assignment: "Hello World" Web App on AWS

This project deploys a publicly accessible "Hello World" web app over HTTPS using Terraform, ECS, and GitHub Actions.

## Project Structure

- **Dockerfile**: Builds a simple HTTP server that returns "Hello World."
- **terraform/**: Contains Terraform code to provision AWS infrastructure.
- **.github/workflows/ci-cd.yml**: Defines the CI/CD pipeline using GitHub Actions.

## Requirements

Before getting started, make sure you have the following:

- **AWS Access Key ID** and **AWS Secret Access Key** with sufficient privileges (to be added as GitHub Secrets).
- An **S3 Bucket** to store Terraform state files.
- A registered domain name.

---

## Step-by-Step Setup Guide

### 1. Configure AWS Credentials

You will need AWS credentials with sufficient permissions to manage ECS, ALB, ECR, etc. Once you have the credentials:

- Go to your GitHub repository's **Settings > Secrets**.
- Add the following secrets:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `AWS_REGION` (e.g., `us-east-1`)
  - `TF_S3_BUCKET` (your S3 bucket name for Terraform state)
  - `TF_S3_KEY` (your S3 key for Terraform state)

### 2. Configure Terraform Variables

Inside the `terraform/` folder, there are two example files:

- `terraform.tfvars.example`: Contains variable values for your project.
- `backend.tfvars.example`: Contains backend configuration for storing the Terraform state in S3.

To proceed:

1. Copy these example files to `terraform.tfvars` and `backend.tfvars`:

   ```bash
   cp terraform/terraform.tfvars.example terraform/terraform.tfvars
   cp terraform/backend.tfvars.example terraform/backend.tfvars
   ```

2. Update the values in these files to match your environment:
   - **terraform.tfvars**: Modify the values such as `aws_region`, `vpc_cidr`, `public_subnet_cidrs`, `domain_name`, etc., according to your desired configuration.
   - **backend.tfvars**: Set your **S3 bucket name** and **S3 key** for Terraform state storage.

### 3. Set Up CI/CD Pipeline

The CI/CD pipeline is defined in `.github/workflows/ci-cd.yml`. Here's what it does:

- **Builds** and **pushes** the Docker image to AWS ECR.
- **Initializes** and **applies** Terraform to provision infrastructure.
- **Deploys** the new image to ECS.

This pipeline is triggered on every push to the `main` branch.

### 4. Run Terraform

Once the variables are configured, initialize Terraform with the following command:

```bash
terraform init -backend-config="bucket=<your-s3-bucket-name>"                -backend-config="key=<your-s3-key>"                -backend-config="region=<your-region>"
```

This will initialize Terraform with the S3 backend configuration. Then, apply the configuration to provision the infrastructure:

```bash
terraform apply -auto-approve
```

### 5. Trigger the CI/CD Pipeline

Once you push your changes to the `main` branch, the pipeline will run automatically. This will:

- Build and push your Docker image to ECR.
- Provision the necessary AWS infrastructure with Terraform.
- Deploy your application to ECS.

### 6. Access the Web App

After the pipeline completes successfully, your "Hello World" app will be publicly accessible over HTTPS via the Application Load Balancer (ALB). Use the domain you've configured in `terraform.tfvars` to access the app.

---

## Cleanup

To destroy the infrastructure, run the following Terraform command:

```bash
terraform destroy -auto-approve
```

---

### Notes

- Make sure your AWS IAM role used for Terraform has sufficient permissions to create and manage all the resources (ECS, ALB, ECR, ACM, Route 53, etc.).
- If you need to change any configurations, you can modify the `terraform.tfvars` file and re-run `terraform apply` to update the infrastructure.
- Ensure your S3 bucket for Terraform state files exists before running the pipeline.

---
