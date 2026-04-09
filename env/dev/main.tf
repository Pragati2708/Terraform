module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}
module "ecs" {
  source = "../../modules/ecs"

  vpc_id            = module.vpc.vpc_id
  private_subnets   = module.vpc.private_subnets
  target_group_arn  = module.alb.target_group_arn
}
module "ecr" {
  source = "../../modules/ecr"
}
output "repository_url" {
  value = module.ecr.repository_url
}
module "alb" {
  source = "../../modules/alb"

  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}
output "alb_dns" {
  value = module.alb.alb_dns
}
#