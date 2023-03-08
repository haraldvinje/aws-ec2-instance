terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.1"
    }
  }
  required_version = "~> 1.4.0"
}

provider "aws" {
  region  = var.region
  profile = var.profile
}
