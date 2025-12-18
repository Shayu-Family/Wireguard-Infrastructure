#region AWS Secrets

variable "region" {
  type        = string
  description = "The AWS region to deploy resources in."
  default = "ap-southeast-1"
}

variable "access_key" {
  type        = string
  description = "The AWS access key ID."
}

variable "secret_key" {
  type        = string
  description = "The AWS secret access key."
}

#endregion

#region Networking

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "public_subnet_cidr_block" {
  type        = string
  description = "A list of CIDR blocks for public subnets."
}

variable "private_subnet_cidr_block" {
  type        = string
  description = "A list of CIDR blocks for private subnets."
}

#endregion

variable "ssh_key_public_path" {
  type        = string
  description = "The file path to the SSH public key."
}

variable "wireguard_server_private_ips" {
  type        = list(string)
  description = "A list of private IP addresses for the Wireguard server."
}