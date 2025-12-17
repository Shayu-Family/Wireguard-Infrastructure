# Wireguard-Infrastructure

OpenTofu and Ansible files for Wireguard VPN Infrastructure

## OpenTofu

Check `opentofu` folder for the supported Cloud Infrastructure.

Each Infrastructure have a `opentofu.auto.sample.tfvars` file, copy it as `opentofu.auto.tfvars` and populate the variables respectively.

Run `tofu init` and `tofu apply` to deploy the infrastructure.