output "dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.this.dns_name
}

output "zone_id" {
  description = "the zone id of the alb"
  value       = aws_lb.this.zone_id
}

output "target_group_arn" {
  description = "the arn of the tg"
  value       = aws_lb_target_group.this.arn
}

output "security_group_id" {
  description = "sg id of the alb"
  value       = var.alb_sg_id
} 