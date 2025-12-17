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

#region Singapore Networking

variable "sg_network_ip_range" {
  description = "IP range for the sg-network"
  type        = string
  default     = "10.0.0.0/20"
}

variable "sg_subnet_01_ip_range" {
  description = "IP range for the first subnet in sg-network"
  type        = string
  default     = "10.0.0.0/22"
}

variable "sg_subnet_02_ip_range" {
  description = "IP range for the second subnet in sg-network"
  type        = string
  default     = "10.0.4.0/22"
}

#endregion 

#region Singapore Wireguard Server

variable "sg_wireguard_server_private_ip" {
  description = "Private IP address for the Singapore Wireguard server"
  type        = string
  default     = "10.0.1.5"
}

variable "sg_wireguard_server_private_ip_alias" {
  description = "Aliases for the Singapore Wireguard server private IP"
  type    = list(string)
  default = ["10.0.1.6", "10.0.1.7"]
}

variable "sg_wireguard_server_include_public_ipv4" {
  description = "Set to 'true' to include a public IPv4 for the WireGuard server. Additional costs incurs for public IPv4."
  type        = bool
  default     = false
}

#endregion
