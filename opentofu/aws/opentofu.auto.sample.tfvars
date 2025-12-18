# Copy this and paste it as 'opentofu.auto.tfvars', then fill in the values.
access_key = "value"
secret_key = "value"
region     = "ap-southeast-1"

vpc_cidr_block = "10.30.0.0/20"
public_subnet_cidr_block = "10.30.0.0/22"
private_subnet_cidr_block = "10.30.4.0/22"

wireguard_server_private_ips = ["10.30.1.5", "10.30.1.6", "10.30.1.7"]
ssh_key_public_path = "~/.ssh/id_rsa.pub"