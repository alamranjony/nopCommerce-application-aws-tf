locals {
  company_name = "drinkspot"

  aws_region     = data.aws_region.current.id
  aws_account_id = data.aws_caller_identity.current.account_id
  env            = terraform.workspace

  env_code_branches = {
    "dev"  = "develop",
    "stg"  = "stage",
    "prod" = "main"
  }

  env_code_branch  = local.env_code_branches[local.env]
  assume_role_name = "infra-deploy"


  default_tags = {
    env        = terraform.workspace
    created_by = "terraform"
  }
}
