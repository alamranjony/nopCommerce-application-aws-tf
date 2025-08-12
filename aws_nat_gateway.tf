module "nat_gateway" {
depends_on = [ module.vpc ]

  source             = "./modules/nat_gateway"
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnets
  private_subnet_ids = module.vpc.private_subnet_ids
  default_tags       = local.default_tags
}
