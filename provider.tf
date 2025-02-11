terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.86.1"
    }
  }
  required_version = "~> 1.10.0"
}

provider "aws" {
  region = var.region
}
