terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.99.1"
    }
  }
  required_version = "~> 1.12.0"
}

provider "aws" {
  region = var.region
}
