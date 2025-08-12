module "app_sg" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "ec2_autoscaling" {
  depends_on = [ module.vpc, module.app_sg, module.alb ]

  source             = "./modules/ec2_autoscaling"
  name_prefix        = "drinkspot-app"
  ami_id             = "ami-0eb02432ae8c04164"           //Ubuntu-AMI-ID=> ami-02c7683e4ca3ebf58
  instance_type      = "t3.xlarge"
  key_name           = "stackfood-dev-key-pair-sydney"
  security_group_ids = [module.app_sg.security_group_id]
  private_subnet_ids = module.vpc.private_subnet_ids
  vpc_id             = module.vpc.vpc_id
  desired_capacity   = 2
  min_size           = 1
  max_size           = 2
  default_tags       = local.default_tags

  target_group_arns = [module.alb.target_group_arn]
}
