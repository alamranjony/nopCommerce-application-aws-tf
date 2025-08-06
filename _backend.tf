# terraform {
#   backend "s3" {
#     bucket         = "nop-tfstate"
#     key            = "drinkspot/terraform.tfstate"
#     region         = "ap-southeast-1"
#     encrypt        = true
#     assume_role = {
#       role_arn = "arn:aws:iam::533267397949:role/terraform-state-access"
#     }
#   }
# }

terraform {
  backend "s3" {
    bucket       = "nop-tfstate"
    key          = "drinkspot/terraform.tfstate"
    region       = "ap-southeast-1"
    encrypt      = true
    use_lockfile = true #S3 native locking
  }
}
