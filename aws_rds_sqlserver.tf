module "rds" {
  source                = "./modules/rds_sqlserver"
  vpc_id                = module.vpc.vpc_id
  private_subnet_ids    = module.vpc.private_subnet_ids
  app_security_group_id = module.app_sg.security_group_id
  default_tags          = local.default_tags
}
