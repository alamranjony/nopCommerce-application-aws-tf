data "aws_caller_identity" "current" {}
data "aws_availability_zones" "available" {}

module "vpc" {
  source               = "./modules/vpc"
  vpc_name             = "drinkspot-app-vpc"
  public_subnet_cidrs  = ["10.0.0.0/20", "10.0.16.0/20"]
  private_subnet_cidrs = ["10.0.128.0/20", "10.0.144.0/20"]
  default_tags         = local.default_tags
}