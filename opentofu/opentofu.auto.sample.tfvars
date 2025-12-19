# Copy this and paste it as 'opentofu.auto.tfvars', then fill in the values.

hcloud_token = "your_hetzner_cloud_api_token_here"

network_zone = "eu-central"
target_datacenter = "fsn1-dc14"

network_cidr_block = "10.0.0.0/20"
public_subnet_cidr_block = "10.0.0.0/22"
private_subnet_cidr_block = "10.0.4.0/22"

wireguard_server_private_ip = "10.0.1.5"
wireguard_server_private_ip_alias = ["10.0.1.6", "10.0.1.7"]

# Set to 'true' to include a public IPv4 for the WireGuard server
# NOTE: Additional costs incurs for public IPv4.
wireguard_server_include_public_ipv4 = false

wireguard_server_type = "cx23"

ssh_key_public_path = "~/.ssh/id_rsa.pub"
