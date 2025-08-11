module "s3" {
  source        = "./modules/s3_bucket"
  bucket_name   = "drinkspot-${terraform.workspace}-static"
  default_tags  = local.default_tags
}

