variable "aws_region" {
  description = "AWS region"
  type        = string
}


variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the application"
  type        = string
}

variable "container_port" {
  description = "Port the container listens on (used in ECS)"
  type        = number
}

variable "project_name" {
  description = "default project name"
  type        = string
}
