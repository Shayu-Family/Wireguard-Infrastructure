terraform {
  backend "s3" {
    bucket   = "shayu-tfstate"
    endpoint = "https://fsn1.your-objectstorage.com"
    key      = "wireguard-infrastructure/terraform.tfstate"

    region                      = "main"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
  }

  required_providers {
    hcloud = {
      source  = "opentofu/hcloud"
      version = "~>1.57.0"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

