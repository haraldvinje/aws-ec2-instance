terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.32.1"
    }
  }
  required_version = "~> 1.7.0"
}

provider "aws" {
  region  = var.region
}
