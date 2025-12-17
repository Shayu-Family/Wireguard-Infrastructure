# Copy this and paste it as 'opentofu.auto.tfvars', then fill in the values.

hcloud_token = "your_hetzner_cloud_api_token_here"

sg_network_ip_range = "10.0.0.0/20"
sg_subnet_01_ip_range = "10.0.0.0/22"
sg_subnet_02_ip_range = "10.0.4.0/22"

sg_wireguard_server_private_ip = "10.0.1.5"
sg_wireguard_server_private_ip_alias = ["10.0.1.6", "10.0.1.7"]

# Set to 'true' to include a public IPv4 for the WireGuard server
# NOTE: Additional costs incurs for public IPv4.
sg_wireguard_server_include_public_ipv4 = false


ssh_key_public_path = "~/.ssh/id_rsa.pub"
