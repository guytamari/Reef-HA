variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}


variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "hello-world-app"
}

variable "domain_name" {
  description = "Domain name for the application"
  type        = string
  default     = "hello-world-reef.com"
}

variable "container_port" {
  description = "Port the container listens on (used in ECS)"
  type        = number
  default     = 80
}

variable "project_name" {
  description = "default project name"
  type        = string
  default     = "Reef-ha-hello"
}
