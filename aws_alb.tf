module "alb" {
  source       = "./modules/alb"
  name_prefix  = "drinkspot-app"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.public_subnets
  default_tags = local.default_tags
}
