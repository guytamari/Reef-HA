variable "domain_name" {
  description = "The domain name for the hosted zone"
  type        = string
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}

variable "alb_dns_name" {
  description = "DNS name of the ALB"
  type        = string
}

variable "alb_zone_id" {
  description = "Zone ID of the ALB"
  type        = string
}

variable "certificate_validation_records" {
  description = "List of certificate validation records"
  type = list(object({
    name  = string
    value = string
    type  = string
  }))
  default = []
} 


# record from route53: _a1b131a6cc4a37c48f45a5520c8cf7f7.xlfgrmvvlj.acm-validations.aws.
# record from route53:_a1b131a6cc4a37c48f45a5520c8cf7f7.xlfgrmvvlj.acm-validations.aws.

# record from route53: _bcf3080ba4e656139c2ef1dac3287bc1.hello-world.org
# record from acm: _bcf3080ba4e656139c2ef1dac3287bc1.hello-world.org.
