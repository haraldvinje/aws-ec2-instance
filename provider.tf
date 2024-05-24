terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.51.0"
    }
  }
  required_version = "~> 1.8.0"
}

provider "aws" {
  region = var.region
}
