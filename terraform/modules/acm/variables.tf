variable "domain_name" {
  description = "Domain name for the certificate"
  type        = string
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}

variable "zone_id" {
  description = "Route53 zone ID for certificate validation"
  type        = string
} 