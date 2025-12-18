terraform {
  required_providers {
    aws = {
      source = "opentofu/aws"
      version = "~>6.27.0"
    }
  }
}

provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}