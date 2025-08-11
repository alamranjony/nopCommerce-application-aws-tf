module "cloudfront" {
  source                        = "./modules/cloudfront"
  bucket_name                   = module.s3.bucket_name
  bucket_regional_domain_name   = module.s3.bucket_regional_domain_name
  bucket_arn                    = module.s3.bucket_arn
  default_tags                  = local.default_tags
}
