terraform {
  required_providers {
    hcloud = {
      source = "opentofu/hcloud"
      version = "~>1.57.0"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

