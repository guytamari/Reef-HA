module "vpc" {
  source = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  project_name         = var.project_name
}

module "security_group" {
  source               = "./modules/security_groups"
  container_port       = var.container_port
  project_name         = var.project_name
  vpc_id               = module.vpc.vpc_id
}

module "route53" {
  source = "./modules/route53"
  domain_name    = var.domain_name
  project_name   = var.project_name
  alb_dns_name   = module.alb.dns_name
  alb_zone_id    = module.alb.zone_id
}

# module "acm" {
#   source = "./modules/acm"
#   domain_name   = var.domain_name
#   project_name  = var.project_name
#   zone_id       = module.route53.zone_id
# }

module "alb" {
  source               = "./modules/alb"
  container_port       = var.container_port
  project_name         = var.project_name
  vpc_id               = module.vpc.vpc_id
  public_subnet_ids    = module.vpc.public_subnet_ids
  alb_sg_id            = module.security_group.alb_sg_id
  acm_certificate_arn  = module.acm.certificate_arn
}

# route53 record:

# _bcf3080ba4e656139c2ef1dac3287bc1.hello-world.org
# _a1b131a6cc4a37c48f45a5520c8cf7f7.xlfgrmvvlj.acm-validations.aws.

# acm:
# _bcf3080ba4e656139c2ef1dac3287bc1.hello-world.org.
# _a1b131a6cc4a37c48f45a5520c8cf7f7.xlfgrmvvlj.acm-validations.aws.

