variable "project_name" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "alb_sg_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "container_port" {
  type = number
}

variable "acm_certificate_arn" {
  type = string
}
