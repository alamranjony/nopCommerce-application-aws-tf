terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.7.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "aws" {
  profile = "lab-test"
  region  = "ap-southeast-2"
  default_tags {
    tags = local.default_tags
  }
}
