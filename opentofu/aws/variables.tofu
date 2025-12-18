#region Secrets

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