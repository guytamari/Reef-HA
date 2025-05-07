output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = aws_lb.this.dns_name
}

output "alb_zone_id" {
  description = "Zone ID of the ALB"
  value       = aws_lb.this.zone_id
}

output "listener_arn" {
  description = "ARN of the ALB listener"
  value       = aws_lb_listener.https.arn
}

output "target_group_arn" {
  description = "ARN of the ALB target group"
  value       = aws_lb_target_group.this.arn
}

output "security_group_id" {
  description = "sg id of the alb"
  value       = var.alb_sg_id
} 