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

module "iam" {
  source               = "./modules/iam"
  project_name         = var.project_name
}

module "route53" {
  source = "./modules/route53"
  domain_name    = var.domain_name
  project_name   = var.project_name
  alb_dns_name   = module.alb.alb_dns_name
  alb_zone_id    = module.alb.alb_zone_id
}

module "acm" {
  source = "./modules/acm"
  domain_name   = var.domain_name
  project_name  = var.project_name
  zone_id       = module.route53.zone_id
}

module "alb" {
  source               = "./modules/alb"
  container_port       = var.container_port
  project_name         = var.project_name
  vpc_id               = module.vpc.vpc_id
  public_subnet_ids    = module.vpc.public_subnet_ids
  alb_sg_id            = module.security_group.alb_sg_id
  acm_certificate_arn  = module.acm.certificate_arn
  certificate_validation_arn = module.acm.certificate_validation_arn
}

module "ecr" {
  source               = "./modules/ecr"
  project_name         = var.project_name
}

module "ecs" {
  source               = "./modules/ecs"
  project_name         = var.project_name
  container_port       = var.container_port
  private_subnet_ids   = module.vpc.private_subnet_ids
  ecs_sg_id            = module.security_group.ecs_sg_id
  ecr_repository_url   = module.ecr.repository_url
  alb_target_group_arn = module.alb.target_group_arn
  alb_listener_arn     = module.alb.listener_arn
  ecs_execution_role_arn = module.iam.ecs_execution_role_arn
  ecs_task_role_arn     = module.iam.ecs_task_role_arn
}

