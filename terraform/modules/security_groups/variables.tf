variable "container_port" {
  description = "Port the container listens on (used in ECS)"
  type        = number
}

variable "project_name" {
  description = "default project name"
  type        = string
}

variable "vpc_id" {
  description = "vpc id"
  type        = string
}
