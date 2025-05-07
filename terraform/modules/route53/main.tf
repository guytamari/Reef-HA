# # create hosted zone in route53

# resource "aws_route53_zone" "main" {
#   name = var.domain_name

#   tags = {
#     Name    = "${var.project_name}-zone"
#   }
# }

# get the id of the zone
data "aws_route53_zone" "main" {
  name         = var.domain_name
  private_zone = false
}

# create a record for alb
resource "aws_route53_record" "app" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id               = var.alb_zone_id
    evaluate_target_health = true
  }
} 