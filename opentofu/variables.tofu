variable "hcloud_token" {
  description = "API token for Hetzner Cloud"
  type        = string
}

#region Security (Access Keys)

variable "ssh_key_public_path" {
  description = "Path to the SSH public key file"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

#endreigon

#region Networking

variable "network_zone" {
  description = "Network zone for the subnets"
  type        = string
  default     = "eu-central"
}

variable "target_datacenter" {
  description = "Datacenter where wireguard resources will be created"
  type        = string
  default     = "fsn1-dc14"
}

variable "network_cidr_block" {
  description = "IP range for the main-network"
  type        = string
  default     = "10.0.0.0/20"
}

variable "public_subnet_cidr_block" {
  description = "IP range for the public subnet in main-network"
  type        = string
  default     = "10.0.0.0/22"
}

variable "private_subnet_cidr_block" {
  description = "IP range for the private subnet in main-network"
  type        = string
  default     = "10.0.4.0/22"
}

#endregion 

#region Wireguard Server

variable "wireguard_server_private_ip" {
  description = "Private IP address for the Wireguard server"
  type        = string
  default     = "10.0.1.5"
}

variable "wireguard_server_private_ip_alias" {
  description = "Aliases for the Wireguard server private IP"
  type    = list(string)
  default = ["10.0.1.6", "10.0.1.7"]
}

variable "wireguard_server_include_public_ipv4" {
  description = "Set to 'true' to include a public IPv4 for the WireGuard server. Additional costs incurs for public IPv4."
  type        = bool
  default     = false
}

variable "wireguard_server_type" {
  description = "Server type for the Wireguard server"
  type        = string
  default     = "cx23"
}

#endregion