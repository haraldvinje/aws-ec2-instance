terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.54.0"
    }
  }
  required_version = "~> 1.3.3"
}

provider "aws" {
  region  = var.region
  profile = var.profile
}