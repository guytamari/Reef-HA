output "ecr_repository_url" {
  value = module.ecr.repository_url
}
output "ecr_repository_name" {
  value = module.ecr.repository_name
}


output "ecs_cluster_name" {
  value = module.ecs.cluster_name
}

output "ecs_service_name" {
  value = module.ecs.service_name
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "alb_zone_id" {
  value = module.alb.alb_zone_id
}

output "https_url" {
  value = "https://${var.domain_name}"
}