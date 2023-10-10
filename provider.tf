terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.20.1"
    }
  }
  required_version = "~> 1.6.0"
}

provider "aws" {
  region  = var.region
}
